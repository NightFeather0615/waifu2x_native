// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TaskState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() waiting,
    required TResult Function() loadImage,
    required TResult Function() pad,
    required TResult Function() loadModel,
    required TResult Function(int progress, int total) inference,
    required TResult Function() saveImage,
    required TResult Function() done,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? waiting,
    TResult? Function()? loadImage,
    TResult? Function()? pad,
    TResult? Function()? loadModel,
    TResult? Function(int progress, int total)? inference,
    TResult? Function()? saveImage,
    TResult? Function()? done,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? waiting,
    TResult Function()? loadImage,
    TResult Function()? pad,
    TResult Function()? loadModel,
    TResult Function(int progress, int total)? inference,
    TResult Function()? saveImage,
    TResult Function()? done,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TaskState_Waiting value) waiting,
    required TResult Function(TaskState_LoadImage value) loadImage,
    required TResult Function(TaskState_Pad value) pad,
    required TResult Function(TaskState_LoadModel value) loadModel,
    required TResult Function(TaskState_Inference value) inference,
    required TResult Function(TaskState_SaveImage value) saveImage,
    required TResult Function(TaskState_Done value) done,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TaskState_Waiting value)? waiting,
    TResult? Function(TaskState_LoadImage value)? loadImage,
    TResult? Function(TaskState_Pad value)? pad,
    TResult? Function(TaskState_LoadModel value)? loadModel,
    TResult? Function(TaskState_Inference value)? inference,
    TResult? Function(TaskState_SaveImage value)? saveImage,
    TResult? Function(TaskState_Done value)? done,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TaskState_Waiting value)? waiting,
    TResult Function(TaskState_LoadImage value)? loadImage,
    TResult Function(TaskState_Pad value)? pad,
    TResult Function(TaskState_LoadModel value)? loadModel,
    TResult Function(TaskState_Inference value)? inference,
    TResult Function(TaskState_SaveImage value)? saveImage,
    TResult Function(TaskState_Done value)? done,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskStateCopyWith<$Res> {
  factory $TaskStateCopyWith(TaskState value, $Res Function(TaskState) then) =
      _$TaskStateCopyWithImpl<$Res, TaskState>;
}

/// @nodoc
class _$TaskStateCopyWithImpl<$Res, $Val extends TaskState>
    implements $TaskStateCopyWith<$Res> {
  _$TaskStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TaskState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$TaskState_WaitingImplCopyWith<$Res> {
  factory _$$TaskState_WaitingImplCopyWith(_$TaskState_WaitingImpl value,
          $Res Function(_$TaskState_WaitingImpl) then) =
      __$$TaskState_WaitingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TaskState_WaitingImplCopyWithImpl<$Res>
    extends _$TaskStateCopyWithImpl<$Res, _$TaskState_WaitingImpl>
    implements _$$TaskState_WaitingImplCopyWith<$Res> {
  __$$TaskState_WaitingImplCopyWithImpl(_$TaskState_WaitingImpl _value,
      $Res Function(_$TaskState_WaitingImpl) _then)
      : super(_value, _then);

  /// Create a copy of TaskState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$TaskState_WaitingImpl extends TaskState_Waiting {
  const _$TaskState_WaitingImpl() : super._();

  @override
  String toString() {
    return 'TaskState.waiting()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$TaskState_WaitingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() waiting,
    required TResult Function() loadImage,
    required TResult Function() pad,
    required TResult Function() loadModel,
    required TResult Function(int progress, int total) inference,
    required TResult Function() saveImage,
    required TResult Function() done,
  }) {
    return waiting();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? waiting,
    TResult? Function()? loadImage,
    TResult? Function()? pad,
    TResult? Function()? loadModel,
    TResult? Function(int progress, int total)? inference,
    TResult? Function()? saveImage,
    TResult? Function()? done,
  }) {
    return waiting?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? waiting,
    TResult Function()? loadImage,
    TResult Function()? pad,
    TResult Function()? loadModel,
    TResult Function(int progress, int total)? inference,
    TResult Function()? saveImage,
    TResult Function()? done,
    required TResult orElse(),
  }) {
    if (waiting != null) {
      return waiting();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TaskState_Waiting value) waiting,
    required TResult Function(TaskState_LoadImage value) loadImage,
    required TResult Function(TaskState_Pad value) pad,
    required TResult Function(TaskState_LoadModel value) loadModel,
    required TResult Function(TaskState_Inference value) inference,
    required TResult Function(TaskState_SaveImage value) saveImage,
    required TResult Function(TaskState_Done value) done,
  }) {
    return waiting(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TaskState_Waiting value)? waiting,
    TResult? Function(TaskState_LoadImage value)? loadImage,
    TResult? Function(TaskState_Pad value)? pad,
    TResult? Function(TaskState_LoadModel value)? loadModel,
    TResult? Function(TaskState_Inference value)? inference,
    TResult? Function(TaskState_SaveImage value)? saveImage,
    TResult? Function(TaskState_Done value)? done,
  }) {
    return waiting?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TaskState_Waiting value)? waiting,
    TResult Function(TaskState_LoadImage value)? loadImage,
    TResult Function(TaskState_Pad value)? pad,
    TResult Function(TaskState_LoadModel value)? loadModel,
    TResult Function(TaskState_Inference value)? inference,
    TResult Function(TaskState_SaveImage value)? saveImage,
    TResult Function(TaskState_Done value)? done,
    required TResult orElse(),
  }) {
    if (waiting != null) {
      return waiting(this);
    }
    return orElse();
  }
}

