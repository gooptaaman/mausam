import 'package:flutter/material.dart';
import 'package:mausam/core/model/forecast.dart';
import 'package:mausam/ui/utils/constants.dart';
import 'package:mausam/ui/widgets/home/forecast_card.dart';

class BottomCardsList extends StatelessWidget {
  const BottomCardsList({super.key, required this.forecast});

  final Forecast forecast;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          height: 190,
          margin: const EdgeInsets.only(
            top: 5,
            bottom: 10,
          ),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => const SizedBox(width: 1),
            itemCount: 8,
            itemBuilder: (context, index) => ForecastCard(
              forecast: forecast.list[index],
            ),
          ),
        ),
      ],
    );
  }
}
