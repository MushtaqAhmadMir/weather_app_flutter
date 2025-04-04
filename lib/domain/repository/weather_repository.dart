import 'package:weather_app_flutter/domain/resource/input/get_weather_input/get_weather_input.dart';
import 'package:weather_app_flutter/domain/resource/model/weather_model.dart';
import 'package:weather_app_flutter/domain/resource/model/weather_model_for_five_days.dart';

abstract class WeatherRepository {
  Future<WeatherReportModel> getWeatherReport(GetWeatherInput input);
  Future<WeatherForFiveDaysModel> getWeatherReportForFiveDays(
    GetWeatherInput input,
  );
}