abstract class TaskState_Waiting extends TaskState {
  const factory TaskState_Waiting() = _$TaskState_WaitingImpl;
  const TaskState_Waiting._() : super._();
}

/// @nodoc
abstract class _$$TaskState_LoadImageImplCopyWith<$Res> {
  factory _$$TaskState_LoadImageImplCopyWith(_$TaskState_LoadImageImpl value,
          $Res Function(_$TaskState_LoadImageImpl) then) =
      __$$TaskState_LoadImageImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TaskState_LoadImageImplCopyWithImpl<$Res>
    extends _$TaskStateCopyWithImpl<$Res, _$TaskState_LoadImageImpl>
    implements _$$TaskState_LoadImageImplCopyWith<$Res> {
  __$$TaskState_LoadImageImplCopyWithImpl(_$TaskState_LoadImageImpl _value,
      $Res Function(_$TaskState_LoadImageImpl) _then)
      : super(_value, _then);

  /// Create a copy of TaskState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$TaskState_LoadImageImpl extends TaskState_LoadImage {
  const _$TaskState_LoadImageImpl() : super._();

  @override
  String toString() {
    return 'TaskState.loadImage()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskState_LoadImageImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() waiting,
    required TResult Function() loadImage,
    required TResult Function() pad,
    required TResult Function() loadModel,
    required TResult Function(int progress, int total) inference,
    required TResult Function() saveImage,
    required TResult Function() done,
  }) {
    return loadImage();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? waiting,
    TResult? Function()? loadImage,
    TResult? Function()? pad,
    TResult? Function()? loadModel,
    TResult? Function(int progress, int total)? inference,
    TResult? Function()? saveImage,
    TResult? Function()? done,
  }) {
    return loadImage?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? waiting,
    TResult Function()? loadImage,
    TResult Function()? pad,
    TResult Function()? loadModel,
    TResult Function(int progress, int total)? inference,
    TResult Function()? saveImage,
    TResult Function()? done,
    required TResult orElse(),
  }) {
    if (loadImage != null) {
      return loadImage();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TaskState_Waiting value) waiting,
    required TResult Function(TaskState_LoadImage value) loadImage,
    required TResult Function(TaskState_Pad value) pad,
    required TResult Function(TaskState_LoadModel value) loadModel,
    required TResult Function(TaskState_Inference value) inference,
    required TResult Function(TaskState_SaveImage value) saveImage,
    required TResult Function(TaskState_Done value) done,
  }) {
    return loadImage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TaskState_Waiting value)? waiting,
    TResult? Function(TaskState_LoadImage value)? loadImage,
    TResult? Function(TaskState_Pad value)? pad,
    TResult? Function(TaskState_LoadModel value)? loadModel,
    TResult? Function(TaskState_Inference value)? inference,
    TResult? Function(TaskState_SaveImage value)? saveImage,
    TResult? Function(TaskState_Done value)? done,
  }) {
    return loadImage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TaskState_Waiting value)? waiting,
    TResult Function(TaskState_LoadImage value)? loadImage,
    TResult Function(TaskState_Pad value)? pad,
    TResult Function(TaskState_LoadModel value)? loadModel,
    TResult Function(TaskState_Inference value)? inference,
    TResult Function(TaskState_SaveImage value)? saveImage,
    TResult Function(TaskState_Done value)? done,
    required TResult orElse(),
  }) {
    if (loadImage != null) {
      return loadImage(this);
    }
    return orElse();
  }
}

