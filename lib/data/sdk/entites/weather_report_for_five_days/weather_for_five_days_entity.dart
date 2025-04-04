import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app_flutter/domain/resource/model/weather_model_for_five_days.dart';

part 'weather_for_five_days_entity.g.dart';

@JsonSerializable()
class WeatherForFiveDaysEntity {
  String? cod;
  int? message;
  int? cnt;
  List<WeatherForFiveDaysListEntity>? list;
  WeatherForFiveDaysCityEntity? city;

  WeatherForFiveDaysEntity(
    this.cod,
    this.message,
    this.cnt,
    this.list,
    this.city,
  );

  factory WeatherForFiveDaysEntity.fromJson(Map<String, dynamic> json) =>
      _$WeatherForFiveDaysEntityFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherForFiveDaysEntityToJson(this);

  WeatherForFiveDaysModel mapEntityToModel() {
    return WeatherForFiveDaysModel(
      cod ?? "",
      message ?? 0,
      cnt ?? 0,
      list?.map((e) => e?.mapEntityToModel()).toList() ?? [],
      city?.mapEntityToModel(),
    );
  }
}

@JsonSerializable()
class WeatherForFiveDaysListEntity {
  int? dt;
  WeatherForFiveDaysListMainEntity? main;
  List<WeatherForFiveDaysListWeatherEntity>? weather;
  WeatherForFiveDaysListCloudsEntity? clouds;
  WeatherForFiveDaysListWindEntity? wind;
  int? visibility;
  double? pop;
  WeatherForFiveDaysListRainEntity? rain;
  WeatherForFiveDaysListSysEntity? sys;
  @JsonKey(name: 'dt_txt')
  String? dtTxt;

  WeatherForFiveDaysListEntity(
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

  factory WeatherForFiveDaysListEntity.fromJson(Map<String, dynamic> json) =>
      _$WeatherForFiveDaysListEntityFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherForFiveDaysListEntityToJson(this);

  WeatherForFiveDaysListModel mapEntityToModel() {
    return WeatherForFiveDaysListModel(
      dt ?? 0,
      main?.mapEntityToModel(),
      weather?.map((e) => e.mapEntityToModel()).toList() ?? [],
      clouds?.mapEntityToModel(),
      wind?.mapEntityToModel(),
      visibility ?? 0,
      pop ?? 0,
      rain?.mapEntityToModel(),
      sys?.mapEntityToModel(),
      dtTxt ?? "",
    );
  }
}

@JsonSerializable()
class WeatherForFiveDaysListMainEntity {
  double? temp;
  @JsonKey(name: 'feels_like')
  double? feelsLike;
  @JsonKey(name: 'temp_min')
  double? tempMin;
  @JsonKey(name: 'temp_max')
  double? tempMax;
  int? pressure;
  @JsonKey(name: 'sea_level')
  int? seaLevel;
  @JsonKey(name: 'grnd_level')
  int? grndLevel;
  int? humidity;
  @JsonKey(name: 'temp_kf')
  double? tempKf;

  WeatherForFiveDaysListMainEntity(
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

  factory WeatherForFiveDaysListMainEntity.fromJson(
    Map<String, dynamic> json,
  ) => _$WeatherForFiveDaysListMainEntityFromJson(json);

  Map<String, dynamic> toJson() =>
      _$WeatherForFiveDaysListMainEntityToJson(this);

  WeatherForFiveDaysListMainModel mapEntityToModel() {
    return WeatherForFiveDaysListMainModel(
      temp ?? 0,
      feelsLike ?? 0,
      tempMin ?? 0,
      tempMax ?? 0,
      pressure ?? 0,
      seaLevel ?? 0,
      grndLevel ?? 0,
      humidity ?? 0,
      tempKf ?? 0,
    );
  }
}

@JsonSerializable()
class WeatherForFiveDaysListWeatherEntity {
  int? id;
  String? main;
  String? description;
  String? icon;

  WeatherForFiveDaysListWeatherEntity(
    this.id,
    this.main,
    this.description,
    this.icon,
  );

  factory WeatherForFiveDaysListWeatherEntity.fromJson(
    Map<String, dynamic> json,
  ) => _$WeatherForFiveDaysListWeatherEntityFromJson(json);

  Map<String, dynamic> toJson() =>
      _$WeatherForFiveDaysListWeatherEntityToJson(this);

