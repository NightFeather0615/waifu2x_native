// This file is automatically generated, so please do not edit it.
// @generated by `flutter_rust_bridge`@ 2.5.0.

#![allow(
    non_camel_case_types,
    unused,
    non_snake_case,
    clippy::needless_return,
    clippy::redundant_closure_call,
    clippy::redundant_closure,
    clippy::useless_conversion,
    clippy::unit_arg,
    clippy::unused_unit,
    clippy::double_parens,
    clippy::let_and_return,
    clippy::too_many_arguments,
    clippy::match_single_binding,
    clippy::clone_on_copy,
    clippy::let_unit_value,
    clippy::deref_addrof,
    clippy::explicit_auto_deref,
    clippy::borrow_deref_ref,
    clippy::needless_borrow
)]

// Section: imports

use flutter_rust_bridge::for_generated::byteorder::{NativeEndian, ReadBytesExt, WriteBytesExt};
use flutter_rust_bridge::for_generated::{transform_result_dco, Lifetimeable, Lockable};
use flutter_rust_bridge::{Handler, IntoIntoDart};

// Section: boilerplate

flutter_rust_bridge::frb_generated_boilerplate!(
    default_stream_sink_codec = SseCodec,
    default_rust_opaque = RustOpaqueMoi,
    default_rust_auto_opaque = RustAutoOpaqueMoi,
);
pub(crate) const FLUTTER_RUST_BRIDGE_CODEGEN_VERSION: &str = "2.5.0";
pub(crate) const FLUTTER_RUST_BRIDGE_CODEGEN_CONTENT_HASH: i32 = 268540131;

// Section: executor

flutter_rust_bridge::frb_generated_default_handler!();

// Section: wire_funcs

