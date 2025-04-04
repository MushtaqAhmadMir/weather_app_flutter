import 'package:injectable/injectable.dart';
import 'package:weather_app_flutter/data/cloud/def/weather_cloud.dart';
import 'package:weather_app_flutter/domain/repository/weather_repository.dart';
import 'package:weather_app_flutter/domain/resource/input/get_weather_input/get_weather_input.dart';
import 'package:weather_app_flutter/domain/resource/model/weather_model.dart';
import 'package:weather_app_flutter/domain/resource/model/weather_model_for_five_days.dart';

@Injectable(as: WeatherRepository)
class WeatherRepositoryImpl extends WeatherRepository {
  final WeatherCloud _cloud;

  WeatherRepositoryImpl(this._cloud);
  @override
  Future<WeatherReportModel> getWeatherReport(GetWeatherInput input) async {
    var entity = await _cloud.getForecast(input);
    return entity.mapEntityToModel();
  }

  @override
  Future<WeatherForFiveDaysModel> getWeatherReportForFiveDays(
    GetWeatherInput input,
  ) async {
    var entity = await _cloud.getForecastForFiveDays(input);
    return entity.mapEntityToModel();
  }
}
