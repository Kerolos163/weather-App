import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Cubits/Get_WeatherCubit/state.dart';
import 'package:weather_app/service/Weather_Service.dart';

class GetWeatherCubit extends Cubit<GetWeatherState> {
  GetWeatherCubit() : super(NoWeatherState());
  static GetWeatherCubit get(context) => BlocProvider.of(context);
  getWeather({required String cityName}) async {
    emit(GetWeatherLoadingState());
    try {
      emit(GetWeatherSuccessState(
        model: await WeatherService(dio: Dio()).getWeather(cityName: cityName),
      ));
    } catch (e) {
      emit(GetWeatherFailureState(error: e.toString()));
    }
  }
}
