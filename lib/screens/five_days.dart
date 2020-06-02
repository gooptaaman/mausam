import 'package:flutter/material.dart';
import 'package:mausam/constants.dart';
import 'package:mausam/model/weather_forecast_model.dart';
import 'package:mausam/widgets/widgets.dart';

List<Widget> cards = [];
CustomWidgets customWidgets = CustomWidgets();

class FiveDaysPage extends StatelessWidget {
  final AsyncSnapshot<WeatherForecastModel> snapshot;

  const FiveDaysPage({Key key, this.snapshot}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        elevation: 10.0,
        backgroundColor: kBackgroundColor,
        title: Text('Mausam'),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.only(left: 12.0, right: 12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Next',
                  style: kTitleTextStyle.copyWith(
                    fontWeight: FontWeight.w100,
                    fontSize: 25,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    '5 days',
                    style: kTitleTextStyle.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                )
              ],
            ),
            customWidgets.getCardWidget(snapshot),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: CustomWidgets.getForecastCards(snapshot),
            ),
          ],
        ),
      ),
    );
  }
}
