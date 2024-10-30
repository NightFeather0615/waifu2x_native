// Refer: https://github.com/momentobooth/momentobooth, https://github.com/fzyzcjy/flutter_rust_bridge/issues/1776

use std::ffi::{c_int, c_void};

use dlopen::{symbor::{Library, Symbol}, Error as LibError};


#[cfg(all(target_os = "windows"))]
lazy_static::lazy_static! {
  pub(crate) static ref TEXTURE_RGBA_RENDERER_PLUGIN: Result<Library, LibError> = Library::open("texture_rgba_renderer_plugin.dll");
}

#[cfg(all(target_os = "linux"))]
lazy_static::lazy_static! {
  pub(crate) static ref TEXTURE_RGBA_RENDERER_PLUGIN: Result<Library, LibError> = Library::open("libtexture_rgba_renderer_plugin.so");
}

#[cfg(all(target_os = "macos"))]
lazy_static::lazy_static! {
  pub(crate) static ref TEXTURE_RGBA_RENDERER_PLUGIN: Result<Library, LibError> = Library::open_self();
}


pub(crate) type FlutterRgbaRendererPluginOnRgba = unsafe extern "C" fn(
  texture_rgba: *mut c_void,
  buffer: *const u8,
  len: c_int,
  width: c_int,
  height: c_int,
  dst_rgba_stride: c_int
);


#[derive(Clone)]
pub(crate) struct FlutterTexture {
  ptr: usize,
  width: usize,
  height: usize,
  on_rgba_func: Option<Symbol<'static, FlutterRgbaRendererPluginOnRgba>>
}

impl FlutterTexture {
  pub(crate) fn new(ptr: usize, width: usize, height: usize) -> Self {
    let on_rgba_func = match &*TEXTURE_RGBA_RENDERER_PLUGIN {
      Ok(lib) => {
        let find_sym_res = unsafe {
          lib.symbol::<FlutterRgbaRendererPluginOnRgba>("FlutterRgbaRendererPluginOnRgba")
        };
        match find_sym_res {
          Ok(sym) => Some(sym),
          Err(_error) => {
            None
          }
        }
      }
      Err(_error) => {
        None
      }
    };

    Self {
      ptr,
      width,
      height,
      on_rgba_func,
    }
  }
}

impl FlutterTexture {
  pub(crate) fn on_rgba(self: &Self, data: &Vec<u8>, width: usize, height: usize) {
    if self.ptr == usize::default() {
      return;
    }

    if self.width != width || self.height != height {
      return;
    }

    if let Some(func) = &self.on_rgba_func {
      unsafe {
        func(
          self.ptr as _,
          data.as_ptr() as _,
          data.len() as _,
          width as _,
          height as _,
          0,
        )
      }
    }
  }
}
