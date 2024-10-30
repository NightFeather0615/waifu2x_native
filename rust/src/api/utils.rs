use std::sync::OnceLock;

use flutter_rust_bridge::frb;
use ort::{
  ExecutionProvider,
  CPUExecutionProvider,
  CUDAExecutionProvider,
  CoreMLExecutionProvider,
  TensorRTExecutionProvider
};


pub(crate) static CACHE_FOLDER_PATH: OnceLock<String> = OnceLock::new();
pub(crate) static DOCUMENTS_FOLDER_PATH: OnceLock<String> = OnceLock::new();
pub(crate) static DOWNLOADS_FOLDER_PATH: OnceLock<String> = OnceLock::new();
pub(crate) static SUPPORT_FOLDER_PATH: OnceLock<String> = OnceLock::new();
pub(crate) static TEMPORARY_FOLDER_PATH: OnceLock<String> = OnceLock::new();


#[frb(init)]
pub fn init_app() {
  flutter_rust_bridge::setup_default_user_utils();
  ort::init()
    .with_execution_providers([
      CUDAExecutionProvider::default().build(),
      TensorRTExecutionProvider::default().build(),
      CoreMLExecutionProvider::default().build(),
      CPUExecutionProvider::default().build()
    ])
    .commit()
    .unwrap();
}

pub async fn set_folder_path(
  cache_folder_path: &str,
  documents_folder_path: &str,
  downloads_folder_path: &str,
  support_folder_path: &str,
  temporary_folder_path: &str
) {
  CACHE_FOLDER_PATH.get_or_init(|| cache_folder_path.to_string());
  DOCUMENTS_FOLDER_PATH.get_or_init(|| documents_folder_path.to_string());
  DOWNLOADS_FOLDER_PATH.get_or_init(|| downloads_folder_path.to_string());
  SUPPORT_FOLDER_PATH.get_or_init(|| support_folder_path.to_string());
  TEMPORARY_FOLDER_PATH.get_or_init(|| temporary_folder_path.to_string());
}

pub async fn get_image_size(image_path: &str) -> (u32, u32) {
  let img = image::open(image_path).unwrap();

  (img.width(), img.height())
}

pub async fn get_current_device() -> String {
  if CUDAExecutionProvider::default().is_available().unwrap() {
    return "CUDA".to_string();
  } else if TensorRTExecutionProvider::default().is_available().unwrap() {
    return "TensorRT".to_string();
  } else if CoreMLExecutionProvider::default().is_available().unwrap() {
    return "CoreML".to_string();
  } else if CPUExecutionProvider::default().is_available().unwrap() {
    return "CPU".to_string();
  }

  "Unknown".to_string()
}
