import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../models/weathermodel/weathermodel.dart';
import '../service/Weather_Service.dart';

class SearchViewScreen extends StatelessWidget {
  const SearchViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search City"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              onSubmitted: (value) async {
                Weathermodel model = await WeatherService(dio: Dio())
                    .getWeather(cityName: value);
                log(model.location!.name!);
                Navigator.pop(context);
              },
              decoration: const InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 16, vertical: 32),
                label: Text("Search"),
                hintText: "Enter City Name..",
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
