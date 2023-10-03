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
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        getThemeColor(model.forecast?.forecastday?[0].day?.condition?.text),
        getThemeColor(
            model.forecast?.forecastday?[0].day?.condition?.text)[400]!,
        getThemeColor(
            model.forecast?.forecastday?[0].day?.condition?.text)[300]!,
        getThemeColor(
            model.forecast?.forecastday?[0].day?.condition?.text)[200]!,
        getThemeColor(
            model.forecast?.forecastday?[0].day?.condition?.text)[100]!,
        getThemeColor(
            model.forecast?.forecastday?[0].day?.condition?.text)[50]!,
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
                  getImage(model.forecast!.forecastday![0].day!.condition!.text!),
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

  String getImage(String condition) {
    switch (condition) {
      case "Sunny":
      case "Clear":
        return "assets/images/clear.png";

      case "Cloudy":
      case "Partly cloudy":
      case "Overcast":
      case "Mist":
      case "Fog":
      case "Patchy light drizzle":
        return 'assets/images/cloudy.png';

      case "Patchy rain possible":
      case "Light drizzle":
      case "Patchy light rain":
      case "Light rain":
      case "Moderate rain at times":
      case "Moderate rain":
      case "Heavy rain at times":
      case "Heavy rain":
      case "Light rain shower":
      case "Moderate or heavy rain shower":
      case "Torrential rain shower":
      case "Light sleet showers":
      case "Moderate or heavy sleet showers":
        return "assets/images/rainy.png";

      case "Patchy snow possible":
      case "Patchy sleet possible":
      case "Patchy freezing drizzle possible":
      case "Blowing snow":
      case "Blizzard":
      case "Freezing fog":
      case "Freezing drizzle":
      case "Heavy freezing drizzle":
      case "Light freezing rain":
      case "Moderate or heavy freezing rain":
      case "Light sleet":
      case "Moderate or heavy sleet":
      case "Patchy light snow":
      case "Light snow":
      case "Patchy moderate snow":
      case "Moderate snow":
      case "Patchy heavy snow":
      case "Heavy snow":
      case "Ice pellets":
      case "Light snow showers":
      case "Moderate or heavy snow showers":
      case "Light showers of ice pellets":
      case "Moderate or heavy showers of ice pellets":
        return "assets/images/snow.png";

      case "Thundery outbreaks possible":
      case "Patchy light rain with thunder":
      case "Moderate or heavy rain with thunder":
      case "Patchy light snow with thunder":
      case "Moderate or heavy snow with thunder":
        return "assets/images/thunderstorm.png";
      // Add more cases for other conditions as needed

      default:
        return "assets/images/clear.png";
    }
  }
}
