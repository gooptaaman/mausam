import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mausam/core/model/forecast.dart';

import 'package:mausam/core/provider/forecast_provider.dart';
import 'package:mausam/ui/screens/five_days_screen.dart';
import 'package:mausam/ui/utils/constants.dart';
import 'package:mausam/ui/widgets/home/bottom_list.dart';
import 'package:mausam/ui/widgets/home/top_info.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  int routeIndex = 0;
  int selectedIndex = 0;
  String day = "Today";

  void pop() {
    setState(() {
      routeIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final AsyncValue<Forecast?> forecast = ref.watch(forecastProvider);

    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kBackgroundColor,
        title: const Text(
          "Mausam",
          style: TextStyle(
            fontWeight: FontWeight.w400,
            letterSpacing: 0.5,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: forecast.when(
        error: (error, stackTrace) {
          return Center(
            child: Text(
              error.toString(),
              style: const TextStyle(color: Colors.white),
            ),
          );
        },
        loading: () {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
        data: (data) {
          if (data == null) {
            return const Center(
              child: Text(
                "No data found",
                style: TextStyle(color: Colors.white),
              ),
            );
          }

          return IndexedStack(
            index: routeIndex,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  HomeTopWidget(
                    forecastList: data.list,
                    index: selectedIndex,
                    day: day,
                    city: data.city,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: ButtonBar(
                      alignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        TextButton(
                            onPressed: () {
                              setState(() {
                                day = 'Today';
                                selectedIndex = 0;
                              });
                            },
                            child: const Text('Today')),
                        TextButton(
                            onPressed: () {
                              setState(() {
                                day = 'Tomorrow';
                                selectedIndex = 8;
                              });
                            },
                            child: const Text('Tomorrow')),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              routeIndex = 1;
                            });
                          },
                          child: const Text('Next 5 days >'),
                        )
                      ],
                    ),
                  ),
                  BottomCardsList(forecast: data),
                ],
              ),
              FiveDaysScreen(
                forecast: data,
                pop: pop,
              ),
            ],
          );
        },
      ),
    );
  }
}
