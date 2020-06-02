import 'package:flutter/material.dart';
import 'package:mausam/model/weather_forecast_model.dart';
import 'package:mausam/services/convert_date.dart';
import 'package:mausam/services/convert_icon.dart';

import '../constants.dart';

Widget forecastCard(AsyncSnapshot<WeatherForecastModel> snapshot, index) {
  var temparature = snapshot.data.list[index].main.temp.toStringAsFixed(0);
  Icon icon = getWeatherIcon(
    color: kIconColor,
    size: 20,
    weatherDescription: snapshot.data.list[index].weather[0].main,
  );
  DateTime time =
      DateTime.fromMillisecondsSinceEpoch(snapshot.data.list[index].dt * 1000);
  var formattedTime = Util.formatTime(time);
  return Card(
    color: kBackgroundColor,
    elevation: 0,
    margin: EdgeInsets.all(5),
    child: Container(
      height: 100,
      width: 75,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(80),
        color: Color(0xFF1E1E45),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            '$formattedTime',
            style: kSubtitleStyle,
          ),
          CircleAvatar(
            backgroundColor: kBackgroundColor,
            child: icon,
          ),
          Text(
            '$temparature°C',
            style: kSubtitleStyle,
          )
        ],
      ),
    ),
  );
}