abstract class TaskState_LoadImage extends TaskState {
  const factory TaskState_LoadImage() = _$TaskState_LoadImageImpl;
  const TaskState_LoadImage._() : super._();
}

/// @nodoc
abstract class _$$TaskState_PadImplCopyWith<$Res> {
  factory _$$TaskState_PadImplCopyWith(
          _$TaskState_PadImpl value, $Res Function(_$TaskState_PadImpl) then) =
      __$$TaskState_PadImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TaskState_PadImplCopyWithImpl<$Res>
    extends _$TaskStateCopyWithImpl<$Res, _$TaskState_PadImpl>
    implements _$$TaskState_PadImplCopyWith<$Res> {
  __$$TaskState_PadImplCopyWithImpl(
      _$TaskState_PadImpl _value, $Res Function(_$TaskState_PadImpl) _then)
      : super(_value, _then);

  /// Create a copy of TaskState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$TaskState_PadImpl extends TaskState_Pad {
  const _$TaskState_PadImpl() : super._();

  @override
  String toString() {
    return 'TaskState.pad()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$TaskState_PadImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() waiting,
    required TResult Function() loadImage,
    required TResult Function() pad,
    required TResult Function() loadModel,
    required TResult Function(int progress, int total) inference,
    required TResult Function() saveImage,
    required TResult Function() done,
  }) {
    return pad();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? waiting,
    TResult? Function()? loadImage,
    TResult? Function()? pad,
    TResult? Function()? loadModel,
    TResult? Function(int progress, int total)? inference,
    TResult? Function()? saveImage,
    TResult? Function()? done,
  }) {
    return pad?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? waiting,
    TResult Function()? loadImage,
    TResult Function()? pad,
    TResult Function()? loadModel,
    TResult Function(int progress, int total)? inference,
    TResult Function()? saveImage,
    TResult Function()? done,
    required TResult orElse(),
  }) {
    if (pad != null) {
      return pad();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TaskState_Waiting value) waiting,
    required TResult Function(TaskState_LoadImage value) loadImage,
    required TResult Function(TaskState_Pad value) pad,
    required TResult Function(TaskState_LoadModel value) loadModel,
    required TResult Function(TaskState_Inference value) inference,
    required TResult Function(TaskState_SaveImage value) saveImage,
    required TResult Function(TaskState_Done value) done,
  }) {
    return pad(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TaskState_Waiting value)? waiting,
    TResult? Function(TaskState_LoadImage value)? loadImage,
    TResult? Function(TaskState_Pad value)? pad,
    TResult? Function(TaskState_LoadModel value)? loadModel,
    TResult? Function(TaskState_Inference value)? inference,
    TResult? Function(TaskState_SaveImage value)? saveImage,
    TResult? Function(TaskState_Done value)? done,
  }) {
    return pad?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TaskState_Waiting value)? waiting,
    TResult Function(TaskState_LoadImage value)? loadImage,
    TResult Function(TaskState_Pad value)? pad,
    TResult Function(TaskState_LoadModel value)? loadModel,
    TResult Function(TaskState_Inference value)? inference,
    TResult Function(TaskState_SaveImage value)? saveImage,
    TResult Function(TaskState_Done value)? done,
    required TResult orElse(),
  }) {
    if (pad != null) {
      return pad(this);
    }
    return orElse();
  }
}

abstract class TaskState_Pad extends TaskState {
  const factory TaskState_Pad() = _$TaskState_PadImpl;
  const TaskState_Pad._() : super._();
}

