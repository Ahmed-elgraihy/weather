import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repo/cubits/get%20weather%20cubit/get_weather_states.dart';

import '../../model/weather_model.dart';
import '../../services/weather_services.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(NoWeatherState());

  WeatherModel? weatherModel;

  getweather({required String CityName}) async {
    try {
      weatherModel =
          await WeatherServices(Dio()).getcurrentweather(CityNmae: CityName);
      emit(WeatherLoadedState(weatherModel!));
    } catch (e) {
      emit(WeatherFailureState(e.toString()));
    }
  }
}
