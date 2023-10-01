import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Cubits/Get_WeatherCubit/cubit.dart';
import 'package:weather_app/Cubits/Get_WeatherCubit/state.dart';
import 'package:weather_app/widgets/no_weather_body.dart';
import 'search_view.dart';
import '../widgets/weather_info_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetWeatherCubit, GetWeatherState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Weather App'),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const SearchViewScreen(),
                  ));
                },
                icon: const Icon(Icons.search),
              )
            ],
          ),
          body: (state is GetWeatherSuccessState)
              ? WeatherInfoBody(model: state.model)
              : const NoWeatherBody(),
        );
      },
    );
  }
}
