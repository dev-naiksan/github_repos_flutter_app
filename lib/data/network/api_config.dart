class TimeOut {
  static const Duration connectTimeout = Duration(seconds: 20);
  static const Duration receiveTimeout = Duration(seconds: 20);
}

class RetryConfig {
  static const Duration retryInterval = Duration(milliseconds: 100);
  static const int maxRetries = 2;
}
