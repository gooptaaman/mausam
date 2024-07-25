import 'package:flutter/material.dart';
import 'package:mausam/core/model/forecast.dart';
import 'package:mausam/ui/utils/constants.dart';
import 'package:mausam/ui/utils/convert_date.dart';
import 'package:mausam/ui/utils/convert_icon.dart';

class TodayForecastCard extends StatelessWidget {
  const TodayForecastCard({
    super.key,
    required this.forecast,
    required this.city,
  });

  final ForecastListElement forecast;
  final City city;

  @override
  Widget build(BuildContext context) {
    DateTime sunrise = DateTime.fromMillisecondsSinceEpoch(city.sunrise * 1000);
    DateTime sunset = DateTime.fromMillisecondsSinceEpoch(city.sunset * 1000);

    return Card(
      color: Colors.transparent,
      margin: const EdgeInsets.all(8.0),
      elevation: 20,
      child: Container(
        padding: const EdgeInsets.all(12),
        height: 200,
        decoration: BoxDecoration(
          color: kBackgroundLight,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text(
                    getDay(
                      DateTime.fromMillisecondsSinceEpoch(forecast.dt * 1000),
                    ),
                    style: kTitleTextStyle.copyWith(
                      color: kBackgroundColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 4),
                getWeatherIcon(
                  color: kIconColor,
                  size: 20,
                  weatherDescription: forecast.weather[0].main,
                ),
                // const SizedBox(width: 20),
                // Text(
                //   '${forecast.main.tempMax}°C',
                //   style: kTitleTextStyle.copyWith(color: kBackgroundColor),
                // ),
                // Text(
                //   '${forecast.main.tempMin}°C',
                //   style: kSubtitleStyle.copyWith(fontSize: 15),
                // ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(
                  'Wind',
                  style: kTitleTextStyle.copyWith(
                    color: kBackgroundColor,
                    fontSize: 18,
                  ),
                ),
                Text(
                  '${forecast.wind.speed} km/h',
                  style: kSubtitleStyle.copyWith(fontSize: 15),
                ),
                const SizedBox(width: 20),
                Text(
                  'Humidity',
                  style: kTitleTextStyle.copyWith(
                    color: kBackgroundColor,
                    fontSize: 18,
                  ),
                ),
                Text(
                  '${forecast.main.humidity}%',
                  style: kSubtitleStyle.copyWith(fontSize: 15),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(
                  'Sunrise',
                  style: kTitleTextStyle.copyWith(
                    color: kBackgroundColor,
                    fontSize: 18,
                  ),
                ),
                Text(
                  '${sunrise.hour}:${sunrise.minute}',
                  style: kSubtitleStyle.copyWith(fontSize: 15),
                ),
                const SizedBox(width: 20),
                Text(
                  'Sunset',
                  style: kTitleTextStyle.copyWith(
                    color: kBackgroundColor,
                    fontSize: 18,
                  ),
                ),
                Text(
                  '${sunset.hour}:${sunset.minute}',
                  style: kSubtitleStyle.copyWith(fontSize: 15),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
