import 'package:weather_app_flutter/common/utils/enums.dart';

class GetWeatherInput {
  final String lat;
  final String lng;
  final String appId;
  final String? q;
  final LocationUnits? units;

  GetWeatherInput({
    required this.lat,
    required this.lng,
    required this.appId,
    this.units,
    this.q,
  });
}