/// @nodoc
abstract class _$$TaskState_LoadModelImplCopyWith<$Res> {
  factory _$$TaskState_LoadModelImplCopyWith(_$TaskState_LoadModelImpl value,
          $Res Function(_$TaskState_LoadModelImpl) then) =
      __$$TaskState_LoadModelImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TaskState_LoadModelImplCopyWithImpl<$Res>
    extends _$TaskStateCopyWithImpl<$Res, _$TaskState_LoadModelImpl>
    implements _$$TaskState_LoadModelImplCopyWith<$Res> {
  __$$TaskState_LoadModelImplCopyWithImpl(_$TaskState_LoadModelImpl _value,
      $Res Function(_$TaskState_LoadModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of TaskState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$TaskState_LoadModelImpl extends TaskState_LoadModel {
  const _$TaskState_LoadModelImpl() : super._();

  @override
  String toString() {
    return 'TaskState.loadModel()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskState_LoadModelImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() waiting,
    required TResult Function() loadImage,
    required TResult Function() pad,
    required TResult Function() loadModel,
    required TResult Function(int progress, int total) inference,
    required TResult Function() saveImage,
    required TResult Function() done,
  }) {
    return loadModel();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? waiting,
    TResult? Function()? loadImage,
    TResult? Function()? pad,
    TResult? Function()? loadModel,
    TResult? Function(int progress, int total)? inference,
    TResult? Function()? saveImage,
    TResult? Function()? done,
  }) {
    return loadModel?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? waiting,
    TResult Function()? loadImage,
    TResult Function()? pad,
    TResult Function()? loadModel,
    TResult Function(int progress, int total)? inference,
    TResult Function()? saveImage,
    TResult Function()? done,
    required TResult orElse(),
  }) {
    if (loadModel != null) {
      return loadModel();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TaskState_Waiting value) waiting,
    required TResult Function(TaskState_LoadImage value) loadImage,
    required TResult Function(TaskState_Pad value) pad,
    required TResult Function(TaskState_LoadModel value) loadModel,
    required TResult Function(TaskState_Inference value) inference,
    required TResult Function(TaskState_SaveImage value) saveImage,
    required TResult Function(TaskState_Done value) done,
  }) {
    return loadModel(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TaskState_Waiting value)? waiting,
    TResult? Function(TaskState_LoadImage value)? loadImage,
    TResult? Function(TaskState_Pad value)? pad,
    TResult? Function(TaskState_LoadModel value)? loadModel,
    TResult? Function(TaskState_Inference value)? inference,
    TResult? Function(TaskState_SaveImage value)? saveImage,
    TResult? Function(TaskState_Done value)? done,
  }) {
    return loadModel?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TaskState_Waiting value)? waiting,
    TResult Function(TaskState_LoadImage value)? loadImage,
    TResult Function(TaskState_Pad value)? pad,
    TResult Function(TaskState_LoadModel value)? loadModel,
    TResult Function(TaskState_Inference value)? inference,
    TResult Function(TaskState_SaveImage value)? saveImage,
    TResult Function(TaskState_Done value)? done,
    required TResult orElse(),
  }) {
    if (loadModel != null) {
      return loadModel(this);
    }
    return orElse();
  }
}

abstract class TaskState_LoadModel extends TaskState {
  const factory TaskState_LoadModel() = _$TaskState_LoadModelImpl;
  const TaskState_LoadModel._() : super._();
}

/// @nodoc
abstract class _$$TaskState_InferenceImplCopyWith<$Res> {
  factory _$$TaskState_InferenceImplCopyWith(_$TaskState_InferenceImpl value,
          $Res Function(_$TaskState_InferenceImpl) then) =
      __$$TaskState_InferenceImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int progress, int total});
}

