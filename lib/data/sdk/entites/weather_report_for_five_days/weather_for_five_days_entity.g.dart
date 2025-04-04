// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_for_five_days_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherForFiveDaysEntity _$WeatherForFiveDaysEntityFromJson(
  Map<String, dynamic> json,
) => WeatherForFiveDaysEntity(
  json['cod'] as String?,
  (json['message'] as num?)?.toInt(),
  (json['cnt'] as num?)?.toInt(),
  (json['list'] as List<dynamic>?)
      ?.map(
        (e) => WeatherForFiveDaysListEntity.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  json['city'] == null
      ? null
      : WeatherForFiveDaysCityEntity.fromJson(
        json['city'] as Map<String, dynamic>,
      ),
);

Map<String, dynamic> _$WeatherForFiveDaysEntityToJson(
  WeatherForFiveDaysEntity instance,
) => <String, dynamic>{
  'cod': instance.cod,
  'message': instance.message,
  'cnt': instance.cnt,
  'list': instance.list,
  'city': instance.city,
};

WeatherForFiveDaysListEntity _$WeatherForFiveDaysListEntityFromJson(
  Map<String, dynamic> json,
) => WeatherForFiveDaysListEntity(
  (json['dt'] as num?)?.toInt(),
  json['main'] == null
      ? null
      : WeatherForFiveDaysListMainEntity.fromJson(
        json['main'] as Map<String, dynamic>,
      ),
  (json['weather'] as List<dynamic>?)
      ?.map(
        (e) => WeatherForFiveDaysListWeatherEntity.fromJson(
          e as Map<String, dynamic>,
        ),
      )
      .toList(),
  json['clouds'] == null
      ? null
      : WeatherForFiveDaysListCloudsEntity.fromJson(
        json['clouds'] as Map<String, dynamic>,
      ),
  json['wind'] == null
      ? null
      : WeatherForFiveDaysListWindEntity.fromJson(
        json['wind'] as Map<String, dynamic>,
      ),
  (json['visibility'] as num?)?.toInt(),
  (json['pop'] as num?)?.toDouble(),
  json['rain'] == null
      ? null
      : WeatherForFiveDaysListRainEntity.fromJson(
        json['rain'] as Map<String, dynamic>,
      ),
  json['sys'] == null
      ? null
      : WeatherForFiveDaysListSysEntity.fromJson(
        json['sys'] as Map<String, dynamic>,
      ),
  json['dt_txt'] as String?,
);

Map<String, dynamic> _$WeatherForFiveDaysListEntityToJson(
  WeatherForFiveDaysListEntity instance,
) => <String, dynamic>{
  'dt': instance.dt,
  'main': instance.main,
  'weather': instance.weather,
  'clouds': instance.clouds,
  'wind': instance.wind,
  'visibility': instance.visibility,
  'pop': instance.pop,
  'rain': instance.rain,
  'sys': instance.sys,
  'dt_txt': instance.dtTxt,
};

WeatherForFiveDaysListMainEntity _$WeatherForFiveDaysListMainEntityFromJson(
  Map<String, dynamic> json,
) => WeatherForFiveDaysListMainEntity(
  (json['temp'] as num?)?.toDouble(),
  (json['feels_like'] as num?)?.toDouble(),
  (json['temp_min'] as num?)?.toDouble(),
  (json['temp_max'] as num?)?.toDouble(),
  (json['pressure'] as num?)?.toInt(),
  (json['sea_level'] as num?)?.toInt(),
  (json['grnd_level'] as num?)?.toInt(),
  (json['humidity'] as num?)?.toInt(),
  (json['temp_kf'] as num?)?.toDouble(),
);

Map<String, dynamic> _$WeatherForFiveDaysListMainEntityToJson(
  WeatherForFiveDaysListMainEntity instance,
) => <String, dynamic>{
  'temp': instance.temp,
  'feels_like': instance.feelsLike,
  'temp_min': instance.tempMin,
  'temp_max': instance.tempMax,
  'pressure': instance.pressure,
  'sea_level': instance.seaLevel,
  'grnd_level': instance.grndLevel,
  'humidity': instance.humidity,
  'temp_kf': instance.tempKf,
};

WeatherForFiveDaysListWeatherEntity
_$WeatherForFiveDaysListWeatherEntityFromJson(Map<String, dynamic> json) =>
    WeatherForFiveDaysListWeatherEntity(
      (json['id'] as num?)?.toInt(),
      json['main'] as String?,
      json['description'] as String?,
      json['icon'] as String?,
    );

Map<String, dynamic> _$WeatherForFiveDaysListWeatherEntityToJson(
  WeatherForFiveDaysListWeatherEntity instance,
) => <String, dynamic>{
  'id': instance.id,
  'main': instance.main,
  'description': instance.description,
  'icon': instance.icon,
};

WeatherForFiveDaysListCloudsEntity _$WeatherForFiveDaysListCloudsEntityFromJson(
  Map<String, dynamic> json,
) => WeatherForFiveDaysListCloudsEntity((json['all'] as num?)?.toInt());

Map<String, dynamic> _$WeatherForFiveDaysListCloudsEntityToJson(
  WeatherForFiveDaysListCloudsEntity instance,
) => <String, dynamic>{'all': instance.all};

WeatherForFiveDaysListWindEntity _$WeatherForFiveDaysListWindEntityFromJson(
  Map<String, dynamic> json,
) => WeatherForFiveDaysListWindEntity(
  (json['speed'] as num?)?.toDouble(),
  (json['deg'] as num?)?.toInt(),
  (json['gust'] as num?)?.toDouble(),
);

Map<String, dynamic> _$WeatherForFiveDaysListWindEntityToJson(
  WeatherForFiveDaysListWindEntity instance,
) => <String, dynamic>{
  'speed': instance.speed,
  'deg': instance.deg,
  'gust': instance.gust,
};

WeatherForFiveDaysListRainEntity _$WeatherForFiveDaysListRainEntityFromJson(
  Map<String, dynamic> json,
) => WeatherForFiveDaysListRainEntity((json['1h'] as num?)?.toDouble());

Map<String, dynamic> _$WeatherForFiveDaysListRainEntityToJson(
  WeatherForFiveDaysListRainEntity instance,
) => <String, dynamic>{'1h': instance.oneHour};

WeatherForFiveDaysListSysEntity _$WeatherForFiveDaysListSysEntityFromJson(
  Map<String, dynamic> json,
) => WeatherForFiveDaysListSysEntity(json['pod'] as String?);

Map<String, dynamic> _$WeatherForFiveDaysListSysEntityToJson(
  WeatherForFiveDaysListSysEntity instance,
) => <String, dynamic>{'pod': instance.pod};

WeatherForFiveDaysCityEntity _$WeatherForFiveDaysCityEntityFromJson(
  Map<String, dynamic> json,
) => WeatherForFiveDaysCityEntity(
  (json['id'] as num?)?.toInt(),
  json['name'] as String?,
  json['coord'] == null
      ? null
      : WeatherForFiveDaysCityCoordEntity.fromJson(
        json['coord'] as Map<String, dynamic>,
      ),
  json['country'] as String?,
  (json['population'] as num?)?.toInt(),
  (json['timezone'] as num?)?.toInt(),
  (json['sunrise'] as num?)?.toInt(),
  (json['sunset'] as num?)?.toInt(),
);

Map<String, dynamic> _$WeatherForFiveDaysCityEntityToJson(
  WeatherForFiveDaysCityEntity instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'coord': instance.coord,
  'country': instance.country,
  'population': instance.population,
  'timezone': instance.timezone,
  'sunrise': instance.sunrise,
  'sunset': instance.sunset,
};

WeatherForFiveDaysCityCoordEntity _$WeatherForFiveDaysCityCoordEntityFromJson(
  Map<String, dynamic> json,
) => WeatherForFiveDaysCityCoordEntity(
  (json['lat'] as num?)?.toDouble(),
  (json['lon'] as num?)?.toDouble(),
);

Map<String, dynamic> _$WeatherForFiveDaysCityCoordEntityToJson(
  WeatherForFiveDaysCityCoordEntity instance,
) => <String, dynamic>{'lat': instance.lat, 'lon': instance.lon};
