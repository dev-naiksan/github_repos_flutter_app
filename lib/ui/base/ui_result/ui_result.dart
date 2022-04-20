import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/network/util/base_response.dart';

part 'ui_result.freezed.dart';

@freezed
class UiResult<T> with _$UiResult {
  const factory UiResult.success(T data) = UiSuccess<T>;

  const factory UiResult.failure(ErrorType type, [String? code]) = UiFailure<T>;
}
