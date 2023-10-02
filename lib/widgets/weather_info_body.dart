import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/models/weathermodel/weathermodel.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({Key? key, required this.model}) : super(key: key);

  final Weathermodel model;
  @override
  Widget build(BuildContext context) {
    log(model.location!.name!);
    return Container(
      decoration:  BoxDecoration(
          gradient: LinearGradient(colors: [
        getThemeColor(model.forecast?.forecastday?[0].day?.condition?.text),
        getThemeColor(model.forecast?.forecastday?[0].day?.condition?.text)[400]!,
        getThemeColor(model.forecast?.forecastday?[0].day?.condition?.text)[300]!,
        getThemeColor(model.forecast?.forecastday?[0].day?.condition?.text)[200]!,
        getThemeColor(model.forecast?.forecastday?[0].day?.condition?.text)[100]!,
        getThemeColor(model.forecast?.forecastday?[0].day?.condition?.text)[50]!,

      ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              model.location!.name!,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
            Text(
              'updated at ${stringToDate(stringValue: model.current!.lastUpdated!).hour}:${stringToDate(stringValue: model.current!.lastUpdated!).minute}',
              style: const TextStyle(
                fontSize: 24,
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'assets/images/cloudy.png',
                ),
                Text(
                  model.forecast!.forecastday![0].day!.avgtempC.toString(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                ),
                Column(
                  children: [
                    Text(
                      'Maxtemp: ${model.forecast!.forecastday![0].day!.maxtempC!.round()}',
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'Mintemp: ${model.forecast!.forecastday![0].day!.mintempC!.round()}',
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 32,
            ),
            Text(
              "${model.forecast!.forecastday![0].day!.condition!.text}",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
          ],
        ),
      ),
    );
  }

  DateTime stringToDate({required String stringValue}) {
    return DateTime.parse(stringValue);
  }
}