fn wire__crate__api__api__infer_image_impl(
    port_: flutter_rust_bridge::for_generated::MessagePort,
    ptr_: flutter_rust_bridge::for_generated::PlatformGeneralizedUint8ListPtr,
    rust_vec_len_: i32,
    data_len_: i32,
) {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap_async::<flutter_rust_bridge::for_generated::SseCodec, _, _, _>(
        flutter_rust_bridge::for_generated::TaskInfo {
            debug_name: "infer_image",
            port: Some(port_),
            mode: flutter_rust_bridge::for_generated::FfiCallMode::Normal,
        },
        move || {
            let message = unsafe {
                flutter_rust_bridge::for_generated::Dart2RustMessageSse::from_wire(
                    ptr_,
                    rust_vec_len_,
                    data_len_,
                )
            };
            let mut deserializer =
                flutter_rust_bridge::for_generated::SseDeserializer::new(message);
            let api_input_filename = <String>::sse_decode(&mut deserializer);
            let api_input_path = <String>::sse_decode(&mut deserializer);
            let api_output_path = <String>::sse_decode(&mut deserializer);
            let api_texture_ptr = <usize>::sse_decode(&mut deserializer);
            let api_arch = <String>::sse_decode(&mut deserializer);
            let api_domain = <String>::sse_decode(&mut deserializer);
            let api_scale = <i32>::sse_decode(&mut deserializer);
            let api_denoise = <i32>::sse_decode(&mut deserializer);
            let api_tta_level = <i32>::sse_decode(&mut deserializer);
            let api_color_stability = <bool>::sse_decode(&mut deserializer);
            let api_padding = <i32>::sse_decode(&mut deserializer);
            let api_tile_size = <i32>::sse_decode(&mut deserializer);
            let api_offset = <i32>::sse_decode(&mut deserializer);
            let api_on_state = decode_DartFn_Inputs_task_state_Output_unit_AnyhowException(
                <flutter_rust_bridge::DartOpaque>::sse_decode(&mut deserializer),
            );
            deserializer.end();
            move |context| async move {
                transform_result_sse::<_, ()>(
                    (move || async move {
                        let output_ok = Result::<_, ()>::Ok({
                            crate::api::api::infer_image(
                                &api_input_filename,
                                &api_input_path,
                                &api_output_path,
                                api_texture_ptr,
                                &api_arch,
                                &api_domain,
                                api_scale,
                                api_denoise,
                                api_tta_level,
                                api_color_stability,
                                api_padding,
                                api_tile_size,
                                api_offset,
                                api_on_state,
                            )
                            .await;
                        })?;
                        Ok(output_ok)
                    })()
                    .await,
                )
            }
        },
    )
}
fn wire__crate__api__utils__get_current_device_impl(
    port_: flutter_rust_bridge::for_generated::MessagePort,
    ptr_: flutter_rust_bridge::for_generated::PlatformGeneralizedUint8ListPtr,
    rust_vec_len_: i32,
    data_len_: i32,
) {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap_async::<flutter_rust_bridge::for_generated::SseCodec, _, _, _>(
        flutter_rust_bridge::for_generated::TaskInfo {
            debug_name: "get_current_device",
            port: Some(port_),
            mode: flutter_rust_bridge::for_generated::FfiCallMode::Normal,
        },
        move || {
            let message = unsafe {
                flutter_rust_bridge::for_generated::Dart2RustMessageSse::from_wire(
                    ptr_,
                    rust_vec_len_,
                    data_len_,
                )
            };
            let mut deserializer =
                flutter_rust_bridge::for_generated::SseDeserializer::new(message);
            deserializer.end();
            move |context| async move {
                transform_result_sse::<_, ()>(
                    (move || async move {
                        let output_ok =
                            Result::<_, ()>::Ok(crate::api::utils::get_current_device().await)?;
                        Ok(output_ok)
                    })()
                    .await,
                )
            }
        },
    )
}
fn wire__crate__api__utils__get_image_size_impl(
    port_: flutter_rust_bridge::for_generated::MessagePort,
    ptr_: flutter_rust_bridge::for_generated::PlatformGeneralizedUint8ListPtr,
    rust_vec_len_: i32,
    data_len_: i32,
) {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap_async::<flutter_rust_bridge::for_generated::SseCodec, _, _, _>(
        flutter_rust_bridge::for_generated::TaskInfo {
            debug_name: "get_image_size",
            port: Some(port_),
            mode: flutter_rust_bridge::for_generated::FfiCallMode::Normal,
        },
        move || {
            let message = unsafe {
                flutter_rust_bridge::for_generated::Dart2RustMessageSse::from_wire(
                    ptr_,
                    rust_vec_len_,
                    data_len_,
                )
            };
            let mut deserializer =
                flutter_rust_bridge::for_generated::SseDeserializer::new(message);
            let api_image_path = <String>::sse_decode(&mut deserializer);
            deserializer.end();
            move |context| async move {
                transform_result_sse::<_, ()>(
                    (move || async move {
                        let output_ok = Result::<_, ()>::Ok(
                            crate::api::utils::get_image_size(&api_image_path).await,
                        )?;
                        Ok(output_ok)
                    })()
                    .await,
                )
            }
        },
    )
}
fn wire__crate__api__utils__init_app_impl(
    port_: flutter_rust_bridge::for_generated::MessagePort,
    ptr_: flutter_rust_bridge::for_generated::PlatformGeneralizedUint8ListPtr,
    rust_vec_len_: i32,
    data_len_: i32,
) {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap_normal::<flutter_rust_bridge::for_generated::SseCodec, _, _>(
        flutter_rust_bridge::for_generated::TaskInfo {
            debug_name: "init_app",
            port: Some(port_),
            mode: flutter_rust_bridge::for_generated::FfiCallMode::Normal,
        },
        move || {
            let message = unsafe {
                flutter_rust_bridge::for_generated::Dart2RustMessageSse::from_wire(
                    ptr_,
                    rust_vec_len_,
                    data_len_,
                )
            };
            let mut deserializer =
                flutter_rust_bridge::for_generated::SseDeserializer::new(message);
            deserializer.end();
            move |context| {
                transform_result_sse::<_, ()>((move || {
                    let output_ok = Result::<_, ()>::Ok({
                        crate::api::utils::init_app();
                    })?;
                    Ok(output_ok)
                })())
            }
        },
    )
}
fn wire__crate__api__utils__set_folder_path_impl(
    port_: flutter_rust_bridge::for_generated::MessagePort,
    ptr_: flutter_rust_bridge::for_generated::PlatformGeneralizedUint8ListPtr,
    rust_vec_len_: i32,
    data_len_: i32,
) {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap_async::<flutter_rust_bridge::for_generated::SseCodec, _, _, _>(
        flutter_rust_bridge::for_generated::TaskInfo {
            debug_name: "set_folder_path",
            port: Some(port_),
            mode: flutter_rust_bridge::for_generated::FfiCallMode::Normal,
        },
        move || {
            let message = unsafe {
                flutter_rust_bridge::for_generated::Dart2RustMessageSse::from_wire(
                    ptr_,
                    rust_vec_len_,
                    data_len_,
                )
            };
            let mut deserializer =
                flutter_rust_bridge::for_generated::SseDeserializer::new(message);
            let api_cache_folder_path = <String>::sse_decode(&mut deserializer);
            let api_documents_folder_path = <String>::sse_decode(&mut deserializer);
            let api_downloads_folder_path = <String>::sse_decode(&mut deserializer);
            let api_support_folder_path = <String>::sse_decode(&mut deserializer);
            let api_temporary_folder_path = <String>::sse_decode(&mut deserializer);
            deserializer.end();
            move |context| async move {
                transform_result_sse::<_, ()>(
                    (move || async move {
                        let output_ok = Result::<_, ()>::Ok({
                            crate::api::utils::set_folder_path(
                                &api_cache_folder_path,
                                &api_documents_folder_path,
                                &api_downloads_folder_path,
                                &api_support_folder_path,
                                &api_temporary_folder_path,
                            )
                            .await;
                        })?;
                        Ok(output_ok)
                    })()
                    .await,
                )
            }
        },
    )
}

