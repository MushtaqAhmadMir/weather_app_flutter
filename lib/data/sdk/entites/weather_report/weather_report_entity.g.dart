// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_report_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherReportEntity _$WeatherReportEntityFromJson(
  Map<String, dynamic> json,
) => WeatherReportEntity(
  json['coord'] == null
      ? null
      : WeatherReportCoordEntity.fromJson(
        json['coord'] as Map<String, dynamic>,
      ),
  (json['weather'] as List<dynamic>?)
      ?.map(
        (e) => WeatherReportWeatherEntity.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  json['base'] as String?,
  json['main'] == null
      ? null
      : WeatherReportMainEntity.fromJson(json['main'] as Map<String, dynamic>),
  (json['visibility'] as num?)?.toInt(),
  json['wind'] == null
      ? null
      : WeatherReportWindEntity.fromJson(json['wind'] as Map<String, dynamic>),
  json['rain'] == null
      ? null
      : WeatherReportRainEntity.fromJson(json['rain'] as Map<String, dynamic>),
  json['clouds'] == null
      ? null
      : WeatherReportCloudsEntity.fromJson(
        json['clouds'] as Map<String, dynamic>,
      ),
  (json['dt'] as num?)?.toInt(),
  json['sys'] == null
      ? null
      : WeatherReportSysEntity.fromJson(json['sys'] as Map<String, dynamic>),
  (json['timezone'] as num?)?.toInt(),
  (json['id'] as num?)?.toInt(),
  json['name'] as String?,
  (json['cod'] as num?)?.toInt(),
);

Map<String, dynamic> _$WeatherReportEntityToJson(
  WeatherReportEntity instance,
) => <String, dynamic>{
  'coord': instance.coord,
  'weather': instance.weather,
  'base': instance.base,
  'main': instance.main,
  'visibility': instance.visibility,
  'wind': instance.wind,
  'rain': instance.rain,
  'clouds': instance.clouds,
  'dt': instance.dt,
  'sys': instance.sys,
  'timezone': instance.timezone,
  'id': instance.id,
  'name': instance.name,
  'cod': instance.cod,
};

WeatherReportCoordEntity _$WeatherReportCoordEntityFromJson(
  Map<String, dynamic> json,
) => WeatherReportCoordEntity(
  (json['lon'] as num?)?.toDouble(),
  (json['lat'] as num?)?.toDouble(),
);

Map<String, dynamic> _$WeatherReportCoordEntityToJson(
  WeatherReportCoordEntity instance,
) => <String, dynamic>{'lon': instance.lon, 'lat': instance.lat};

WeatherReportWeatherEntity _$WeatherReportWeatherEntityFromJson(
  Map<String, dynamic> json,
) => WeatherReportWeatherEntity(
  (json['id'] as num?)?.toInt(),
  json['main'] as String,
  json['description'] as String,
  json['icon'] as String,
);

Map<String, dynamic> _$WeatherReportWeatherEntityToJson(
  WeatherReportWeatherEntity instance,
) => <String, dynamic>{
  'id': instance.id,
  'main': instance.main,
  'description': instance.description,
  'icon': instance.icon,
};

WeatherReportMainEntity _$WeatherReportMainEntityFromJson(
  Map<String, dynamic> json,
) => WeatherReportMainEntity(
  (json['temp'] as num?)?.toDouble(),
  (json['feels_like'] as num?)?.toDouble(),
  (json['temp_min'] as num?)?.toDouble(),
  (json['temp_max'] as num?)?.toDouble(),
  (json['pressure'] as num?)?.toInt(),
  (json['humidity'] as num?)?.toInt(),
  (json['sea_level'] as num?)?.toInt(),
  (json['grnd_level'] as num?)?.toInt(),
);

Map<String, dynamic> _$WeatherReportMainEntityToJson(
  WeatherReportMainEntity instance,
) => <String, dynamic>{
  'temp': instance.temp,
  'feels_like': instance.feelsLike,
  'temp_min': instance.tempMin,
  'temp_max': instance.tempMax,
  'pressure': instance.pressure,
  'humidity': instance.humidity,
  'sea_level': instance.seaLevel,
  'grnd_level': instance.grndLevel,
};

WeatherReportWindEntity _$WeatherReportWindEntityFromJson(
  Map<String, dynamic> json,
) => WeatherReportWindEntity(
  (json['speed'] as num?)?.toDouble(),
  (json['deg'] as num?)?.toInt(),
  (json['gust'] as num?)?.toDouble(),
);

Map<String, dynamic> _$WeatherReportWindEntityToJson(
  WeatherReportWindEntity instance,
) => <String, dynamic>{
  'speed': instance.speed,
  'deg': instance.deg,
  'gust': instance.gust,
};

WeatherReportRainEntity _$WeatherReportRainEntityFromJson(
  Map<String, dynamic> json,
) => WeatherReportRainEntity((json['1h'] as num?)?.toDouble());

Map<String, dynamic> _$WeatherReportRainEntityToJson(
  WeatherReportRainEntity instance,
) => <String, dynamic>{'1h': instance.$1h};

WeatherReportCloudsEntity _$WeatherReportCloudsEntityFromJson(
  Map<String, dynamic> json,
) => WeatherReportCloudsEntity((json['all'] as num?)?.toInt());

Map<String, dynamic> _$WeatherReportCloudsEntityToJson(
  WeatherReportCloudsEntity instance,
) => <String, dynamic>{'all': instance.all};

WeatherReportSysEntity _$WeatherReportSysEntityFromJson(
  Map<String, dynamic> json,
) => WeatherReportSysEntity(
  (json['type'] as num?)?.toInt(),
  (json['id'] as num?)?.toInt(),
  json['country'] as String,
  (json['sunrise'] as num?)?.toInt(),
  (json['sunset'] as num?)?.toInt(),
);

Map<String, dynamic> _$WeatherReportSysEntityToJson(
  WeatherReportSysEntity instance,
) => <String, dynamic>{
  'type': instance.type,
  'id': instance.id,
  'country': instance.country,
  'sunrise': instance.sunrise,
  'sunset': instance.sunset,
};
