import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mausam/core/model/forecast.dart';
import 'package:mausam/ui/utils/constants.dart';
import 'package:mausam/ui/widgets/week/today_forecast_card.dart';
import 'package:mausam/ui/widgets/week/forecast_cards.dart';

List<Widget> cards = [];

class FiveDaysScreen extends ConsumerWidget {
  const FiveDaysScreen({super.key, required this.forecast, required this.pop});
  final Forecast forecast;
  final void Function() pop;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: const EdgeInsets.only(left: 12.0, right: 12.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      IconButton(
                        onPressed: () {
                          pop();
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
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
                  TodayForecastCard(
                    forecast: forecast.list[0],
                    city: forecast.city,
                  ),
                ],
              )),
          Expanded(
            flex: 2,
            child: ListView.builder(itemBuilder: (context, index) {
              if (index < 40) {
                return DaysForecastCard(
                  forecast: forecast.list[index],
                );
              }
            }),
          )
        ],
      ),
    );
  }
}
