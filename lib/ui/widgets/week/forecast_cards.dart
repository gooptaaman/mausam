import 'package:flutter/material.dart';
import 'package:mausam/core/model/forecast.dart';
import 'package:mausam/ui/utils/constants.dart';
import 'package:mausam/ui/utils/convert_date.dart';
import 'package:mausam/ui/utils/convert_icon.dart';

class DaysForecastCard extends StatelessWidget {
  const DaysForecastCard({super.key, required this.forecast});

  final ForecastListElement forecast;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(12),
      color: Colors.transparent,
      elevation: 0,
      child: SizedBox(
        height: 30,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(
              getDay(
                DateTime.fromMillisecondsSinceEpoch(forecast.dt * 1000),
              ),
              style: kSubtitleStyle,
            ),
            Text(
              formatTime(
                DateTime.fromMillisecondsSinceEpoch(forecast.dt * 1000),
              ),
              style: const TextStyle(color: kSubTextColor),
            ),
            getWeatherIcon(
              color: kIconColor,
              size: 20,
              weatherDescription: forecast.weather.first.main,
            ),
            Text(
              '${forecast.main.tempMin?.toStringAsFixed(0)}°C',
              style: kSubtitleStyle,
            ),
            Text(
              '${forecast.main.tempMax?.toStringAsFixed(0)}°C',
              style: kTitleTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}