// Section: related_funcs

fn decode_DartFn_Inputs_task_state_Output_unit_AnyhowException(
    dart_opaque: flutter_rust_bridge::DartOpaque,
) -> impl Fn(crate::api::api::TaskState) -> flutter_rust_bridge::DartFnFuture<()> {
    use flutter_rust_bridge::IntoDart;

    async fn body(
        dart_opaque: flutter_rust_bridge::DartOpaque,
        arg0: crate::api::api::TaskState,
    ) -> () {
        let args = vec![arg0.into_into_dart().into_dart()];
        let message = FLUTTER_RUST_BRIDGE_HANDLER
            .dart_fn_invoke(dart_opaque, args)
            .await;

        let mut deserializer = flutter_rust_bridge::for_generated::SseDeserializer::new(message);
        let action = deserializer.cursor.read_u8().unwrap();
        let ans = match action {
            0 => std::result::Result::Ok(<()>::sse_decode(&mut deserializer)),
            1 => std::result::Result::Err(
                <flutter_rust_bridge::for_generated::anyhow::Error>::sse_decode(&mut deserializer),
            ),
            _ => unreachable!(),
        };
        deserializer.end();
        let ans = ans.expect("Dart throws exception but Rust side assume it is not failable");
        ans
    }

    move |arg0: crate::api::api::TaskState| {
        flutter_rust_bridge::for_generated::convert_into_dart_fn_future(body(
            dart_opaque.clone(),
            arg0,
        ))
    }
}

// Section: dart2rust

impl SseDecode for flutter_rust_bridge::for_generated::anyhow::Error {
    // Codec=Sse (Serialization based), see doc to use other codecs
    fn sse_decode(deserializer: &mut flutter_rust_bridge::for_generated::SseDeserializer) -> Self {
        let mut inner = <String>::sse_decode(deserializer);
        return flutter_rust_bridge::for_generated::anyhow::anyhow!("{}", inner);
    }
}

impl SseDecode for flutter_rust_bridge::DartOpaque {
    // Codec=Sse (Serialization based), see doc to use other codecs
    fn sse_decode(deserializer: &mut flutter_rust_bridge::for_generated::SseDeserializer) -> Self {
        let mut inner = <usize>::sse_decode(deserializer);
        return unsafe { flutter_rust_bridge::for_generated::sse_decode_dart_opaque(inner) };
    }
}

impl SseDecode for String {
    // Codec=Sse (Serialization based), see doc to use other codecs
    fn sse_decode(deserializer: &mut flutter_rust_bridge::for_generated::SseDeserializer) -> Self {
        let mut inner = <Vec<u8>>::sse_decode(deserializer);
        return String::from_utf8(inner).unwrap();
    }
}

impl SseDecode for bool {
    // Codec=Sse (Serialization based), see doc to use other codecs
    fn sse_decode(deserializer: &mut flutter_rust_bridge::for_generated::SseDeserializer) -> Self {
        deserializer.cursor.read_u8().unwrap() != 0
    }
}

