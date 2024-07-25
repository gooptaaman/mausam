import 'package:flutter/material.dart';
import 'package:mausam/core/model/forecast.dart';
import 'package:mausam/ui/utils/constants.dart';
import 'package:mausam/ui/utils/convert_date.dart';
import 'package:mausam/ui/utils/convert_icon.dart';

class ForecastCard extends StatelessWidget {
  const ForecastCard({
    super.key,
    required this.forecast,
  });

  final ForecastListElement forecast;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: kBackgroundColor,
      elevation: 0,
      margin: const EdgeInsets.all(5),
      child: Container(
        height: 100,
        width: 75,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(80),
          color: const Color(0xFF1E1E45),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              formatTime(
                  DateTime.fromMillisecondsSinceEpoch(forecast.dt * 1000)),
              style: kSubtitleStyle,
            ),
            CircleAvatar(
              backgroundColor: kBackgroundColor,
              child: getWeatherIcon(
                  color: kIconColor,
                  size: 20,
                  weatherDescription: forecast.weather[0].main),
            ),
            Text(
              '${forecast.main.temp}°C',
              style: kSubtitleStyle,
            )
          ],
        ),
      ),
    );
  }
}