/// @nodoc
class __$$TaskState_InferenceImplCopyWithImpl<$Res>
    extends _$TaskStateCopyWithImpl<$Res, _$TaskState_InferenceImpl>
    implements _$$TaskState_InferenceImplCopyWith<$Res> {
  __$$TaskState_InferenceImplCopyWithImpl(_$TaskState_InferenceImpl _value,
      $Res Function(_$TaskState_InferenceImpl) _then)
      : super(_value, _then);

  /// Create a copy of TaskState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? progress = null,
    Object? total = null,
  }) {
    return _then(_$TaskState_InferenceImpl(
      progress: null == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$TaskState_InferenceImpl extends TaskState_Inference {
  const _$TaskState_InferenceImpl({required this.progress, required this.total})
      : super._();

  @override
  final int progress;
  @override
  final int total;

  @override
  String toString() {
    return 'TaskState.inference(progress: $progress, total: $total)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskState_InferenceImpl &&
            (identical(other.progress, progress) ||
                other.progress == progress) &&
            (identical(other.total, total) || other.total == total));
  }

  @override
  int get hashCode => Object.hash(runtimeType, progress, total);

  /// Create a copy of TaskState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskState_InferenceImplCopyWith<_$TaskState_InferenceImpl> get copyWith =>
      __$$TaskState_InferenceImplCopyWithImpl<_$TaskState_InferenceImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() waiting,
    required TResult Function() loadImage,
    required TResult Function() pad,
    required TResult Function() loadModel,
    required TResult Function(int progress, int total) inference,
    required TResult Function() saveImage,
    required TResult Function() done,
  }) {
    return inference(progress, total);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? waiting,
    TResult? Function()? loadImage,
    TResult? Function()? pad,
    TResult? Function()? loadModel,
    TResult? Function(int progress, int total)? inference,
    TResult? Function()? saveImage,
    TResult? Function()? done,
  }) {
    return inference?.call(progress, total);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? waiting,
    TResult Function()? loadImage,
    TResult Function()? pad,
    TResult Function()? loadModel,
    TResult Function(int progress, int total)? inference,
    TResult Function()? saveImage,
    TResult Function()? done,
    required TResult orElse(),
  }) {
    if (inference != null) {
      return inference(progress, total);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TaskState_Waiting value) waiting,
    required TResult Function(TaskState_LoadImage value) loadImage,
    required TResult Function(TaskState_Pad value) pad,
    required TResult Function(TaskState_LoadModel value) loadModel,
    required TResult Function(TaskState_Inference value) inference,
    required TResult Function(TaskState_SaveImage value) saveImage,
    required TResult Function(TaskState_Done value) done,
  }) {
    return inference(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TaskState_Waiting value)? waiting,
    TResult? Function(TaskState_LoadImage value)? loadImage,
    TResult? Function(TaskState_Pad value)? pad,
    TResult? Function(TaskState_LoadModel value)? loadModel,
    TResult? Function(TaskState_Inference value)? inference,
    TResult? Function(TaskState_SaveImage value)? saveImage,
    TResult? Function(TaskState_Done value)? done,
  }) {
    return inference?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TaskState_Waiting value)? waiting,
    TResult Function(TaskState_LoadImage value)? loadImage,
    TResult Function(TaskState_Pad value)? pad,
    TResult Function(TaskState_LoadModel value)? loadModel,
    TResult Function(TaskState_Inference value)? inference,
    TResult Function(TaskState_SaveImage value)? saveImage,
    TResult Function(TaskState_Done value)? done,
    required TResult orElse(),
  }) {
    if (inference != null) {
      return inference(this);
    }
    return orElse();
  }
}

abstract class TaskState_Inference extends TaskState {
  const factory TaskState_Inference(
      {required final int progress,
      required final int total}) = _$TaskState_InferenceImpl;
  const TaskState_Inference._() : super._();

  int get progress;
  int get total;

  /// Create a copy of TaskState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TaskState_InferenceImplCopyWith<_$TaskState_InferenceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TaskState_SaveImageImplCopyWith<$Res> {
  factory _$$TaskState_SaveImageImplCopyWith(_$TaskState_SaveImageImpl value,
          $Res Function(_$TaskState_SaveImageImpl) then) =
      __$$TaskState_SaveImageImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TaskState_SaveImageImplCopyWithImpl<$Res>
    extends _$TaskStateCopyWithImpl<$Res, _$TaskState_SaveImageImpl>
    implements _$$TaskState_SaveImageImplCopyWith<$Res> {
  __$$TaskState_SaveImageImplCopyWithImpl(_$TaskState_SaveImageImpl _value,
      $Res Function(_$TaskState_SaveImageImpl) _then)
      : super(_value, _then);

  /// Create a copy of TaskState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$TaskState_SaveImageImpl extends TaskState_SaveImage {
  const _$TaskState_SaveImageImpl() : super._();

  @override
  String toString() {
    return 'TaskState.saveImage()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskState_SaveImageImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() waiting,
    required TResult Function() loadImage,
    required TResult Function() pad,
    required TResult Function() loadModel,
    required TResult Function(int progress, int total) inference,
    required TResult Function() saveImage,
    required TResult Function() done,
  }) {
    return saveImage();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? waiting,
    TResult? Function()? loadImage,
    TResult? Function()? pad,
    TResult? Function()? loadModel,
    TResult? Function(int progress, int total)? inference,
    TResult? Function()? saveImage,
    TResult? Function()? done,
  }) {
    return saveImage?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? waiting,
    TResult Function()? loadImage,
    TResult Function()? pad,
    TResult Function()? loadModel,
    TResult Function(int progress, int total)? inference,
    TResult Function()? saveImage,
    TResult Function()? done,
    required TResult orElse(),
  }) {
    if (saveImage != null) {
      return saveImage();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TaskState_Waiting value) waiting,
    required TResult Function(TaskState_LoadImage value) loadImage,
    required TResult Function(TaskState_Pad value) pad,
    required TResult Function(TaskState_LoadModel value) loadModel,
    required TResult Function(TaskState_Inference value) inference,
    required TResult Function(TaskState_SaveImage value) saveImage,
    required TResult Function(TaskState_Done value) done,
  }) {
    return saveImage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TaskState_Waiting value)? waiting,
    TResult? Function(TaskState_LoadImage value)? loadImage,
    TResult? Function(TaskState_Pad value)? pad,
    TResult? Function(TaskState_LoadModel value)? loadModel,
    TResult? Function(TaskState_Inference value)? inference,
    TResult? Function(TaskState_SaveImage value)? saveImage,
    TResult? Function(TaskState_Done value)? done,
  }) {
    return saveImage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TaskState_Waiting value)? waiting,
    TResult Function(TaskState_LoadImage value)? loadImage,
    TResult Function(TaskState_Pad value)? pad,
    TResult Function(TaskState_LoadModel value)? loadModel,
    TResult Function(TaskState_Inference value)? inference,
    TResult Function(TaskState_SaveImage value)? saveImage,
    TResult Function(TaskState_Done value)? done,
    required TResult orElse(),
  }) {
    if (saveImage != null) {
      return saveImage(this);
    }
    return orElse();
  }
}

