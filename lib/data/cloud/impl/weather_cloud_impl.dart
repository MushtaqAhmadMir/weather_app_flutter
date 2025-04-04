import 'package:injectable/injectable.dart';
import 'package:weather_app_flutter/data/cloud/def/weather_cloud.dart';
import 'package:weather_app_flutter/data/sdk/entites/weather_report/weather_report_entity.dart';
import 'package:weather_app_flutter/data/sdk/entites/weather_report_for_five_days/weather_for_five_days_entity.dart';
import 'package:weather_app_flutter/data/sdk/service/weather/weather_service.dart';
import 'package:weather_app_flutter/domain/resource/input/get_weather_input/get_weather_input.dart';

@Injectable(as: WeatherCloud)
class WeatherCloudImpl extends WeatherCloud {
  final WeatherService weatherService;

  WeatherCloudImpl(this.weatherService);

  @override
  Future<WeatherReportEntity> getForecast(GetWeatherInput input) {
    return weatherService.getWeatherReport(
      input.q ?? "",
      input.lat,
      input.lng,
      input.units?.name ?? '',
      input.appId,
    );
  }

  @override
  Future<WeatherForFiveDaysEntity> getForecastForFiveDays(
    GetWeatherInput input,
  ) {
    return weatherService.getWeatherReportForFiveDays(
      input.q ?? "",
      input.lat,
      input.lng,
      input.appId,
    );
  }
}
