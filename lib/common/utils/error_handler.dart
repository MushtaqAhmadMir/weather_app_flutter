import 'package:dio/dio.dart';
import 'package:weather_app_flutter/common/resource/data_failure.dart';

class ErrorHandler {
  DataFailure traceErrorException(dynamic error) {
    if (error is DioException) {
      return traceDioException(error);
    }

    return DataFailure(0, "Unable to extract error!", error);
  }

  DataFailure traceDioException(DioException error) {
    return DataFailure(
      error.response?.statusCode,
      error.response?.statusMessage ?? "Unable to extract error!",
      error,
    );
  }
}
