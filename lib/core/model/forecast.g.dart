// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Forecast _$ForecastFromJson(Map<String, dynamic> json) => Forecast(
      json['cod'] as String,
      (json['message'] as num).toInt(),
      (json['list'] as List<dynamic>)
          .map((e) => ForecastListElement.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['cnt'] as num).toInt(),
      City.fromJson(json['city'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ForecastToJson(Forecast instance) => <String, dynamic>{
      'cod': instance.cod,
      'message': instance.message,
      'cnt': instance.cnt,
      'list': instance.list,
      'city': instance.city,
    };

City _$CityFromJson(Map<String, dynamic> json) => City(
      (json['id'] as num).toInt(),
      json['name'] as String,
      Coord.fromJson(json['coord'] as Map<String, dynamic>),
      json['country'] as String,
      (json['population'] as num).toInt(),
      (json['timezone'] as num).toInt(),
      (json['sunrise'] as num).toInt(),
      (json['sunset'] as num).toInt(),
    );

Map<String, dynamic> _$CityToJson(City instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'coord': instance.coord,
      'country': instance.country,
      'population': instance.population,
      'timezone': instance.timezone,
      'sunrise': instance.sunrise,
      'sunset': instance.sunset,
    };

Coord _$CoordFromJson(Map<String, dynamic> json) => Coord(
      (json['lat'] as num).toDouble(),
      (json['lon'] as num).toDouble(),
    );

Map<String, dynamic> _$CoordToJson(Coord instance) => <String, dynamic>{
      'lat': instance.lat,
      'lon': instance.lon,
    };

ForecastListElement _$ForecastListElementFromJson(Map<String, dynamic> json) =>
    ForecastListElement(
      (json['dt'] as num).toInt(),
      MainClass.fromJson(json['main'] as Map<String, dynamic>),
      (json['weather'] as List<dynamic>)
          .map((e) => Weather.fromJson(e as Map<String, dynamic>))
          .toList(),
      Wind.fromJson(json['wind'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ForecastListElementToJson(
        ForecastListElement instance) =>
    <String, dynamic>{
      'dt': instance.dt,
      'main': instance.main,
      'weather': instance.weather,
      'wind': instance.wind,
    };

MainClass _$MainClassFromJson(Map<String, dynamic> json) => MainClass(
      (json['temp'] as num?)?.toDouble(),
      (json['feels_like'] as num?)?.toDouble(),
      (json['temp_min'] as num?)?.toDouble(),
      (json['temp_max'] as num?)?.toDouble(),
      (json['humidity'] as num?)?.toInt(),
    );

Map<String, dynamic> _$MainClassToJson(MainClass instance) => <String, dynamic>{
      'temp': instance.temp,
      'feels_like': instance.feelsLike,
      'temp_min': instance.tempMin,
      'temp_max': instance.tempMax,
      'humidity': instance.humidity,
    };

Wind _$WindFromJson(Map<String, dynamic> json) => Wind(
      (json['speed'] as num?)?.toDouble(),
      (json['deg'] as num?)?.toInt(),
      (json['gust'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$WindToJson(Wind instance) => <String, dynamic>{
      'speed': instance.speed,
      'deg': instance.deg,
      'gust': instance.gust,
    };

Rain _$RainFromJson(Map<String, dynamic> json) => Rain(
      the3H: (json['the3H'] as num).toDouble(),
    );

Map<String, dynamic> _$RainToJson(Rain instance) => <String, dynamic>{
      'the3H': instance.the3H,
    };

Weather _$WeatherFromJson(Map<String, dynamic> json) => Weather(
      (json['id'] as num).toInt(),
      json['main'] as String,
      json['description'] as String,
      json['icon'] as String,
    );

Map<String, dynamic> _$WeatherToJson(Weather instance) => <String, dynamic>{
      'id': instance.id,
      'main': instance.main,
      'description': instance.description,
      'icon': instance.icon,
    };
