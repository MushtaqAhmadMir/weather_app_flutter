// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../data/cloud/def/weather_cloud.dart' as _i91;
import '../../data/cloud/impl/weather_cloud_impl.dart' as _i394;
import '../../data/repository/weather_repository_impl.dart' as _i352;
import '../../data/sdk/service/weather/weather_service.dart' as _i358;
import '../../domain/repository/weather_repository.dart' as _i798;
import '../../domain/usecase/get_weather_for_five_days_usecase.dart' as _i544;
import '../../domain/usecase/get_weather_report_usecase.dart' as _i696;
import '../../presentation/screens/home/cubit/home_cubit.dart' as _i659;
import 'injection.dart' as _i464;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    gh.lazySingleton<_i361.Dio>(() => registerModule.dio);
    gh.factory<_i358.WeatherService>(
      () => _i358.WeatherService(gh<_i361.Dio>()),
    );
    gh.factory<_i91.WeatherCloud>(
      () => _i394.WeatherCloudImpl(gh<_i358.WeatherService>()),
    );
    gh.factory<_i798.WeatherRepository>(
      () => _i352.WeatherRepositoryImpl(gh<_i91.WeatherCloud>()),
    );
    gh.factory<_i696.GetWeatherUseCase>(
      () => _i696.GetWeatherUseCase(gh<_i798.WeatherRepository>()),
    );
    gh.factory<_i544.GetWeatherForFiveDaysUsecase>(
      () => _i544.GetWeatherForFiveDaysUsecase(gh<_i798.WeatherRepository>()),
    );
    gh.factory<_i659.HomeCubit>(
      () => _i659.HomeCubit(
        gh<_i696.GetWeatherUseCase>(),
        gh<_i544.GetWeatherForFiveDaysUsecase>(),
      ),
    );
    return this;
  }
}

class _$RegisterModule extends _i464.RegisterModule {}