impl SseDecode for i32 {
    // Codec=Sse (Serialization based), see doc to use other codecs
    fn sse_decode(deserializer: &mut flutter_rust_bridge::for_generated::SseDeserializer) -> Self {
        deserializer.cursor.read_i32::<NativeEndian>().unwrap()
    }
}

impl SseDecode for isize {
    // Codec=Sse (Serialization based), see doc to use other codecs
    fn sse_decode(deserializer: &mut flutter_rust_bridge::for_generated::SseDeserializer) -> Self {
        deserializer.cursor.read_i64::<NativeEndian>().unwrap() as _
    }
}

impl SseDecode for Vec<u8> {
    // Codec=Sse (Serialization based), see doc to use other codecs
    fn sse_decode(deserializer: &mut flutter_rust_bridge::for_generated::SseDeserializer) -> Self {
        let mut len_ = <i32>::sse_decode(deserializer);
        let mut ans_ = vec![];
        for idx_ in 0..len_ {
            ans_.push(<u8>::sse_decode(deserializer));
        }
        return ans_;
    }
}

impl SseDecode for (u32, u32) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    fn sse_decode(deserializer: &mut flutter_rust_bridge::for_generated::SseDeserializer) -> Self {
        let mut var_field0 = <u32>::sse_decode(deserializer);
        let mut var_field1 = <u32>::sse_decode(deserializer);
        return (var_field0, var_field1);
    }
}

impl SseDecode for crate::api::api::TaskState {
    // Codec=Sse (Serialization based), see doc to use other codecs
    fn sse_decode(deserializer: &mut flutter_rust_bridge::for_generated::SseDeserializer) -> Self {
        let mut tag_ = <i32>::sse_decode(deserializer);
        match tag_ {
            0 => {
                return crate::api::api::TaskState::Waiting;
            }
            1 => {
                return crate::api::api::TaskState::LoadImage;
            }
            2 => {
                return crate::api::api::TaskState::Pad;
            }
            3 => {
                return crate::api::api::TaskState::LoadModel;
            }
            4 => {
                let mut var_progress = <i32>::sse_decode(deserializer);
                let mut var_total = <i32>::sse_decode(deserializer);
                return crate::api::api::TaskState::Inference {
                    progress: var_progress,
                    total: var_total,
                };
            }
            5 => {
                return crate::api::api::TaskState::SaveImage;
            }
            6 => {
                return crate::api::api::TaskState::Done;
            }
            _ => {
                unimplemented!("");
            }
        }
    }
}

impl SseDecode for u32 {
    // Codec=Sse (Serialization based), see doc to use other codecs
    fn sse_decode(deserializer: &mut flutter_rust_bridge::for_generated::SseDeserializer) -> Self {
        deserializer.cursor.read_u32::<NativeEndian>().unwrap()
    }
}

impl SseDecode for u8 {
    // Codec=Sse (Serialization based), see doc to use other codecs
    fn sse_decode(deserializer: &mut flutter_rust_bridge::for_generated::SseDeserializer) -> Self {
        deserializer.cursor.read_u8().unwrap()
    }
}

impl SseDecode for () {
    // Codec=Sse (Serialization based), see doc to use other codecs
    fn sse_decode(deserializer: &mut flutter_rust_bridge::for_generated::SseDeserializer) -> Self {}
}

impl SseDecode for usize {
    // Codec=Sse (Serialization based), see doc to use other codecs
    fn sse_decode(deserializer: &mut flutter_rust_bridge::for_generated::SseDeserializer) -> Self {
        deserializer.cursor.read_u64::<NativeEndian>().unwrap() as _
    }
}

fn pde_ffi_dispatcher_primary_impl(
    func_id: i32,
    port: flutter_rust_bridge::for_generated::MessagePort,
    ptr: flutter_rust_bridge::for_generated::PlatformGeneralizedUint8ListPtr,
    rust_vec_len: i32,
    data_len: i32,
) {
    // Codec=Pde (Serialization + dispatch), see doc to use other codecs
    match func_id {
        1 => wire__crate__api__api__infer_image_impl(port, ptr, rust_vec_len, data_len),
        2 => wire__crate__api__utils__get_current_device_impl(port, ptr, rust_vec_len, data_len),
        3 => wire__crate__api__utils__get_image_size_impl(port, ptr, rust_vec_len, data_len),
        4 => wire__crate__api__utils__init_app_impl(port, ptr, rust_vec_len, data_len),
        5 => wire__crate__api__utils__set_folder_path_impl(port, ptr, rust_vec_len, data_len),
        _ => unreachable!(),
    }
}

