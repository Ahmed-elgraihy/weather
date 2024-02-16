import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repo/cubits/get%20weather%20cubit/get_weather_cubit.dart';
import 'package:repo/main.dart';
import 'package:repo/model/weather_model.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({
    super.key,
    required this.weather,
  });

  final WeatherModel weather;

  @override
  Widget build(BuildContext context) {
    WeatherModel weatherModel =
        BlocProvider.of<GetWeatherCubit>(context).weatherModel!;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          getThemeColor(weatherModel.weathercondition),
          getThemeColor(weatherModel.weathercondition)[500]!,
          getThemeColor(weatherModel.weathercondition)[50]!
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                weatherModel.CityName,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "updated at ${weatherModel.date.hour}:${weatherModel.date.minute}",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.network("https:${weatherModel.image!}"),
                  Text(
                    weatherModel.temp.toString(),
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Column(
                    children: [
                      Text(
                        "Maxtemp:${weatherModel.maxtemp.round()}",
                        style: TextStyle(fontSize: 21),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Text(
                        "Mintemp: ${weatherModel.mintemp.round()}",
                        style: TextStyle(fontSize: 19),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 45,
              ),
              Text(
                " ${weatherModel.weathercondition}",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
