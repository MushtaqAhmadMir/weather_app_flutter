import 'package:injectable/injectable.dart';
import 'package:weather_app_flutter/common/resource/data_type.dart';
import 'package:weather_app_flutter/common/usecase/default_usecase.dart';
import 'package:weather_app_flutter/domain/repository/weather_repository.dart';
import 'package:weather_app_flutter/domain/resource/input/get_weather_input/get_weather_input.dart';
import 'package:weather_app_flutter/domain/resource/model/weather_model.dart';

@injectable
class GetWeatherUseCase
    extends DefaultUseCase<GetWeatherInput, WeatherReportModel> {
  final WeatherRepository repository;

  GetWeatherUseCase(this.repository);

  @override
  Future<WeatherReportModel> run(GetWeatherInput input, DataType dataType) {
    return repository.getWeatherReport(input);
  }
}
