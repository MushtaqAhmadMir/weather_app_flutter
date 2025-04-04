import 'package:json_annotation/json_annotation.dart';

class WeatherForFiveDaysModel {
  String cod;
  int message;
  int cnt;
  List<WeatherForFiveDaysListModel?> list;
  WeatherForFiveDaysCityModel? city;

  WeatherForFiveDaysModel(
    this.cod,
    this.message,
    this.cnt,
    this.list,
    this.city,
  );
}

class WeatherForFiveDaysListModel {
  int dt;
  WeatherForFiveDaysListMainModel? main;
  List<WeatherForFiveDaysListWeatherModel?> weather;
  WeatherForFiveDaysListCloudsModel? clouds;
  WeatherForFiveDaysListWindModel? wind;
  int visibility;
  double pop;
  WeatherForFiveDaysListRainModel? rain;
  WeatherForFiveDaysListSysModel? sys;
  String dtTxt;

  WeatherForFiveDaysListModel(
    this.dt,
    this.main,
    this.weather,
    this.clouds,
    this.wind,
    this.visibility,
    this.pop,
    this.rain,
    this.sys,
    this.dtTxt,
  );
}

class WeatherForFiveDaysListMainModel {
  double temp;

  double feelsLike;

  double tempMin;

  double tempMax;
  int pressure;

  int seaLevel;

  int grndLevel;
  int humidity;

  double tempKf;

  WeatherForFiveDaysListMainModel(
    this.temp,
    this.feelsLike,
    this.tempMin,
    this.tempMax,
    this.pressure,
    this.seaLevel,
    this.grndLevel,
    this.humidity,
    this.tempKf,
  );
}

class WeatherForFiveDaysListWeatherModel {
  int id;
  String main;
  String description;
  String icon;

  WeatherForFiveDaysListWeatherModel(
    this.id,
    this.main,
    this.description,
    this.icon,
  );
}

class WeatherForFiveDaysListCloudsModel {
  int all;

  WeatherForFiveDaysListCloudsModel(this.all);
}

@JsonSerializable()
class WeatherForFiveDaysListWindModel {
  double speed;
  int deg;
  double gust;

  WeatherForFiveDaysListWindModel(this.speed, this.deg, this.gust);
}

class WeatherForFiveDaysListRainModel {
  double $1h;

  WeatherForFiveDaysListRainModel(this.$1h);
}

class WeatherForFiveDaysListSysModel {
  String pod;

  WeatherForFiveDaysListSysModel(this.pod);
}

class WeatherForFiveDaysCityModel {
  int id;
  String name;
  WeatherForFiveDaysCityCoordModel? coord;
  String country;
  int population;
  int timezone;
  int sunrise;
  int sunset;

  WeatherForFiveDaysCityModel(
    this.id,
    this.name,
    this.coord,
    this.country,
    this.population,
    this.timezone,
    this.sunrise,
    this.sunset,
  );
}

class WeatherForFiveDaysCityCoordModel {
  double lat;
  double lon;

  WeatherForFiveDaysCityCoordModel(this.lat, this.lon);
}
