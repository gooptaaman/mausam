import 'dart:convert';
import 'package:mausam/util.dart';

import 'package:http/http.dart' as http;
import 'package:mausam/model/weather_forecast_model.dart';

class Network {
  final String latitude;
  final String longitude;
  Network({this.latitude, this.longitude});

  String _apiKey = Util.apiKey;
  Future<WeatherForecastModel> getWeatherData() async {
    final String _url =
        'https://api.openweathermap.org/data/2.5/forecast?lat=$latitude&lon=$longitude&appid=$_apiKey&units=metric';
    http.Response response = await http.get(Uri.encodeFull(_url));
    if (response.statusCode == 200) {
      var data = response.body;
      var decodedData = jsonDecode(data);
      return WeatherForecastModel.fromJson(decodedData);
    } else {
      print(response.statusCode);
      throw Exception('Failed to get data.');
    }
  }
}