fn pde_ffi_dispatcher_sync_impl(
    func_id: i32,
    ptr: flutter_rust_bridge::for_generated::PlatformGeneralizedUint8ListPtr,
    rust_vec_len: i32,
    data_len: i32,
) -> flutter_rust_bridge::for_generated::WireSyncRust2DartSse {
    // Codec=Pde (Serialization + dispatch), see doc to use other codecs
    match func_id {
        _ => unreachable!(),
    }
}

// Section: rust2dart

// Codec=Dco (DartCObject based), see doc to use other codecs
impl flutter_rust_bridge::IntoDart for crate::api::api::TaskState {
    fn into_dart(self) -> flutter_rust_bridge::for_generated::DartAbi {
        match self {
            crate::api::api::TaskState::Waiting => [0.into_dart()].into_dart(),
            crate::api::api::TaskState::LoadImage => [1.into_dart()].into_dart(),
            crate::api::api::TaskState::Pad => [2.into_dart()].into_dart(),
            crate::api::api::TaskState::LoadModel => [3.into_dart()].into_dart(),
            crate::api::api::TaskState::Inference { progress, total } => [
                4.into_dart(),
                progress.into_into_dart().into_dart(),
                total.into_into_dart().into_dart(),
            ]
            .into_dart(),
            crate::api::api::TaskState::SaveImage => [5.into_dart()].into_dart(),
            crate::api::api::TaskState::Done => [6.into_dart()].into_dart(),
            _ => {
                unimplemented!("");
            }
        }
    }
}
impl flutter_rust_bridge::for_generated::IntoDartExceptPrimitive for crate::api::api::TaskState {}
impl flutter_rust_bridge::IntoIntoDart<crate::api::api::TaskState> for crate::api::api::TaskState {
    fn into_into_dart(self) -> crate::api::api::TaskState {
        self
    }
}

impl SseEncode for flutter_rust_bridge::for_generated::anyhow::Error {
    // Codec=Sse (Serialization based), see doc to use other codecs
    fn sse_encode(self, serializer: &mut flutter_rust_bridge::for_generated::SseSerializer) {
        <String>::sse_encode(format!("{:?}", self), serializer);
    }
}

impl SseEncode for flutter_rust_bridge::DartOpaque {
    // Codec=Sse (Serialization based), see doc to use other codecs
    fn sse_encode(self, serializer: &mut flutter_rust_bridge::for_generated::SseSerializer) {
        <usize>::sse_encode(self.encode(), serializer);
    }
}

impl SseEncode for String {
    // Codec=Sse (Serialization based), see doc to use other codecs
    fn sse_encode(self, serializer: &mut flutter_rust_bridge::for_generated::SseSerializer) {
        <Vec<u8>>::sse_encode(self.into_bytes(), serializer);
    }
}

impl SseEncode for bool {
    // Codec=Sse (Serialization based), see doc to use other codecs
    fn sse_encode(self, serializer: &mut flutter_rust_bridge::for_generated::SseSerializer) {
        serializer.cursor.write_u8(self as _).unwrap();
    }
}

impl SseEncode for i32 {
    // Codec=Sse (Serialization based), see doc to use other codecs
    fn sse_encode(self, serializer: &mut flutter_rust_bridge::for_generated::SseSerializer) {
        serializer.cursor.write_i32::<NativeEndian>(self).unwrap();
    }
}

impl SseEncode for isize {
    // Codec=Sse (Serialization based), see doc to use other codecs
    fn sse_encode(self, serializer: &mut flutter_rust_bridge::for_generated::SseSerializer) {
        serializer
            .cursor
            .write_i64::<NativeEndian>(self as _)
            .unwrap();
    }
}

impl SseEncode for Vec<u8> {
    // Codec=Sse (Serialization based), see doc to use other codecs
    fn sse_encode(self, serializer: &mut flutter_rust_bridge::for_generated::SseSerializer) {
        <i32>::sse_encode(self.len() as _, serializer);
        for item in self {
            <u8>::sse_encode(item, serializer);
        }
    }
}

