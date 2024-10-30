// This file is automatically generated, so please do not edit it.
// @generated by `flutter_rust_bridge`@ 2.5.0.

// ignore_for_file: unused_import, unused_element, unnecessary_import, duplicate_ignore, invalid_use_of_internal_member, annotate_overrides, non_constant_identifier_names, curly_braces_in_flow_control_structures, prefer_const_literals_to_create_immutables, unused_field

import "api/api.dart";
import "api/utils.dart";
import "dart:async";
import "dart:convert";
import "frb_generated.dart";
import "frb_generated.io.dart"
    if (dart.library.js_interop) "frb_generated.web.dart";
import "package:flutter_rust_bridge/flutter_rust_bridge_for_generated.dart";

/// Main entrypoint of the Rust API
class RustLib extends BaseEntrypoint<RustLibApi, RustLibApiImpl, RustLibWire> {
  @internal
  static final instance = RustLib._();

  RustLib._();

  /// Initialize flutter_rust_bridge
  static Future<void> init({
    RustLibApi? api,
    BaseHandler? handler,
    ExternalLibrary? externalLibrary,
  }) async {
    await instance.initImpl(
      api: api,
      handler: handler,
      externalLibrary: externalLibrary,
    );
  }

  /// Initialize flutter_rust_bridge in mock mode.
  /// No libraries for FFI are loaded.
  static void initMock({
    required RustLibApi api,
  }) {
    instance.initMockImpl(
      api: api,
    );
  }

  /// Dispose flutter_rust_bridge
  ///
  /// The call to this function is optional, since flutter_rust_bridge (and everything else)
  /// is automatically disposed when the app stops.
  static void dispose() => instance.disposeImpl();

  @override
  ApiImplConstructor<RustLibApiImpl, RustLibWire> get apiImplConstructor =>
      RustLibApiImpl.new;

  @override
  WireConstructor<RustLibWire> get wireConstructor =>
      RustLibWire.fromExternalLibrary;

  @override
  Future<void> executeRustInitializers() async {
    await api.crateApiUtilsInitApp();
  }

  @override
  ExternalLibraryLoaderConfig get defaultExternalLibraryLoaderConfig =>
      kDefaultExternalLibraryLoaderConfig;

  @override
  String get codegenVersion => "2.5.0";

  @override
  int get rustContentHash => 268540131;

  static const kDefaultExternalLibraryLoaderConfig =
      ExternalLibraryLoaderConfig(
    stem: "rust_lib_waifu2x_native",
    ioDirectory: "rust/target/release/",
    webPrefix: "pkg/",
  );
}

abstract class RustLibApi extends BaseApi {
  Future<void> crateApiApiInferImage(
      {required String inputFilename,
      required String inputPath,
      required String outputPath,
      required BigInt texturePtr,
      required String arch,
      required String domain,
      required int scale,
      required int denoise,
      required int ttaLevel,
      required bool colorStability,
      required int padding,
      required int tileSize,
      required int offset,
      required FutureOr<void> Function(TaskState) onState});

  Future<String> crateApiUtilsGetCurrentDevice();

  Future<(int, int)> crateApiUtilsGetImageSize({required String imagePath});

  Future<void> crateApiUtilsInitApp();

  Future<void> crateApiUtilsSetFolderPath(
      {required String cacheFolderPath,
      required String documentsFolderPath,
      required String downloadsFolderPath,
      required String supportFolderPath,
      required String temporaryFolderPath});
}

class RustLibApiImpl extends RustLibApiImplPlatform implements RustLibApi {
  RustLibApiImpl({
    required super.handler,
    required super.wire,
    required super.generalizedFrbRustBinding,
    required super.portManager,
  });

