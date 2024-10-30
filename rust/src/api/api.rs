use flutter_rust_bridge::DartFnFuture;
use ndarray::{Array3, Array4, Axis};
use ort::{inputs, Session};

use crate::{
  image_process::ImageProcess,
  inference::{Inference, PadType},
  seam_blending::SeamBlending,
  texture::FlutterTexture
};

use super::utils::SUPPORT_FOLDER_PATH;


type TilePosition = (usize, usize, usize, usize);


pub enum TaskState {
  Waiting,
  LoadImage,
  Pad,
  LoadModel,
  Inference {
    progress: i32,
    total: i32
  },
  SaveImage,
  Done
}


pub async fn infer_image(
  input_filename: &str,
  input_path: &str,
  output_path: &str,
  texture_ptr: usize,
  arch: &str,
  domain: &str,
  scale: i32,
  denoise: i32,
  tta_level: i32,
  color_stability: bool,
  padding: i32,
  tile_size: i32,
  offset: i32,
  on_state: impl Fn(TaskState) -> DartFnFuture<()>
) {
  on_state(TaskState::LoadImage).await;

  let img = ImageProcess::load_image(
    &format!("{}/{}", input_path, input_filename)
  );

  let height = img.height() as usize;
  let width = img.width() as usize;
  let scale = scale as usize;
  let tta_level = tta_level as i64;
  let tile_size = tile_size as usize;
  let offset = offset as usize;

  let texture = FlutterTexture::new(
    texture_ptr,
    width * scale,
    height * scale
  );

  let [
    mut rgb,
    alpha1,
    mut alpha3
  ] = ImageProcess::image_to_tensor(img);

  let mut seam_blending = SeamBlending::new(
    rgb.dim(),
    scale,
    offset,
    tile_size
  );
  let mut seam_blending_alpha = SeamBlending::new(
    alpha3.dim(),
    scale,
    offset,
    tile_size
  );

  on_state(TaskState::Pad).await;

  let alpha1_padding = Inference::alpha_border_padding(
    rgb,
    alpha1,
    offset
  );
  rgb = Inference::padding(
    alpha1_padding,
    seam_blending.config.pad,
    PadType::from(padding)
  );
  alpha3 = Inference::padding(
    alpha3,
    seam_blending.config.pad,
    PadType::from(padding)
  );

  let mut tiles: Vec<TilePosition> = Vec::with_capacity(
    (seam_blending.config.y_blocks * seam_blending.config.x_blocks) as usize
  );

  for y in 0 .. seam_blending.config.y_blocks {
    for x in 0 .. seam_blending.config.x_blocks {
      tiles.push((
        y * seam_blending.config.input_tile_step,
        x * seam_blending.config.input_tile_step,
        y,
        x
      ));
    }
  }
  
  on_state(TaskState::LoadModel).await;

  let model_name;
  if denoise == -1 {
    model_name = format!("scale{}x", scale);
  } else if scale == 1 {
    model_name = format!("noise{}", denoise);
  } else {
    model_name = format!("noise{}_scale{}x", denoise, scale);
  }

  let session = Session::builder()
    .unwrap()
    .commit_from_file(
      format!(
        "{}/models/{}/{}/{}.onnx",
        SUPPORT_FOLDER_PATH.get().unwrap(),
        arch,
        domain,
        model_name
      )
    )
    .unwrap();

  let alpha_session = Session::builder()
    .unwrap()
    .commit_from_file(
      format!(
        "{}/models/{}/{}/{}.onnx",
        SUPPORT_FOLDER_PATH.get().unwrap(),
        arch,
        domain,
        format!("scale{}x", scale)
      )
    )
    .unwrap();

  for k in 0 .. tiles.len() {
    let (
      input_y,
      input_x,
      tile_y,
      tile_x
    ) = tiles[k];

    on_state(
      TaskState::Inference {
        progress: (k + 1) as i32,
        total: tiles.len() as i32
      }
    ).await;

    let tile_rgb = ImageProcess::crop_tensor(
      &rgb, input_x, input_y, tile_size, tile_size
    );
    let tile_alpha3 = ImageProcess::crop_tensor(
      &alpha3, input_x, input_y, tile_size, tile_size
    );

    let mut tta_tile_rgb = Inference::tta_split(
      tile_rgb,
      tta_level
    );

    let output = session.run(
      inputs![
        "x" => tta_tile_rgb
      ].unwrap()
    ).unwrap();

    let tensor = output["y"].try_extract_raw_tensor::<f32>().unwrap();

    tta_tile_rgb = Array4::from_shape_vec(
      (
        tensor.0[0] as usize,
        tensor.0[1] as usize,
        tensor.0[2] as usize,
        tensor.0[3] as usize
      ),
      tensor.1.to_vec()
    ).unwrap();

    let tile_rgb_output = Inference::tta_merge(
      tta_tile_rgb,
      tta_level
    );

    let output = alpha_session.run(
      inputs![
        "x" => tile_alpha3.insert_axis(Axis(0))
      ].unwrap()
    ).unwrap();

    let tensor = output["y"].try_extract_raw_tensor::<f32>().unwrap();

    let tile_alpha3_output = Array3::from_shape_vec(
      (
        tensor.0[1] as usize,
        tensor.0[2] as usize,
        tensor.0[3] as usize
      ),
      tensor.1.to_vec()
    ).unwrap();

    seam_blending.update(tile_rgb_output, tile_x, tile_y);
    seam_blending_alpha.update(tile_alpha3_output, tile_x, tile_y);

    texture.on_rgba(
      &ImageProcess::tensor_to_bgra_raw(
        &seam_blending.buffer,
        &seam_blending_alpha.buffer,
        width * scale,
        height * scale
      ),
      width * scale,
      height * scale
    );
  }

  on_state(TaskState::SaveImage).await;

  ImageProcess::tensor_to_image(
    &seam_blending.buffer,
    &seam_blending_alpha.buffer,
    width * scale,
    height * scale
  ).save(
    format!(
      "{}/{}_waifu2x_{}.png",
      output_path,
      input_filename.split(".").next().unwrap_or("untitled"),
      model_name
    )
  ).unwrap();

  on_state(TaskState::Done).await;
}