impl SseEncode for (u32, u32) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    fn sse_encode(self, serializer: &mut flutter_rust_bridge::for_generated::SseSerializer) {
        <u32>::sse_encode(self.0, serializer);
        <u32>::sse_encode(self.1, serializer);
    }
}

impl SseEncode for crate::api::api::TaskState {
    // Codec=Sse (Serialization based), see doc to use other codecs
    fn sse_encode(self, serializer: &mut flutter_rust_bridge::for_generated::SseSerializer) {
        match self {
            crate::api::api::TaskState::Waiting => {
                <i32>::sse_encode(0, serializer);
            }
            crate::api::api::TaskState::LoadImage => {
                <i32>::sse_encode(1, serializer);
            }
            crate::api::api::TaskState::Pad => {
                <i32>::sse_encode(2, serializer);
            }
            crate::api::api::TaskState::LoadModel => {
                <i32>::sse_encode(3, serializer);
            }
            crate::api::api::TaskState::Inference { progress, total } => {
                <i32>::sse_encode(4, serializer);
                <i32>::sse_encode(progress, serializer);
                <i32>::sse_encode(total, serializer);
            }
            crate::api::api::TaskState::SaveImage => {
                <i32>::sse_encode(5, serializer);
            }
            crate::api::api::TaskState::Done => {
                <i32>::sse_encode(6, serializer);
            }
            _ => {
                unimplemented!("");
            }
        }
    }
}

impl SseEncode for u32 {
    // Codec=Sse (Serialization based), see doc to use other codecs
    fn sse_encode(self, serializer: &mut flutter_rust_bridge::for_generated::SseSerializer) {
        serializer.cursor.write_u32::<NativeEndian>(self).unwrap();
    }
}

impl SseEncode for u8 {
    // Codec=Sse (Serialization based), see doc to use other codecs
    fn sse_encode(self, serializer: &mut flutter_rust_bridge::for_generated::SseSerializer) {
        serializer.cursor.write_u8(self).unwrap();
    }
}

impl SseEncode for () {
    // Codec=Sse (Serialization based), see doc to use other codecs
    fn sse_encode(self, serializer: &mut flutter_rust_bridge::for_generated::SseSerializer) {}
}

impl SseEncode for usize {
    // Codec=Sse (Serialization based), see doc to use other codecs
    fn sse_encode(self, serializer: &mut flutter_rust_bridge::for_generated::SseSerializer) {
        serializer
            .cursor
            .write_u64::<NativeEndian>(self as _)
            .unwrap();
    }
}

#[cfg(not(target_family = "wasm"))]
mod io {
    // This file is automatically generated, so please do not edit it.
    // @generated by `flutter_rust_bridge`@ 2.5.0.

    // Section: imports

    use super::*;
    use flutter_rust_bridge::for_generated::byteorder::{
        NativeEndian, ReadBytesExt, WriteBytesExt,
    };
    use flutter_rust_bridge::for_generated::{transform_result_dco, Lifetimeable, Lockable};
    use flutter_rust_bridge::{Handler, IntoIntoDart};

    // Section: boilerplate

    flutter_rust_bridge::frb_generated_boilerplate_io!();
}
#[cfg(not(target_family = "wasm"))]
pub use io::*;

/// cbindgen:ignore
#[cfg(target_family = "wasm")]
mod web {
    // This file is automatically generated, so please do not edit it.
    // @generated by `flutter_rust_bridge`@ 2.5.0.

    // Section: imports

    use super::*;
    use flutter_rust_bridge::for_generated::byteorder::{
        NativeEndian, ReadBytesExt, WriteBytesExt,
    };
    use flutter_rust_bridge::for_generated::wasm_bindgen;
    use flutter_rust_bridge::for_generated::wasm_bindgen::prelude::*;
    use flutter_rust_bridge::for_generated::{transform_result_dco, Lifetimeable, Lockable};
    use flutter_rust_bridge::{Handler, IntoIntoDart};

    // Section: boilerplate

    flutter_rust_bridge::frb_generated_boilerplate_web!();
}
#[cfg(target_family = "wasm")]
pub use web::*;
