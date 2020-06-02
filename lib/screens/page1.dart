import 'package:flutter/material.dart';
import 'package:mausam/model/weather_forecast_model.dart';
import 'package:mausam/screens/five_days.dart';
import 'package:mausam/services/location.dart';
import 'package:mausam/services/network.dart';
import 'package:mausam/widgets/bottom_card.dart';
import 'package:mausam/widgets/widgets.dart';

import '../constants.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

List<Widget> cardList = [];

class _MainPageState extends State<MainPage> {
  Future<WeatherForecastModel> forecastObject;
  CustomWidgets customWidgets = CustomWidgets();
  String day = 'Today';
  int index = 0;

  @override
  void initState() {
    super.initState();
    forecastObject = getLocationData(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kBackgroundColor,
        title: Text(
          'Mausam',
          style: TextStyle(
            fontWeight: FontWeight.w400,
            letterSpacing: 0.5,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          FutureBuilder<WeatherForecastModel>(
            future: forecastObject,
            builder: (BuildContext context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    customWidgets.getTopWidget(snapshot, context, day, index),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: ButtonBar(
                        alignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          FlatButton(
                              onPressed: () {
                                setState(() {
                                  day = 'Today';
                                  index = 0;
                                });
                              },
                              child: Text('Today')),
                          FlatButton(
                              onPressed: () {
                                setState(() {
                                  day = 'Tomorrow';
                                  index = 8;
                                });
                              },
                              child: Text('Tomorrow')),
                          FlatButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => FiveDaysPage(
                                            snapshot: snapshot,
                                          )));
                            },
                            child: Text('Next 5 days >'),
                          )
                        ],
                      ),
                    ),
                    BottomCardsList(
                      snapshot: snapshot,
                      start: index,
                    ),
                  ],
                );
              } else {
                return Center(child: LinearProgressIndicator());
              }
            },
          ),
        ],
      ),
    );
  }
}

Future<WeatherForecastModel> getLocationData(context) async {
  CurrentLocation location = CurrentLocation();
  await location.getCurrentLocation();
  if (location.latitude != null) {
    Network network =
        Network(latitude: location.latitude, longitude: location.longitude);
    return network.getWeatherData();
  }
}
