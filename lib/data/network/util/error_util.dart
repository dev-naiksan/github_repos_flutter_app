import '../../../flavor_config.dart';
import 'base_response.dart';

class ErrorUtil {
  static const DEFAULT_ERROR_MESSAGE = "Something went wrong";
  static const _NO_INTERNET_ERROR_MESSAGE = "No internet connection";
  static const _TIMEOUT_ERROR_MESSAGE =
      "Please check your internet connection. It is taking too long to connect.";

  static const VERSION_NOT_SUPPORTED = 'VERSION_NOT_SUPPORTED';

  static String getApiError(error) {
    if (error is ApiError) {
      return ErrorUtil.getErrorMessageForApiError(error);
    } else if (error is Exception) {
      if (FlavorConfig.isDevelopment()) {
        return error.toString();
      }
    }
    return ErrorUtil.DEFAULT_ERROR_MESSAGE;
  }

  static String getErrorMessageForApiError(ApiError apiError) {
    switch (apiError.type) {
      case ErrorType.timeout:
        return _TIMEOUT_ERROR_MESSAGE;
      case ErrorType.noConnection:
        return _NO_INTERNET_ERROR_MESSAGE;
      case ErrorType.apiFailure:
        return _errorMessages[apiError.code] ??
            apiError.message ??
            DEFAULT_ERROR_MESSAGE;
      default:
        return apiError.message ?? DEFAULT_ERROR_MESSAGE;
    }
  }

  static Map<String, String> _errorMessages = {
    "USER_NOT_FOUND": "Incorrect phone or password",
    "INVALID_PASSWORD": "Incorrect phone or password",
    "OTP_LIMIT_REACHED": "OTP request limit reached. Please try again later",
    "USER_EXISTS": "You are already registered. Please login into system",
    "LIMIT_REACHED": "Sorry, you cannot post more",
    "INVALID_OTP": "You have entered invalid OTP",
    "NO_DATA_FOUND": "Something went wrong, please try again",
  };
}
