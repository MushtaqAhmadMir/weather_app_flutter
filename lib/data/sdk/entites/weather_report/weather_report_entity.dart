import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app_flutter/domain/resource/model/weather_model.dart';

part 'weather_report_entity.g.dart';

@JsonSerializable()
class WeatherReportEntity {
  WeatherReportCoordEntity? coord;
  List<WeatherReportWeatherEntity>? weather;
  String? base;
  WeatherReportMainEntity? main;
  int? visibility;
  WeatherReportWindEntity? wind;
  WeatherReportRainEntity? rain;
  WeatherReportCloudsEntity? clouds;
  int? dt;
  WeatherReportSysEntity? sys;
  int? timezone;
  int? id;
  String? name;
  int? cod;

  WeatherReportEntity(
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

  factory WeatherReportEntity.fromJson(Map<String, dynamic> json) =>
      _$WeatherReportEntityFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherReportEntityToJson(this);

  WeatherReportModel mapEntityToModel() {
    return WeatherReportModel(
      coord?.mapEntityToModel(),
      weather?.map((e) => e.mapEntityToModel()).toList() ?? [],
      base,
      main?.mapEntityToModel(),
      visibility,
      wind?.mapEntityToModel(),
      rain?.mapEntityToModel(),
      clouds?.mapEntityToModel(),
      dt ?? 0,
      sys?.mapEntityToModel(),
      timezone ?? 0,
      id ?? 0,
      name ?? "",
      cod ?? 0,
    );
  }
}

@JsonSerializable()
class WeatherReportCoordEntity {
  double? lon;
  double? lat;

  WeatherReportCoordEntity(this.lon, this.lat);

  factory WeatherReportCoordEntity.fromJson(Map<String, dynamic> json) =>
      _$WeatherReportCoordEntityFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherReportCoordEntityToJson(this);

  WeatherReportCoordModel mapEntityToModel() {
    return WeatherReportCoordModel(lon ?? 0, lat ?? 0);
  }
}

@JsonSerializable()
class WeatherReportWeatherEntity {
  int? id;
  String main;
  String description;
  String icon;

  WeatherReportWeatherEntity(this.id, this.main, this.description, this.icon);

  factory WeatherReportWeatherEntity.fromJson(Map<String, dynamic> json) =>
      _$WeatherReportWeatherEntityFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherReportWeatherEntityToJson(this);

  WeatherReportWeatherModel mapEntityToModel() {
    return WeatherReportWeatherModel(id ?? 0, main, description, icon);
  }
}

@JsonSerializable()
class WeatherReportMainEntity {
  double? temp;
  @JsonKey(name: 'feels_like')
  double? feelsLike;
  @JsonKey(name: 'temp_min')
  double? tempMin;
  @JsonKey(name: 'temp_max')
  double? tempMax;
  int? pressure;
  int? humidity;
  @JsonKey(name: 'sea_level')
  int? seaLevel;
  @JsonKey(name: 'grnd_level')
  int? grndLevel;

  WeatherReportMainEntity(
    this.temp,
    this.feelsLike,
    this.tempMin,
    this.tempMax,
    this.pressure,
    this.humidity,
    this.seaLevel,
    this.grndLevel,
  );

  factory WeatherReportMainEntity.fromJson(Map<String, dynamic> json) =>
      _$WeatherReportMainEntityFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherReportMainEntityToJson(this);

  WeatherReportMainModel mapEntityToModel() {
    return WeatherReportMainModel(
      temp ?? 0,
      feelsLike ?? 0,
      tempMin ?? 0,
      tempMax ?? 0,
      pressure ?? 0,
      humidity ?? 0,
      seaLevel ?? 0,
      grndLevel ?? 0,
    );
  }
}

@JsonSerializable()
class WeatherReportWindEntity {
  double? speed;
  int? deg;
  double? gust;

  WeatherReportWindEntity(this.speed, this.deg, this.gust);

  factory WeatherReportWindEntity.fromJson(Map<String, dynamic> json) =>
      _$WeatherReportWindEntityFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherReportWindEntityToJson(this);

  WeatherReportWindModel mapEntityToModel() {
    return WeatherReportWindModel(speed ?? 0, deg ?? 0, gust ?? 0);
  }
}

@JsonSerializable()
class WeatherReportRainEntity {
  @JsonKey(name: '1h')
  double? $1h;

  WeatherReportRainEntity(this.$1h);

  factory WeatherReportRainEntity.fromJson(Map<String, dynamic> json) =>
      _$WeatherReportRainEntityFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherReportRainEntityToJson(this);

  WeatherReportRainModel mapEntityToModel() {
    return WeatherReportRainModel($1h ?? 0);
  }
}

@JsonSerializable()
class WeatherReportCloudsEntity {
  int? all;

  WeatherReportCloudsEntity(this.all);

  factory WeatherReportCloudsEntity.fromJson(Map<String, dynamic> json) =>
      _$WeatherReportCloudsEntityFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherReportCloudsEntityToJson(this);

  WeatherReportCloudsModel mapEntityToModel() {
    return WeatherReportCloudsModel(all ?? 0);
  }
}

@JsonSerializable()
class WeatherReportSysEntity {
  int? type;
  int? id;
  String country;
  int? sunrise;
  int? sunset;

  WeatherReportSysEntity(
    this.type,
    this.id,
    this.country,
    this.sunrise,
    this.sunset,
  );

  factory WeatherReportSysEntity.fromJson(Map<String, dynamic> json) =>
      _$WeatherReportSysEntityFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherReportSysEntityToJson(this);

  WeatherReportSysModel mapEntityToModel() {
    return WeatherReportSysModel(
      type ?? 0,
      id ?? 0,
      country,
      sunrise ?? 0,
      sunset ?? 0,
    );
  }
}