  @override
  Future<void> crateApiApiInferImage(
      {required String inputFilename,
      required String inputPath,
      required String outputPath,
      required BigInt texturePtr,
      required String arch,
      required String domain,
      required int scale,
      required int denoise,
      required int ttaLevel,
      required bool colorStability,
      required int padding,
      required int tileSize,
      required int offset,
      required FutureOr<void> Function(TaskState) onState}) {
    return handler.executeNormal(NormalTask(
      callFfi: (port_) {
        final serializer = SseSerializer(generalizedFrbRustBinding);
        sse_encode_String(inputFilename, serializer);
        sse_encode_String(inputPath, serializer);
        sse_encode_String(outputPath, serializer);
        sse_encode_usize(texturePtr, serializer);
        sse_encode_String(arch, serializer);
        sse_encode_String(domain, serializer);
        sse_encode_i_32(scale, serializer);
        sse_encode_i_32(denoise, serializer);
        sse_encode_i_32(ttaLevel, serializer);
        sse_encode_bool(colorStability, serializer);
        sse_encode_i_32(padding, serializer);
        sse_encode_i_32(tileSize, serializer);
        sse_encode_i_32(offset, serializer);
        sse_encode_DartFn_Inputs_task_state_Output_unit_AnyhowException(
            onState, serializer);
        pdeCallFfi(generalizedFrbRustBinding, serializer,
            funcId: 1, port: port_);
      },
      codec: SseCodec(
        decodeSuccessData: sse_decode_unit,
        decodeErrorData: null,
      ),
      constMeta: kCrateApiApiInferImageConstMeta,
      argValues: [
        inputFilename,
        inputPath,
        outputPath,
        texturePtr,
        arch,
        domain,
        scale,
        denoise,
        ttaLevel,
        colorStability,
        padding,
        tileSize,
        offset,
        onState
      ],
      apiImpl: this,
    ));
  }

  TaskConstMeta get kCrateApiApiInferImageConstMeta => const TaskConstMeta(
        debugName: "infer_image",
        argNames: [
          "inputFilename",
          "inputPath",
          "outputPath",
          "texturePtr",
          "arch",
          "domain",
          "scale",
          "denoise",
          "ttaLevel",
          "colorStability",
          "padding",
          "tileSize",
          "offset",
          "onState"
        ],
      );

  @override
  Future<String> crateApiUtilsGetCurrentDevice() {
    return handler.executeNormal(NormalTask(
      callFfi: (port_) {
        final serializer = SseSerializer(generalizedFrbRustBinding);
        pdeCallFfi(generalizedFrbRustBinding, serializer,
            funcId: 2, port: port_);
      },
      codec: SseCodec(
        decodeSuccessData: sse_decode_String,
        decodeErrorData: null,
      ),
      constMeta: kCrateApiUtilsGetCurrentDeviceConstMeta,
      argValues: [],
      apiImpl: this,
    ));
  }

  TaskConstMeta get kCrateApiUtilsGetCurrentDeviceConstMeta =>
      const TaskConstMeta(
        debugName: "get_current_device",
        argNames: [],
      );

  @override
  Future<(int, int)> crateApiUtilsGetImageSize({required String imagePath}) {
    return handler.executeNormal(NormalTask(
      callFfi: (port_) {
        final serializer = SseSerializer(generalizedFrbRustBinding);
        sse_encode_String(imagePath, serializer);
        pdeCallFfi(generalizedFrbRustBinding, serializer,
            funcId: 3, port: port_);
      },
      codec: SseCodec(
        decodeSuccessData: sse_decode_record_u_32_u_32,
        decodeErrorData: null,
      ),
      constMeta: kCrateApiUtilsGetImageSizeConstMeta,
      argValues: [imagePath],
      apiImpl: this,
    ));
  }

  TaskConstMeta get kCrateApiUtilsGetImageSizeConstMeta => const TaskConstMeta(
        debugName: "get_image_size",
        argNames: ["imagePath"],
      );

  @override
  Future<void> crateApiUtilsInitApp() {
    return handler.executeNormal(NormalTask(
      callFfi: (port_) {
        final serializer = SseSerializer(generalizedFrbRustBinding);
        pdeCallFfi(generalizedFrbRustBinding, serializer,
            funcId: 4, port: port_);
      },
      codec: SseCodec(
        decodeSuccessData: sse_decode_unit,
        decodeErrorData: null,
      ),
      constMeta: kCrateApiUtilsInitAppConstMeta,
      argValues: [],
      apiImpl: this,
    ));
  }

  TaskConstMeta get kCrateApiUtilsInitAppConstMeta => const TaskConstMeta(
        debugName: "init_app",
        argNames: [],
      );

  @override
  Future<void> crateApiUtilsSetFolderPath(
      {required String cacheFolderPath,
      required String documentsFolderPath,
      required String downloadsFolderPath,
      required String supportFolderPath,
      required String temporaryFolderPath}) {
    return handler.executeNormal(NormalTask(
      callFfi: (port_) {
        final serializer = SseSerializer(generalizedFrbRustBinding);
        sse_encode_String(cacheFolderPath, serializer);
        sse_encode_String(documentsFolderPath, serializer);
        sse_encode_String(downloadsFolderPath, serializer);
        sse_encode_String(supportFolderPath, serializer);
        sse_encode_String(temporaryFolderPath, serializer);
        pdeCallFfi(generalizedFrbRustBinding, serializer,
            funcId: 5, port: port_);
      },
      codec: SseCodec(
        decodeSuccessData: sse_decode_unit,
        decodeErrorData: null,
      ),
      constMeta: kCrateApiUtilsSetFolderPathConstMeta,
      argValues: [
        cacheFolderPath,
        documentsFolderPath,
        downloadsFolderPath,
        supportFolderPath,
        temporaryFolderPath
      ],
      apiImpl: this,
    ));
  }

