import 'package:json_annotation/json_annotation.dart';

part 'forecast.g.dart';

@JsonSerializable()
class Forecast {
  String cod;
  int message;
  int cnt;
  List<ForecastListElement> list;
  City city;

  Forecast(this.cod, this.message, this.list, this.cnt, this.city);

  factory Forecast.fromJson(Map<String, dynamic> json) =>
      _$ForecastFromJson(json);

  Map<String, dynamic> toJson() => _$ForecastToJson(this);
}

@JsonSerializable()
class City {
  int id;
  String name;
  Coord coord;
  String country;
  int population;
  int timezone;
  int sunrise;
  int sunset;

  City(this.id, this.name, this.coord, this.country, this.population,
      this.timezone, this.sunrise, this.sunset);

  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);
}

@JsonSerializable()
class Coord {
  double lat;
  double lon;

  Coord(this.lat, this.lon);

  factory Coord.fromJson(Map<String, dynamic> json) => _$CoordFromJson(json);
}

@JsonSerializable()
class ForecastListElement {
  int dt;
  MainClass main;
  List<Weather> weather;
  Wind wind;
  // int visibility;
  // double pop;
  // Rain? rain;
  // DateTime dtTxt;

  ForecastListElement(this.dt, this.main, this.weather, this.wind);

  factory ForecastListElement.fromJson(Map<String, dynamic> json) =>
      _$ForecastListElementFromJson(json);
}

@JsonSerializable()
class MainClass {
  double? temp;
  @JsonKey(name: "feels_like")
  double? feelsLike;
  @JsonKey(name: "temp_min")
  double? tempMin;
  @JsonKey(name: "temp_max")
  double? tempMax;
  int? humidity;

  MainClass(
    this.temp,
    this.feelsLike,
    this.tempMin,
    this.tempMax,
    this.humidity,
  );

  factory MainClass.fromJson(Map<String, dynamic> json) =>
      _$MainClassFromJson(json);
}

@JsonSerializable()
class Wind {
  double? speed;
  int? deg;
  double? gust;

  Wind(this.speed, this.deg, this.gust);

  factory Wind.fromJson(Map<String, dynamic> json) => _$WindFromJson(json);
}

@JsonSerializable()
class Rain {
  double the3H;

  Rain({
    required this.the3H,
  });

  factory Rain.fromJson(Map<String, dynamic> json) => _$RainFromJson(json);
}

@JsonSerializable()
class Weather {
  int id;
  String main;
  String description;
  String icon;

  Weather(this.id, this.main, this.description, this.icon);

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);
}

// enum MainEnum { CLOUDS, RAIN }


