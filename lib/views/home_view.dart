import 'package:flutter/material.dart';
import 'search_view.dart';
import '../widgets/no_weather_body.dart';
import '../widgets/weather_info_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      body: const WeatherInfoBody(),
    );
  }
}
