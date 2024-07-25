import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget getWeatherIcon({
  String? weatherDescription,
  Color? color,
  double? size,
}) {
  switch (weatherDescription) {
    case 'Clear':
      {
        return Icon(Icons.wb_sunny, color: Colors.yellow, size: size);
      }
    case 'Clouds':
      {
        return Icon(FontAwesomeIcons.cloud,
            color: Colors.lightBlue[300], size: size);
      }
    case 'Rain':
      {
        return Icon(FontAwesomeIcons.cloudRain,
            color: Colors.purpleAccent, size: size);
      }
    case 'Snow':
      {
        return Icon(FontAwesomeIcons.snowman, color: color, size: size);
      }
    default:
      {
        return Icon(Icons.wb_sunny, color: Colors.yellow, size: size);
      }
  }
}
