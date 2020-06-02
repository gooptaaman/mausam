import 'package:flutter/material.dart';
import 'package:mausam/constants.dart';
import 'package:mausam/model/weather_forecast_model.dart';
import 'package:mausam/services/convert_date.dart';
import 'package:mausam/services/convert_icon.dart';

class CustomWidgets {
  Widget getTopWidget(AsyncSnapshot<WeatherForecastModel> snapshot, context,
      String day, int index) {
    var forecastList = snapshot.data.list;
    var date =
        DateTime.fromMillisecondsSinceEpoch(forecastList[index].dt * 1000);
    var formattedDate = Util.getFormatedDate(date);
    var temparature = forecastList[index].main.temp.toStringAsFixed(0);
    var city = snapshot.data.city.name;
    var country = snapshot.data.city.country;
    var feelsLike = forecastList[index].main.feelsLike.toStringAsFixed(0);
    DateTime sunset =
        DateTime.fromMillisecondsSinceEpoch(snapshot.data.city.sunset * 1000);
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
                  weatherDescription: forecastList[index].weather[0].main),
              SizedBox(width: 20.0),
              Column(
                children: <Widget>[
                  Text('$day', style: kTitleTextStyle),
                  SizedBox(height: 2),
                  Text(
                    '$formattedDate',
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
              style: TextStyle(
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
        SizedBox(height: 10.0),
        Padding(
          padding: const EdgeInsets.only(top: 10.0, bottom: 20.0),
          child: Text(
            '$city, $country',
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
              Padding(
                padding: const EdgeInsets.only(right: 5.0, left: 5.0),
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

  //Five Days Page Top Weather Card

  Widget getCardWidget(AsyncSnapshot<WeatherForecastModel> snapshot) {
    var weatherIcon = getWeatherIcon(
      weatherDescription: snapshot.data.list[0].weather[0].main,
      color: kIconColor,
      size: 20,
    );
    var maxTemp = snapshot.data.list[0].main.tempMax.toStringAsFixed(0);
    var minTemp = snapshot.data.list[0].main.tempMin.toStringAsFixed(0);
    var windSpeed = snapshot.data.list[0].wind.speed;
    var humidity = snapshot.data.list[0].main.humidity;
    DateTime day =
        DateTime.fromMillisecondsSinceEpoch(snapshot.data.list[0].dt * 1000);

    var formattedDay = Util.getDay(day);
    DateTime sunrise =
        DateTime.fromMillisecondsSinceEpoch(snapshot.data.city.sunrise * 1000);
    DateTime sunset =
        DateTime.fromMillisecondsSinceEpoch(snapshot.data.city.sunset * 1000);

    return Card(
      color: Colors.transparent,
      margin: EdgeInsets.all(8.0),
      elevation: 20,
      child: Container(
        padding: EdgeInsets.all(12),
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
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(
                  '$formattedDay',
                  style: kTitleTextStyle.copyWith(
                    color: kBackgroundColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                weatherIcon,
                SizedBox(width: 20),
                Text(
                  '$maxTemp°C',
                  style: kTitleTextStyle.copyWith(color: kBackgroundColor),
                ),
                Text(
                  '$minTemp°C',
                  style: kSubtitleStyle.copyWith(fontSize: 15),
                ),
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
                  '$windSpeed km/h',
                  style: kSubtitleStyle.copyWith(fontSize: 15),
                ),
                SizedBox(width: 20),
                Text(
                  'Humidity',
                  style: kTitleTextStyle.copyWith(
                    color: kBackgroundColor,
                    fontSize: 18,
                  ),
                ),
                Text(
                  '$humidity%',
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
                SizedBox(width: 20),
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

  static List<Widget> getForecastCards(
      AsyncSnapshot<WeatherForecastModel> snapshot) {
    List<Widget> cards = [];
    for (var i = 0; i < 40; i = i + 8) {
      var forecast = snapshot.data.list[i];
      var humidity = forecast.main.humidity;
      var weatherIcon = getWeatherIcon(
          weatherDescription: forecast.weather[0].main,
          color: kIconColor,
          size: 20);
      var minTemp = forecast.main.tempMin.toStringAsFixed(0);
      var maxTemp = forecast.main.tempMax.toStringAsFixed(0);
      DateTime date = DateTime.fromMillisecondsSinceEpoch(forecast.dt * 1000);
      var formattedDay = Util.getDay(date);

      cards.add(
        Card(
          margin: EdgeInsets.all(12),
          color: Colors.transparent,
          elevation: 0,
          child: Container(
            height: 30,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text('$formattedDay', style: kSubtitleStyle),
                weatherIcon,
                Text(
                  '$humidity%',
                  style: kSubtitleStyle,
                ),
                Text(
                  '$minTemp°C',
                  style: kSubtitleStyle,
                ),
                Text(
                  '$maxTemp°C',
                  style: kTitleTextStyle,
                ),
              ],
            ),
          ),
        ),
      );
    }
    return cards;
  }
}
