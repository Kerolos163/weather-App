// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:weather_app/models/weathermodel/weathermodel.dart';

abstract class GetWeatherState {}

class NoWeatherState extends GetWeatherState {}

class GetWeatherLoadingState extends GetWeatherState {}

class GetWeatherSuccessState extends GetWeatherState {
  final Weathermodel model;
  GetWeatherSuccessState({
    required this.model,
  });
}

class GetWeatherFailureState extends GetWeatherState {
  final String error;

  GetWeatherFailureState({required this.error});
}
