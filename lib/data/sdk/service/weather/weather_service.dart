import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:weather_app_flutter/common/utils/constants.dart';
import 'package:weather_app_flutter/data/sdk/entites/weather_report/weather_report_entity.dart';
import 'package:weather_app_flutter/data/sdk/entites/weather_report_for_five_days/weather_for_five_days_entity.dart';

part 'weather_service.g.dart';

@injectable
@RestApi(baseUrl: Constants.apiUrl)
abstract class WeatherService {
  @factoryMethod
  factory WeatherService(Dio dio) = _WeatherService;

  @GET("/data/2.5/weather")
  Future<WeatherReportEntity> getWeatherReport(
    @Query("q") String q,
    @Query("lat") String lat,
    @Query("lon") String lon,
    @Query("units") String units,
    @Query("appid") String appid,
  );

  @GET("/data/2.5/forecast")
  Future<WeatherForFiveDaysEntity> getWeatherReportForFiveDays(
    @Query("q") String q,
    @Query("lat") String lat,
    @Query("lon") String lon,
    @Query("appid") String appid,
  );
}
