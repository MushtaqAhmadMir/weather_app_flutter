import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_app_flutter/common/di/injection.config.dart';
import 'package:weather_app_flutter/common/utils/extentions.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
)
void configureDependencyInjection() => getIt.init();

@module
abstract class RegisterModule {
  @lazySingleton
  Dio get dio {
    final dio = Dio();

    // Add PrettyDioLogger
    if (kReleaseMode.not()) {
      dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseHeader: true,
        ),
      );
    }

    return dio;
  }
}
