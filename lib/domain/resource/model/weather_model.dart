class WeatherReportModel {
  WeatherReportCoordModel? coord;
  List<WeatherReportWeatherModel> weather;
  String? base;
  WeatherReportMainModel? main;
  int? visibility;
  WeatherReportWindModel? wind;
  WeatherReportRainModel? rain;
  WeatherReportCloudsModel? clouds;
  int dt;
  WeatherReportSysModel? sys;
  int timezone;
  int id;
  String name;
  int cod;

  WeatherReportModel(
    this.coord,
    this.weather,
    this.base,
    this.main,
    this.visibility,
    this.wind,
    this.rain,
    this.clouds,
    this.dt,
    this.sys,
    this.timezone,
    this.id,
    this.name,
    this.cod,
  );
}

class WeatherReportCoordModel {
  double lon;
  double lat;

  WeatherReportCoordModel(this.lon, this.lat);
}

class WeatherReportWeatherModel {
  int id;
  String main;
  String description;
  String icon;

  WeatherReportWeatherModel(this.id, this.main, this.description, this.icon);
}

class WeatherReportMainModel {
  double temp;

  double feelsLike;

  double tempMin;

  double tempMax;
  int pressure;
  int humidity;

  int seaLevel;

  int grndLevel;

  WeatherReportMainModel(
    this.temp,
    this.feelsLike,
    this.tempMin,
    this.tempMax,
    this.pressure,
    this.humidity,
    this.seaLevel,
    this.grndLevel,
  );
}

class WeatherReportWindModel {
  double speed;
  int deg;
  double gust;

  WeatherReportWindModel(this.speed, this.deg, this.gust);
}

class WeatherReportRainModel {
  double $1h;

  WeatherReportRainModel(this.$1h);
}

class WeatherReportCloudsModel {
  int all;

  WeatherReportCloudsModel(this.all);
}

class WeatherReportSysModel {
  int type;
  int id;
  String country;
  int sunrise;
  int sunset;

  WeatherReportSysModel(
    this.type,
    this.id,
    this.country,
    this.sunrise,
    this.sunset,
  );
}
