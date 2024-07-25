import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:mausam/core/provider/position_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:mausam/core/model/forecast.dart';

part 'forecast_provider.g.dart';

@riverpod
Future<Forecast?> forecast(ForecastRef ref) async {
  final position = ref.watch(positionProvider).value;
  final apiKey = dotenv.env['WEATHER_API'];

  if (apiKey == null) {
    throw Exception("API key not found");
  }

  if (position == null) {
    return null;
  }

  final Map<String, String> queryParameters = <String, String>{
    'lat': position.latitude.toString(),
    'lon': position.longitude.toString(),
    'units': 'metric',
    'appid': apiKey,
  };

  // Using package:http, we fetch a random activity from the Bored API.
  final response = await http.get(
      Uri.https('api.openweathermap.org', '/data/2.5/forecast')
          .replace(queryParameters: queryParameters));
  // Using dart:convert, we then decode the JSON payload into a Map data structure.
  final json = jsonDecode(response.body) as Map<String, dynamic>;
// Finally, we convert the Map into an Activity instance.
  return Forecast.fromJson(json);
}
