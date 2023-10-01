import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Cubits/Get_WeatherCubit/state.dart';
import 'package:weather_app/models/weathermodel/weathermodel.dart';
import 'package:weather_app/service/Weather_Service.dart';

class GetWeatherCubit extends Cubit<GetWeatherState> {
  GetWeatherCubit() : super(NoWeatherState());
  static GetWeatherCubit get(context) => BlocProvider.of(context);
  Weathermodel? weatherModel;
  getWeather({required String cityName}) async {
    emit(GetWeatherLoadingState());
    try {
      weatherModel =
          await WeatherService(dio: Dio()).getWeather(cityName: cityName);
      emit(GetWeatherSuccessState(model: weatherModel!));
    } catch (e) {
      emit(GetWeatherFailureState(error: e.toString()));
    }
  }
}
