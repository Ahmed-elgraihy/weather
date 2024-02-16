import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:repo/model/weather_model.dart';

class WeatherServices {
  final Dio dio;
  final String BaseUrl = "https://api.weatherapi.com/v1";
  final String Apikey = "9a591811e92445dfae9143204230110";

  WeatherServices(this.dio);

  Future<WeatherModel> getcurrentweather({required String CityNmae}) async {
    try {
      Response response = await dio
          .get('$BaseUrl/forecast.json?key=$Apikey&q=$CityNmae&days=1');

      WeatherModel weatherModel = WeatherModel.fromjson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errMassage = e.response?.data['error']['message'] ??
          'oops  there was an error ,try later';
      throw Exception(errMassage);
    } catch (e) {
      log(e.toString());
      throw Exception('oops  there was an error ,try later');
    }
  }
}
