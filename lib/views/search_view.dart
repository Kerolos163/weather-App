import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Cubits/Get_WeatherCubit/cubit.dart';
import 'package:weather_app/Cubits/Get_WeatherCubit/state.dart';

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
            BlocListener<GetWeatherCubit, GetWeatherState>(
              listener: (context, state) {
                // TODO: implement listener
                if (state is GetWeatherSuccessState) {
                  Navigator.pop(context);
                }
              },
              child: TextField(
                onSubmitted: (value) async {
                  GetWeatherCubit.get(context).getWeather(cityName: value);
                },
                decoration: const InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16, vertical: 32),
                  label: Text("Search"),
                  hintText: "Enter City Name..",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