  TaskConstMeta get kCrateApiUtilsSetFolderPathConstMeta => const TaskConstMeta(
        debugName: "set_folder_path",
        argNames: [
          "cacheFolderPath",
          "documentsFolderPath",
          "downloadsFolderPath",
          "supportFolderPath",
          "temporaryFolderPath"
        ],
      );

  Future<void> Function(int, dynamic)
      encode_DartFn_Inputs_task_state_Output_unit_AnyhowException(
          FutureOr<void> Function(TaskState) raw) {
    return (callId, rawArg0) async {
      final arg0 = dco_decode_task_state(rawArg0);

      Box<void>? rawOutput;
      Box<AnyhowException>? rawError;
      try {
        rawOutput = Box(await raw(arg0));
      } catch (e, s) {
        rawError = Box(AnyhowException("$e\n\n$s"));
      }

      final serializer = SseSerializer(generalizedFrbRustBinding);
      assert((rawOutput != null) ^ (rawError != null));
      if (rawOutput != null) {
        serializer.buffer.putUint8(0);
        sse_encode_unit(rawOutput.value, serializer);
      } else {
        serializer.buffer.putUint8(1);
        sse_encode_AnyhowException(rawError!.value, serializer);
      }
      final output = serializer.intoRaw();

      generalizedFrbRustBinding.dartFnDeliverOutput(
          callId: callId,
          ptr: output.ptr,
          rustVecLen: output.rustVecLen,
          dataLen: output.dataLen);
    };
  }

  @protected
  AnyhowException dco_decode_AnyhowException(dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return AnyhowException(raw as String);
  }

  @protected
  FutureOr<void> Function(TaskState)
      dco_decode_DartFn_Inputs_task_state_Output_unit_AnyhowException(
          dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    throw UnimplementedError("");
  }

  @protected
  Object dco_decode_DartOpaque(dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return decodeDartOpaque(raw, generalizedFrbRustBinding);
  }

  @protected
  String dco_decode_String(dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return raw as String;
  }

  @protected
  bool dco_decode_bool(dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return raw as bool;
  }

  @protected
  int dco_decode_i_32(dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return raw as int;
  }

  @protected
  PlatformInt64 dco_decode_isize(dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return dcoDecodeI64(raw);
  }

  @protected
  Uint8List dco_decode_list_prim_u_8_strict(dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return raw as Uint8List;
  }

  @protected
  (int, int) dco_decode_record_u_32_u_32(dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    final arr = raw as List<dynamic>;
    if (arr.length != 2) {
      throw Exception("Expected 2 elements, got ${arr.length}");
    }
    return (
      dco_decode_u_32(arr[0]),
      dco_decode_u_32(arr[1]),
    );
  }

  @protected
  TaskState dco_decode_task_state(dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    switch (raw[0]) {
      case 0:
        return const TaskState_Waiting();
      case 1:
        return const TaskState_LoadImage();
      case 2:
        return const TaskState_Pad();
      case 3:
        return const TaskState_LoadModel();
      case 4:
        return TaskState_Inference(
          progress: dco_decode_i_32(raw[1]),
          total: dco_decode_i_32(raw[2]),
        );
      case 5:
        return const TaskState_SaveImage();
      case 6:
        return const TaskState_Done();
      default:
        throw Exception("unreachable");
    }
  }

  @protected
  int dco_decode_u_32(dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return raw as int;
  }

  @protected
  int dco_decode_u_8(dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return raw as int;
  }

  @protected
  void dco_decode_unit(dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return;
  }

  @protected
  BigInt dco_decode_usize(dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return dcoDecodeU64(raw);
  }

  @protected
  AnyhowException sse_decode_AnyhowException(SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    var inner = sse_decode_String(deserializer);
    return AnyhowException(inner);
  }

  @protected
  Object sse_decode_DartOpaque(SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    var inner = sse_decode_isize(deserializer);
    return decodeDartOpaque(inner, generalizedFrbRustBinding);
  }

  @protected
  String sse_decode_String(SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    var inner = sse_decode_list_prim_u_8_strict(deserializer);
    return utf8.decoder.convert(inner);
  }

