import 'dart:developer';

import 'package:dio/dio.dart';

import '../models/weathermodel/weathermodel.dart';

class WeatherService {
  final Dio dio;
  final String baseURL = "http://api.weatherapi.com/v1/";
  final String apiKey = "d499147de6564585b1f05804230507";
  
  WeatherService({required this.dio});
  Future<Weathermodel> getWeather({required String cityName}) async {
    try {
      var response = await dio
          .get("${baseURL}forecast.json?key=$apiKey&q=$cityName&days=1");
      return Weathermodel.fromJson(response.data);
    } on DioException catch (e) {
      final String errorMessage = e.response?.data["error"]["message"] ??
          "Oops there was an error, try later";
      throw Exception(errorMessage);
    } catch (e) {
      log(e.toString());
      throw Exception("Oops there was an error, try later");
    }
  }
}
