import 'package:flutter/material.dart';
import 'package:mausam/core/model/forecast.dart';
import 'package:mausam/ui/utils/constants.dart';
import 'package:mausam/ui/utils/convert_date.dart';
import 'package:mausam/ui/utils/convert_icon.dart';

class HomeTopWidget extends StatelessWidget {
  const HomeTopWidget({
    super.key,
    required this.forecastList,
    required this.index,
    required this.day,
    required this.city,
  });

  final List<ForecastListElement> forecastList;
  final City city;
  final int index;
  final String day;

  @override
  Widget build(BuildContext context) {
    final date =
        DateTime.fromMillisecondsSinceEpoch(forecastList[index].dt * 1000);
    final formattedDate = getFormatedDate(date);
    final temparature = forecastList[index].main.temp?.toStringAsFixed(0);
    final country = city.country;
    final feelsLike = forecastList[index].main.feelsLike?.toStringAsFixed(0);
    DateTime sunset = DateTime.fromMillisecondsSinceEpoch(city.sunset * 1000);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 10.0, bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              getWeatherIcon(
                color: kIconColor,
                size: 25,
                weatherDescription: forecastList[index].weather[0].main,
              ),
              const SizedBox(width: 20.0),
              Column(
                children: <Widget>[
                  Text(day, style: kTitleTextStyle),
                  const SizedBox(height: 2),
                  Text(
                    formattedDate,
                    style: kSubtitleStyle,
                  ),
                ],
              )
            ],
          ),
        ),
        Row(
          textBaseline: TextBaseline.ideographic,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '$temparature',
              style: const TextStyle(
                fontSize: 125.0,
                fontWeight: FontWeight.w300,
                color: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 5.0),
              child: Text(
                '°C',
                style: kSubtitleStyle.copyWith(
                  fontSize: 20.0,
                ),
              ),
            )
          ],
        ),
        const SizedBox(height: 10.0),
        Padding(
          padding: const EdgeInsets.only(top: 10.0, bottom: 20.0),
          child: Text(
            '${city.name}, $country',
            style: kSubtitleStyle,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Feels Like $feelsLike',
                style: kSubtitleStyle,
              ),
              const Padding(
                padding: EdgeInsets.only(right: 5.0, left: 5.0),
                child: Text(
                  '.',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
              ),
              Text(
                'Sunset ${sunset.hour}:${sunset.minute}',
                style: kSubtitleStyle,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