  @protected
  bool sse_decode_bool(SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    return deserializer.buffer.getUint8() != 0;
  }

  @protected
  int sse_decode_i_32(SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    return deserializer.buffer.getInt32();
  }

  @protected
  PlatformInt64 sse_decode_isize(SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    return deserializer.buffer.getPlatformInt64();
  }

  @protected
  Uint8List sse_decode_list_prim_u_8_strict(SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    var len_ = sse_decode_i_32(deserializer);
    return deserializer.buffer.getUint8List(len_);
  }

  @protected
  (int, int) sse_decode_record_u_32_u_32(SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    var var_field0 = sse_decode_u_32(deserializer);
    var var_field1 = sse_decode_u_32(deserializer);
    return (var_field0, var_field1);
  }

  @protected
  TaskState sse_decode_task_state(SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs

    var tag_ = sse_decode_i_32(deserializer);
    switch (tag_) {
      case 0:
        return const TaskState_Waiting();
      case 1:
        return const TaskState_LoadImage();
      case 2:
        return const TaskState_Pad();
      case 3:
        return const TaskState_LoadModel();
      case 4:
        var var_progress = sse_decode_i_32(deserializer);
        var var_total = sse_decode_i_32(deserializer);
        return TaskState_Inference(progress: var_progress, total: var_total);
      case 5:
        return const TaskState_SaveImage();
      case 6:
        return const TaskState_Done();
      default:
        throw UnimplementedError("");
    }
  }

  @protected
  int sse_decode_u_32(SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    return deserializer.buffer.getUint32();
  }

  @protected
  int sse_decode_u_8(SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    return deserializer.buffer.getUint8();
  }

  @protected
  void sse_decode_unit(SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
  }

  @protected
  BigInt sse_decode_usize(SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    return deserializer.buffer.getBigUint64();
  }

  @protected
  void sse_encode_AnyhowException(
      AnyhowException self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    sse_encode_String(self.message, serializer);
  }

  @protected
  void sse_encode_DartFn_Inputs_task_state_Output_unit_AnyhowException(
      FutureOr<void> Function(TaskState) self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    sse_encode_DartOpaque(
        encode_DartFn_Inputs_task_state_Output_unit_AnyhowException(self),
        serializer);
  }

  @protected
  void sse_encode_DartOpaque(Object self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    sse_encode_isize(
        PlatformPointerUtil.ptrToPlatformInt64(encodeDartOpaque(
            self, portManager.dartHandlerPort, generalizedFrbRustBinding)),
        serializer);
  }

  @protected
  void sse_encode_String(String self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    sse_encode_list_prim_u_8_strict(utf8.encoder.convert(self), serializer);
  }

  @protected
  void sse_encode_bool(bool self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    serializer.buffer.putUint8(self ? 1 : 0);
  }

  @protected
  void sse_encode_i_32(int self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    serializer.buffer.putInt32(self);
  }

  @protected
  void sse_encode_isize(PlatformInt64 self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    serializer.buffer.putPlatformInt64(self);
  }

  @protected
  void sse_encode_list_prim_u_8_strict(
      Uint8List self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    sse_encode_i_32(self.length, serializer);
    serializer.buffer.putUint8List(self);
  }

  @protected
  void sse_encode_record_u_32_u_32((int, int) self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    sse_encode_u_32(self.$1, serializer);
    sse_encode_u_32(self.$2, serializer);
  }

  @protected
  void sse_encode_task_state(TaskState self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    switch (self) {
      case TaskState_Waiting():
        sse_encode_i_32(0, serializer);
      case TaskState_LoadImage():
        sse_encode_i_32(1, serializer);
      case TaskState_Pad():
        sse_encode_i_32(2, serializer);
      case TaskState_LoadModel():
        sse_encode_i_32(3, serializer);
      case TaskState_Inference(progress: final progress, total: final total):
        sse_encode_i_32(4, serializer);
        sse_encode_i_32(progress, serializer);
        sse_encode_i_32(total, serializer);
      case TaskState_SaveImage():
        sse_encode_i_32(5, serializer);
      case TaskState_Done():
        sse_encode_i_32(6, serializer);
      default:
        throw UnimplementedError("");
    }
  }

  @protected
  void sse_encode_u_32(int self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    serializer.buffer.putUint32(self);
  }

  @protected
  void sse_encode_u_8(int self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    serializer.buffer.putUint8(self);
  }

  @protected
  void sse_encode_unit(void self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
  }

  @protected
  void sse_encode_usize(BigInt self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    serializer.buffer.putBigUint64(self);
  }
}