  WeatherForFiveDaysListWeatherModel mapEntityToModel() {
    return WeatherForFiveDaysListWeatherModel(
      id ?? 0,
      main ?? "",
      description ?? "",
      icon ?? "",
    );
  }
}

@JsonSerializable()
class WeatherForFiveDaysListCloudsEntity {
  int? all;

  WeatherForFiveDaysListCloudsEntity(this.all);

  factory WeatherForFiveDaysListCloudsEntity.fromJson(
    Map<String, dynamic> json,
  ) => _$WeatherForFiveDaysListCloudsEntityFromJson(json);

  Map<String, dynamic> toJson() =>
      _$WeatherForFiveDaysListCloudsEntityToJson(this);

  WeatherForFiveDaysListCloudsModel mapEntityToModel() {
    return WeatherForFiveDaysListCloudsModel(all ?? 0);
  }
}

@JsonSerializable()
class WeatherForFiveDaysListWindEntity {
  double? speed;
  int? deg;
  double? gust;

  WeatherForFiveDaysListWindEntity(this.speed, this.deg, this.gust);

  factory WeatherForFiveDaysListWindEntity.fromJson(
    Map<String, dynamic> json,
  ) => _$WeatherForFiveDaysListWindEntityFromJson(json);

  Map<String, dynamic> toJson() =>
      _$WeatherForFiveDaysListWindEntityToJson(this);
  WeatherForFiveDaysListWindModel mapEntityToModel() {
    return WeatherForFiveDaysListWindModel(speed ?? 0, deg ?? 0, gust ?? 0);
  }
}

@JsonSerializable()
class WeatherForFiveDaysListRainEntity {
  @JsonKey(name: '1h')
  double? oneHour;

  WeatherForFiveDaysListRainEntity(this.oneHour);

  factory WeatherForFiveDaysListRainEntity.fromJson(
    Map<String, dynamic> json,
  ) => _$WeatherForFiveDaysListRainEntityFromJson(json);

  Map<String, dynamic> toJson() =>
      _$WeatherForFiveDaysListRainEntityToJson(this);

  WeatherForFiveDaysListRainModel mapEntityToModel() {
    return WeatherForFiveDaysListRainModel(oneHour ?? 0);
  }
}

@JsonSerializable()
class WeatherForFiveDaysListSysEntity {
  String? pod;

  WeatherForFiveDaysListSysEntity(this.pod);

  factory WeatherForFiveDaysListSysEntity.fromJson(Map<String, dynamic> json) =>
      _$WeatherForFiveDaysListSysEntityFromJson(json);

  Map<String, dynamic> toJson() =>
      _$WeatherForFiveDaysListSysEntityToJson(this);

  WeatherForFiveDaysListSysModel mapEntityToModel() {
    return WeatherForFiveDaysListSysModel(pod ?? "");
  }
}

@JsonSerializable()
class WeatherForFiveDaysCityEntity {
  int? id;
  String? name;
  WeatherForFiveDaysCityCoordEntity? coord;
  String? country;
  int? population;
  int? timezone;
  int? sunrise;
  int? sunset;

  WeatherForFiveDaysCityEntity(
    this.id,
    this.name,
    this.coord,
    this.country,
    this.population,
    this.timezone,
    this.sunrise,
    this.sunset,
  );

  factory WeatherForFiveDaysCityEntity.fromJson(Map<String, dynamic> json) =>
      _$WeatherForFiveDaysCityEntityFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherForFiveDaysCityEntityToJson(this);

  WeatherForFiveDaysCityModel mapEntityToModel() {
    return WeatherForFiveDaysCityModel(
      id ?? 0,
      name ?? "",
      coord?.mapEntityToModel(),
      country ?? "",
      population ?? 0,
      timezone ?? 0,
      sunrise ?? 0,
      sunset ?? 0,
    );
  }
}

@JsonSerializable()
class WeatherForFiveDaysCityCoordEntity {
  double? lat;
  double? lon;

  WeatherForFiveDaysCityCoordEntity(this.lat, this.lon);

  factory WeatherForFiveDaysCityCoordEntity.fromJson(
    Map<String, dynamic> json,
  ) => _$WeatherForFiveDaysCityCoordEntityFromJson(json);

  Map<String, dynamic> toJson() =>
      _$WeatherForFiveDaysCityCoordEntityToJson(this);

  WeatherForFiveDaysCityCoordModel mapEntityToModel() {
    return WeatherForFiveDaysCityCoordModel(lat ?? 0, lon ?? 0);
  }
}
