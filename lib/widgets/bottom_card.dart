import 'package:flutter/material.dart';
import 'package:mausam/constants.dart';
import 'package:mausam/model/weather_forecast_model.dart';
import 'package:mausam/widgets/forecast.dart';

class BottomCardsList extends StatelessWidget {
  final AsyncSnapshot<WeatherForecastModel> snapshot;
  final int start;

  const BottomCardsList({Key key, this.snapshot, this.start}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Text(
            'Forecast :',
            style: kTitleTextStyle,
          ),
        ),
        Container(
          height: 190,
          margin: EdgeInsets.only(
            top: 5,
            bottom: 10,
          ),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => SizedBox(width: 1),
            itemCount: 8,
            itemBuilder: (context, start) => forecastCard(snapshot, start),
          ),
        ),
      ],
    );
  }
}
