enum ErrorType { timeout, noConnection, apiFailure, unknown }

class ApiError {
  final ErrorType type;
  final String? code;
  final String? message;

  ApiError(this.type, {this.code, this.message});

  String get errorMessage => message ?? "Some error occurred";
}

class ApiResponse {
  final dynamic data;

  ApiResponse(this.data);
}

class RawError {
  late String code;
  late String msg;

  RawError({required this.code, required this.msg});

  RawError.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['msg'] = this.msg;
    return data;
  }
}

class RawResponse {
  dynamic payload;
  RawError? error;
  String? msg;

  RawResponse({this.payload, this.error, this.msg});

  RawResponse.fromJson(Map<String, dynamic> json) {
    payload = json['payload'];
    error = json['error'] != null ? new RawError.fromJson(json['error']) : null;
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.payload != null) {
      data['payload'] = this.payload.toJson();
    }
    if (this.error != null) {
      data['error'] = this.error?.toJson();
    }
    data['msg'] = this.msg;
    return data;
  }

  bool get isSuccess => error == null;
}
