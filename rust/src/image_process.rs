use image::{Rgba32FImage, RgbaImage};
use ndarray::{s, Array3};


pub(crate) struct ImageProcess {}

impl ImageProcess {
  pub(crate) fn load_image(path: &str) -> Rgba32FImage {
    image::open(path).unwrap().into_rgba32f()
  }
  
  pub(crate) fn image_to_tensor(image: Rgba32FImage) -> [Array3<f32>; 3] {
    let height = image.height() as usize;
    let width = image.width() as usize;
    let image = image.as_flat_samples().samples;
  
  
    let mut rgb = Array3::zeros((3, height, width));
    let mut alpha1 = Array3::zeros((1, height, width));
    let mut alpha3 = Array3::zeros((3, height, width));
  
    for y in 0 .. height {
      for x in 0 .. width {
        let alpha = image[3 + y * 4 * width + x * 4];
        alpha1[(0, y, x)] = alpha;
        for c in 0 .. 3 {
          rgb[(c, y, x)] = image[c + y * 4 * width + x * 4];
          alpha3[(c, y, x)] = alpha;
        }
      }
    }
  
    return [rgb, alpha1, alpha3];
  }
  
  pub(crate) fn tensor_to_bgra_raw(rgb: &Array3<f32>, alpha3: &Array3<f32>, width: usize, height: usize) -> Vec<u8> {
    let mut image = vec![0; width * height * 4];
  
    for y in 0 .. height {
      for x in 0 .. width {
        let mut alpha = 0.0;
        for c in 0 .. 3 {
          image[(2 - c) + y * 4 * width + x * 4] = (rgb[(c, y, x)] * 255.0).clamp(0.0, 255.0) as u8;
          alpha += alpha3[(c, y, x)] / 3.0;
        }
        image[3 + y * 4 * width + x * 4] = (alpha * 255.0).clamp(0.0, 255.0) as u8;
      }
    }
  
    image
  }
  
  pub(crate) fn tensor_to_image(rgb: &Array3<f32>, alpha3: &Array3<f32>, width: usize, height: usize) -> RgbaImage {
    let mut image = vec![0; width * height * 4];
  
    for y in 0 .. height {
      for x in 0 .. width {
        let mut alpha = 0.0;
        for c in 0 .. 3 {
          image[c + y * 4 * width + x * 4] = (rgb[(c, y, x)] * 255.0).clamp(0.0, 255.0) as u8;
          alpha += alpha3[(c, y, x)] / 3.0;
        }
        image[3 + y * 4 * width + x * 4] = (alpha * 255.0).clamp(0.0, 255.0) as u8;
      }
    }
  
    RgbaImage::from_raw(
      width as u32,
      height as u32,
      image
    ).unwrap()
  }
  
  pub(crate) fn crop_tensor(tensor: &Array3<f32>, x: usize, y: usize, width: usize, height: usize) -> Array3<f32> {
    tensor.slice(
      s![
        ..,
        y..y + height,
        x..x + width
      ]
    ).to_owned()
  }
}
