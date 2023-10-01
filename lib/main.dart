import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Cubits/Get_WeatherCubit/cubit.dart';
import 'package:weather_app/Cubits/Get_WeatherCubit/state.dart';

import 'views/home_view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) {
          return BlocBuilder<GetWeatherCubit, GetWeatherState>(
            builder: (context, state) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                  primarySwatch: getThemeColor(GetWeatherCubit.get(context)
                      .weatherModel
                      ?.forecast
                      ?.forecastday?[0]
                      .day
                      ?.condition
                      ?.text),
                ),
                home: const HomeView(),
              );
            },
          );
        },
      ),
    );
  }

  MaterialColor getThemeColor(String? condition) {
    if (condition == null) {
      return Colors.blue;
    }
    switch (condition) {
      case "Sunny":
        return Colors.amber;
      case "Clear":
        return Colors.yellow;
      case "Partly cloudy":
        return Colors.lightBlue;
      case "Cloudy":
        return Colors.grey;
      case "Overcast":
        return Colors.blueGrey;
      case "Mist":
        return Colors.indigo;
      case "Patchy rain possible":
        return Colors.lightGreen;
      case "Patchy snow possible":
        return Colors.blueGrey;
      // Add more cases for other conditions as needed

      default:
        return Colors.blue;
    }
  }
}
