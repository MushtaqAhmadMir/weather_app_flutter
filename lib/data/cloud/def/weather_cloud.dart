import 'package:weather_app_flutter/data/sdk/entites/weather_report/weather_report_entity.dart';
import 'package:weather_app_flutter/data/sdk/entites/weather_report_for_five_days/weather_for_five_days_entity.dart';
import 'package:weather_app_flutter/domain/resource/input/get_weather_input/get_weather_input.dart';

abstract class WeatherCloud {
  Future<WeatherReportEntity> getForecast(GetWeatherInput input);
  Future<WeatherForFiveDaysEntity> getForecastForFiveDays(
    GetWeatherInput input,
  );
}
