import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart' as Foundation;
import 'package:get_it/get_it.dart';

import '../../flavor_config.dart';
import 'api_config.dart';
import 'endpoints.dart';
import 'util/base_response.dart';

class ApiClient {
  final CancelToken cancelToken = CancelToken();
  static final ApiClient _singleton = new ApiClient._internal();
  late Dio dio;

  factory ApiClient() {
    return _singleton;
  }

  ApiClient._internal() {
    _init();
  }

  void _init() {
    dio = Dio();
    dio.options.baseUrl = GetIt.I.get<FlavorConfig>().baseUrl;

    dio.options.connectTimeout = TimeOut.connectTimeout.inMilliseconds;
    dio.options.receiveTimeout = TimeOut.connectTimeout.inMilliseconds;

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          options.headers["User-Agent"] =
              "github_flutter_app/${Platform.operatingSystem}";
          options.headers["Authorization"] = "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";
          return handler.next(options);
        },
      ),
    );

    //add logging interceptor with debug check
    dio.interceptors.add(LogInterceptor(
      requestBody: Foundation.kDebugMode,
      request: Foundation.kDebugMode,
      requestHeader: Foundation.kDebugMode,
      responseBody: Foundation.kDebugMode,
    ));
  }

  /// Login
  Future<ApiResponse> login(Map<String, dynamic> map) {
    return _post(UrlPath.auth, map: map);
  }

  /// Get repos
  Future<ApiResponse> getRepos(Map<String, dynamic> queryParameters) {
    return _get(UrlPath.getRepos, queryParameters: queryParameters);
  }

  /// Top level methods
  ///
  /// common GET method
  Future<ApiResponse> _get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      Response response = await dio.get(
        path,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
      );
      return _getResponse(response);
    } on DioError catch (e) {
      throw _getError(e);
    }
  }

  /// Common POST method
  Future<ApiResponse> _post(
    String path, {
    dynamic map,
  }) async {
    try {
      Response response = await dio.post(
        path,
        data: map,
        cancelToken: cancelToken,
      );
      return _getResponse(response);
    } on DioError catch (e) {
      throw _getError(e);
    }
  }

  ApiResponse _getResponse(Response response) {
    if (response.data != null) {
      return ApiResponse(response.data);
    }
    throw ApiError(ErrorType.apiFailure,
        code: "API_ERROR", message: "Error message");
  }

  ApiError _getError(DioError e) {
    switch (e.type) {
      case DioErrorType.connectTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.receiveTimeout:
        return ApiError(ErrorType.timeout);
        break;
      case DioErrorType.response: //401, 404, 403
        if (e.response?.statusCode == HttpStatus.unauthorized) {
          //GetIt.I.get<AppModel>().setSessionExpired();
        }
        final rawResponse = RawResponse.fromJson(e.response?.data);
        return ApiError(ErrorType.apiFailure,
            code: rawResponse.error?.code, message: rawResponse.error?.msg);
      case DioErrorType.other:
        if (e.error is SocketException) {
          return ApiError(ErrorType.noConnection);
        }
        return ApiError(ErrorType.unknown);
      default:
        return ApiError(ErrorType.unknown);
    }
  }

  String _buildPathWithParam(String urlPath, param) {
    var path = urlPath;
    if (param != null) {
      path = '$path/$param';
    }
    return path;
  }
}
