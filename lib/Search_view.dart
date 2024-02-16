import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repo/model/weather_model.dart';
import 'package:repo/services/weather_services.dart';

import 'cubits/get weather cubit/get_weather_cubit.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search City"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
            child: TextField(
          onSubmitted: (value) async {
            WeatherModel weatherModel =
                await WeatherServices(Dio()).getcurrentweather(CityNmae: value);
            log(weatherModel.CityName);
            var getweathercubit = BlocProvider.of<GetWeatherCubit>(context);
            getweathercubit.getweather(CityName: value);
            Navigator.pop(context);
          },
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 26),
            labelText: "Search",
            hintText: "Enter City Name",
            suffixIcon: Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: Colors.green),
            ),
          ),
        )),
      ),
    );
  }
}
