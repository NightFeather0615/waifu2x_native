use std::sync::OnceLock;

use ndarray::{Array0, Array3, Array4, Axis};
use ort::{inputs, Session};

use crate::api::utils::SUPPORT_FOLDER_PATH;


pub(crate) type Pad = (usize, usize, usize, usize);


pub(crate) enum PadType {
  Default,
  Replication,
  Reflection
}

impl From<i32> for PadType {
  fn from(value: i32) -> Self {
    match value {
      1 => Self::Replication,
      2 => Self::Reflection,
      _ => Self::Default
    }
  }
}


static TTA_SPLIT_SESSION: OnceLock<Session> = OnceLock::new();
static TTA_MERGE_SESSION: OnceLock<Session> = OnceLock::new();
static CREATE_SEAM_BLENDING_FILTER_SESSION: OnceLock<Session> = OnceLock::new();
static ALPHA_BORDER_PADDING_SESSION: OnceLock<Session> = OnceLock::new();
static DEFAULT_PAD_SESSION: OnceLock<Session> = OnceLock::new();
static REPLICATION_PAD_SESSION: OnceLock<Session> = OnceLock::new();
static REFLECTION_PAD_SESSION: OnceLock<Session> = OnceLock::new();


pub(crate) struct Inference {}

impl Inference {
  pub(crate) fn tta_split(x: Array3<f32>, tta_level: i64) -> Array4<f32> {
    let session = TTA_SPLIT_SESSION.get_or_init(
      || Session::builder()
        .unwrap()
        .commit_from_file(
          format!(
            "{}/models/utils/{}",
            SUPPORT_FOLDER_PATH.get().unwrap(),
            "tta_split.onnx"
          )
        )
        .unwrap()
    );

    let output = session.run(
      inputs![
        "x" => x.insert_axis(Axis(0)),
        "tta_level" => Array0::from_elem((), tta_level)
      ].unwrap()
    ).unwrap();
    
    let tensor = output["y"].try_extract_raw_tensor::<f32>().unwrap();

    Array4::from_shape_vec(
      (tensor.0[0] as usize,tensor.0[1] as usize, tensor.0[2] as usize, tensor.0[3] as usize),
      tensor.1.to_vec()
    ).unwrap()
  }

  pub(crate) fn tta_merge(x: Array4<f32>, tta_level: i64) -> Array3<f32> {
    let session = TTA_MERGE_SESSION.get_or_init(
      || Session::builder()
        .unwrap()
        .commit_from_file(
          format!(
            "{}/models/utils/{}",
            SUPPORT_FOLDER_PATH.get().unwrap(),
            "tta_merge.onnx"
          )
        )
        .unwrap()
    );
    
    let output = session.run(
      inputs![
        "x" => x,
        "tta_level" => Array0::from_elem((), tta_level)
      ].unwrap()
    ).unwrap();
    
    let tensor = output["y"].try_extract_raw_tensor::<f32>().unwrap();

    Array3::from_shape_vec(
      (tensor.0[1] as usize, tensor.0[2] as usize, tensor.0[3] as usize),
      tensor.1.to_vec()
    ).unwrap()
  }

  pub(crate) fn create_seam_blending_filter(scale: usize, offset: usize, tile_size: usize) -> Array3<f32> {
    let session = CREATE_SEAM_BLENDING_FILTER_SESSION.get_or_init(
      || Session::builder()
        .unwrap()
        .commit_from_file(
          format!(
            "{}/models/utils/{}",
            SUPPORT_FOLDER_PATH.get().unwrap(),
            "create_seam_blending_filter.onnx"
          )
        )
        .unwrap()
    );
    
    let output = session.run(
      inputs![
        "scale" => Array0::from_elem((), scale as i64),
        "offset" => Array0::from_elem((), offset as i64),
        "tile_size" => Array0::from_elem((), tile_size as i64)
      ].unwrap()
    ).unwrap();
    
    let tensor = output["y"].try_extract_raw_tensor::<f32>().unwrap();

    Array3::from_shape_vec(
      (tensor.0[0] as usize, tensor.0[1] as usize, tensor.0[2] as usize),
      tensor.1.to_vec()
    ).unwrap()
  }

  pub(crate) fn alpha_border_padding(rgb: Array3<f32>, alpha: Array3<f32>, offset: usize) -> Array3<f32> {
    let session = ALPHA_BORDER_PADDING_SESSION.get_or_init(
      || Session::builder()
        .unwrap()
        .commit_from_file(
          format!(
            "{}/models/utils/{}",
            SUPPORT_FOLDER_PATH.get().unwrap(),
            "alpha_border_padding.onnx"
          )
        )
        .unwrap()
    );
    
    let output = session.run(
      inputs![
        "rgb" => rgb,
        "alpha" => alpha,
        "offset" => Array0::from_elem((), offset as i64)
      ].unwrap()
    ).unwrap();

    let tensor = output["y"].try_extract_raw_tensor::<f32>().unwrap();

    Array3::from_shape_vec(
      (tensor.0[0] as usize, tensor.0[1] as usize, tensor.0[2] as usize),
      tensor.1.to_vec()
    ).unwrap()
  }

  pub(crate) fn padding(x: Array3<f32>, pad: Pad, pad_type: PadType) -> Array3<f32> {
    let session = match pad_type {
      PadType::Default => DEFAULT_PAD_SESSION.get_or_init(
        || Session::builder()
          .unwrap()
          .commit_from_file(
            format!(
              "{}/models/utils/{}",
              SUPPORT_FOLDER_PATH.get().unwrap(),
              "pad.onnx"
            )
          )
          .unwrap()
      ),
      PadType::Replication => REPLICATION_PAD_SESSION.get_or_init(
        || Session::builder()
          .unwrap()
          .commit_from_file(
            format!(
              "{}/models/utils/{}",
              SUPPORT_FOLDER_PATH.get().unwrap(),
              "replication_pad.onnx"
            )
          )
          .unwrap()
      ),
      PadType::Reflection => REFLECTION_PAD_SESSION.get_or_init(
        || Session::builder()
          .unwrap()
          .commit_from_file(
            format!(
              "{}/models/utils/{}",
              SUPPORT_FOLDER_PATH.get().unwrap(),
              "reflection_pad.onnx"
            )
          )
          .unwrap()
      ),
    };

    let output = session.run(
      inputs![
        "x" => x.insert_axis(Axis(0)),
        "left" => Array0::from_elem((), pad.0 as i64),
        "right" => Array0::from_elem((), pad.1 as i64),
        "top" => Array0::from_elem((), pad.2 as i64),
        "bottom" => Array0::from_elem((), pad.3 as i64)
      ].unwrap()
    ).unwrap();
    
    let tensor = output["y"].try_extract_raw_tensor::<f32>().unwrap();

    Array3::from_shape_vec(
      (tensor.0[1] as usize, tensor.0[2] as usize, tensor.0[3] as usize),
      tensor.1.to_vec()
    ).unwrap()
  }
}
