// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

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
    TResult Function(T data)? success,
    TResult Function(ErrorType type, String? code)? failure,
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
    TResult Function(UiSuccess<T> value)? success,
    TResult Function(UiFailure<T> value)? failure,
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
      _$UiResultCopyWithImpl<T, $Res>;
}

/// @nodoc
class _$UiResultCopyWithImpl<T, $Res> implements $UiResultCopyWith<T, $Res> {
  _$UiResultCopyWithImpl(this._value, this._then);

  final UiResult<T> _value;
  // ignore: unused_field
  final $Res Function(UiResult<T>) _then;
}

/// @nodoc
abstract class $UiSuccessCopyWith<T, $Res> {
  factory $UiSuccessCopyWith(
          UiSuccess<T> value, $Res Function(UiSuccess<T>) then) =
      _$UiSuccessCopyWithImpl<T, $Res>;
  $Res call({T data});
}

/// @nodoc
class _$UiSuccessCopyWithImpl<T, $Res> extends _$UiResultCopyWithImpl<T, $Res>
    implements $UiSuccessCopyWith<T, $Res> {
  _$UiSuccessCopyWithImpl(
      UiSuccess<T> _value, $Res Function(UiSuccess<T>) _then)
      : super(_value, (v) => _then(v as UiSuccess<T>));

  @override
  UiSuccess<T> get _value => super._value as UiSuccess<T>;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(UiSuccess<T>(
      data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$UiSuccess<T> implements UiSuccess<T> {
  const _$UiSuccess(this.data);

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
            other is UiSuccess<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  $UiSuccessCopyWith<T, UiSuccess<T>> get copyWith =>
      _$UiSuccessCopyWithImpl<T, UiSuccess<T>>(this, _$identity);

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
    TResult Function(T data)? success,
    TResult Function(ErrorType type, String? code)? failure,
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
    TResult Function(UiSuccess<T> value)? success,
    TResult Function(UiFailure<T> value)? failure,
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
  const factory UiSuccess(final T data) = _$UiSuccess<T>;

  T get data => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UiSuccessCopyWith<T, UiSuccess<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UiFailureCopyWith<T, $Res> {
  factory $UiFailureCopyWith(
          UiFailure<T> value, $Res Function(UiFailure<T>) then) =
      _$UiFailureCopyWithImpl<T, $Res>;
  $Res call({ErrorType type, String? code});
}

/// @nodoc
class _$UiFailureCopyWithImpl<T, $Res> extends _$UiResultCopyWithImpl<T, $Res>
    implements $UiFailureCopyWith<T, $Res> {
  _$UiFailureCopyWithImpl(
      UiFailure<T> _value, $Res Function(UiFailure<T>) _then)
      : super(_value, (v) => _then(v as UiFailure<T>));

  @override
  UiFailure<T> get _value => super._value as UiFailure<T>;

  @override
  $Res call({
    Object? type = freezed,
    Object? code = freezed,
  }) {
    return _then(UiFailure<T>(
      type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ErrorType,
      code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$UiFailure<T> implements UiFailure<T> {
  const _$UiFailure(this.type, [this.code]);

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
            other is UiFailure<T> &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other.code, code));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(code));

  @JsonKey(ignore: true)
  @override
  $UiFailureCopyWith<T, UiFailure<T>> get copyWith =>
      _$UiFailureCopyWithImpl<T, UiFailure<T>>(this, _$identity);

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
    TResult Function(T data)? success,
    TResult Function(ErrorType type, String? code)? failure,
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
    TResult Function(UiSuccess<T> value)? success,
    TResult Function(UiFailure<T> value)? failure,
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
      _$UiFailure<T>;

  ErrorType get type => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UiFailureCopyWith<T, UiFailure<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