abstract class TaskState_SaveImage extends TaskState {
  const factory TaskState_SaveImage() = _$TaskState_SaveImageImpl;
  const TaskState_SaveImage._() : super._();
}

/// @nodoc
abstract class _$$TaskState_DoneImplCopyWith<$Res> {
  factory _$$TaskState_DoneImplCopyWith(_$TaskState_DoneImpl value,
          $Res Function(_$TaskState_DoneImpl) then) =
      __$$TaskState_DoneImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TaskState_DoneImplCopyWithImpl<$Res>
    extends _$TaskStateCopyWithImpl<$Res, _$TaskState_DoneImpl>
    implements _$$TaskState_DoneImplCopyWith<$Res> {
  __$$TaskState_DoneImplCopyWithImpl(
      _$TaskState_DoneImpl _value, $Res Function(_$TaskState_DoneImpl) _then)
      : super(_value, _then);

  /// Create a copy of TaskState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$TaskState_DoneImpl extends TaskState_Done {
  const _$TaskState_DoneImpl() : super._();

  @override
  String toString() {
    return 'TaskState.done()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$TaskState_DoneImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() waiting,
    required TResult Function() loadImage,
    required TResult Function() pad,
    required TResult Function() loadModel,
    required TResult Function(int progress, int total) inference,
    required TResult Function() saveImage,
    required TResult Function() done,
  }) {
    return done();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? waiting,
    TResult? Function()? loadImage,
    TResult? Function()? pad,
    TResult? Function()? loadModel,
    TResult? Function(int progress, int total)? inference,
    TResult? Function()? saveImage,
    TResult? Function()? done,
  }) {
    return done?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? waiting,
    TResult Function()? loadImage,
    TResult Function()? pad,
    TResult Function()? loadModel,
    TResult Function(int progress, int total)? inference,
    TResult Function()? saveImage,
    TResult Function()? done,
    required TResult orElse(),
  }) {
    if (done != null) {
      return done();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TaskState_Waiting value) waiting,
    required TResult Function(TaskState_LoadImage value) loadImage,
    required TResult Function(TaskState_Pad value) pad,
    required TResult Function(TaskState_LoadModel value) loadModel,
    required TResult Function(TaskState_Inference value) inference,
    required TResult Function(TaskState_SaveImage value) saveImage,
    required TResult Function(TaskState_Done value) done,
  }) {
    return done(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TaskState_Waiting value)? waiting,
    TResult? Function(TaskState_LoadImage value)? loadImage,
    TResult? Function(TaskState_Pad value)? pad,
    TResult? Function(TaskState_LoadModel value)? loadModel,
    TResult? Function(TaskState_Inference value)? inference,
    TResult? Function(TaskState_SaveImage value)? saveImage,
    TResult? Function(TaskState_Done value)? done,
  }) {
    return done?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TaskState_Waiting value)? waiting,
    TResult Function(TaskState_LoadImage value)? loadImage,
    TResult Function(TaskState_Pad value)? pad,
    TResult Function(TaskState_LoadModel value)? loadModel,
    TResult Function(TaskState_Inference value)? inference,
    TResult Function(TaskState_SaveImage value)? saveImage,
    TResult Function(TaskState_Done value)? done,
    required TResult orElse(),
  }) {
    if (done != null) {
      return done(this);
    }
    return orElse();
  }
}

abstract class TaskState_Done extends TaskState {
  const factory TaskState_Done() = _$TaskState_DoneImpl;
  const TaskState_Done._() : super._();
}
