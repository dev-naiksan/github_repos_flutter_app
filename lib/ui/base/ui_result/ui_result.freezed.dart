// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ui_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UiResult<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data) success,
    required TResult Function(ErrorType type, String? code) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T data)? success,
    TResult? Function(ErrorType type, String? code)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data)? success,
    TResult Function(ErrorType type, String? code)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UiSuccess<T> value) success,
    required TResult Function(UiFailure<T> value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UiSuccess<T> value)? success,
    TResult? Function(UiFailure<T> value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UiSuccess<T> value)? success,
    TResult Function(UiFailure<T> value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UiResultCopyWith<T, $Res> {
  factory $UiResultCopyWith(
          UiResult<T> value, $Res Function(UiResult<T>) then) =
      _$UiResultCopyWithImpl<T, $Res, UiResult<T>>;
}

/// @nodoc
class _$UiResultCopyWithImpl<T, $Res, $Val extends UiResult<T>>
    implements $UiResultCopyWith<T, $Res> {
  _$UiResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$UiSuccessImplCopyWith<T, $Res> {
  factory _$$UiSuccessImplCopyWith(
          _$UiSuccessImpl<T> value, $Res Function(_$UiSuccessImpl<T>) then) =
      __$$UiSuccessImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T data});
}

/// @nodoc
class __$$UiSuccessImplCopyWithImpl<T, $Res>
    extends _$UiResultCopyWithImpl<T, $Res, _$UiSuccessImpl<T>>
    implements _$$UiSuccessImplCopyWith<T, $Res> {
  __$$UiSuccessImplCopyWithImpl(
      _$UiSuccessImpl<T> _value, $Res Function(_$UiSuccessImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$UiSuccessImpl<T>(
      freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$UiSuccessImpl<T> implements UiSuccess<T> {
  const _$UiSuccessImpl(this.data);

  @override
  final T data;

  @override
  String toString() {
    return 'UiResult<$T>.success(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UiSuccessImpl<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UiSuccessImplCopyWith<T, _$UiSuccessImpl<T>> get copyWith =>
      __$$UiSuccessImplCopyWithImpl<T, _$UiSuccessImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data) success,
    required TResult Function(ErrorType type, String? code) failure,
  }) {
    return success(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T data)? success,
    TResult? Function(ErrorType type, String? code)? failure,
  }) {
    return success?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data)? success,
    TResult Function(ErrorType type, String? code)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UiSuccess<T> value) success,
    required TResult Function(UiFailure<T> value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UiSuccess<T> value)? success,
    TResult? Function(UiFailure<T> value)? failure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UiSuccess<T> value)? success,
    TResult Function(UiFailure<T> value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class UiSuccess<T> implements UiResult<T> {
  const factory UiSuccess(final T data) = _$UiSuccessImpl<T>;

  T get data;
  @JsonKey(ignore: true)
  _$$UiSuccessImplCopyWith<T, _$UiSuccessImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UiFailureImplCopyWith<T, $Res> {
  factory _$$UiFailureImplCopyWith(
          _$UiFailureImpl<T> value, $Res Function(_$UiFailureImpl<T>) then) =
      __$$UiFailureImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({ErrorType type, String? code});
}

/// @nodoc
class __$$UiFailureImplCopyWithImpl<T, $Res>
    extends _$UiResultCopyWithImpl<T, $Res, _$UiFailureImpl<T>>
    implements _$$UiFailureImplCopyWith<T, $Res> {
  __$$UiFailureImplCopyWithImpl(
      _$UiFailureImpl<T> _value, $Res Function(_$UiFailureImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? code = freezed,
  }) {
    return _then(_$UiFailureImpl<T>(
      null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ErrorType,
      freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$UiFailureImpl<T> implements UiFailure<T> {
  const _$UiFailureImpl(this.type, [this.code]);

  @override
  final ErrorType type;
  @override
  final String? code;

  @override
  String toString() {
    return 'UiResult<$T>.failure(type: $type, code: $code)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UiFailureImpl<T> &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.code, code) || other.code == code));
  }

  @override
  int get hashCode => Object.hash(runtimeType, type, code);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UiFailureImplCopyWith<T, _$UiFailureImpl<T>> get copyWith =>
      __$$UiFailureImplCopyWithImpl<T, _$UiFailureImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data) success,
    required TResult Function(ErrorType type, String? code) failure,
  }) {
    return failure(type, code);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T data)? success,
    TResult? Function(ErrorType type, String? code)? failure,
  }) {
    return failure?.call(type, code);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data)? success,
    TResult Function(ErrorType type, String? code)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(type, code);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UiSuccess<T> value) success,
    required TResult Function(UiFailure<T> value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UiSuccess<T> value)? success,
    TResult? Function(UiFailure<T> value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UiSuccess<T> value)? success,
    TResult Function(UiFailure<T> value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class UiFailure<T> implements UiResult<T> {
  const factory UiFailure(final ErrorType type, [final String? code]) =
      _$UiFailureImpl<T>;

  ErrorType get type;
  String? get code;
  @JsonKey(ignore: true)
  _$$UiFailureImplCopyWith<T, _$UiFailureImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
