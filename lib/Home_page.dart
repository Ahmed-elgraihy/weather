import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repo/Noweatherbody.dart';
import 'package:repo/Search_view.dart';
import 'package:repo/cubits/get%20weather%20cubit/get_weather_cubit.dart';
import 'package:repo/cubits/get%20weather%20cubit/get_weather_states.dart';
import 'package:repo/model/weather_model.dart';
import 'package:repo/weather_info_body.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Weather app",
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return SearchView();
                  },
                ),
              );
            },
            icon: Icon(Icons.search),
          ),
        ],
      ),
      body: BlocBuilder<GetWeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is NoWeatherState) {
            return NoWeatherBody();
          } else if (state is WeatherLoadedState) {
            return WeatherInfoBody(
              weather: state.weatherModel,
            );
          } else
            return Text("opps there was an error");
        },
      ),
    );
  }
}
