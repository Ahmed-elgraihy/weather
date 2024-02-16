import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repo/Home_page.dart';
import 'package:repo/cubits/get%20weather%20cubit/get_weather_cubit.dart';
import 'package:repo/cubits/get%20weather%20cubit/get_weather_states.dart';
import 'package:repo/model/weather_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) => BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            return MaterialApp(
              theme: ThemeData(
                primarySwatch: getThemeColor(
                    BlocProvider.of<GetWeatherCubit>(context)
                        .weatherModel
                        ?.weathercondition),
              ),
              debugShowCheckedModeBanner: false,
              home: HomePage(),
            );
          },
        ),
      ),
    );
  }
}

MaterialColor getThemeColor(String? condition) {
  if (condition == null) {
    return Colors.amber;
  }
  switch (condition) {
    case "sunny":
      return Colors.amber;
    case "partly cloudy":
      return Colors.blueGrey;
    case "cloudy":
      return Colors.grey;
    case "overcast":
      return Colors.grey;
    case "mist":
      return Colors.grey;
    case "patchy rain possible":
      return Colors.lightBlue;
    case "patchy snow possible":
      return Colors.lightBlue;
    case "patchy sleet possible":
      return Colors.lightBlue;
    case "patchy freezing drizzle possible":
      return Colors.lightBlue;
    case "thundery outbreaks possible":
      return Colors.deepOrange;

    case "fog":
    case "blowing snow":
    case "blizzard":
      return Colors.grey;
    case "freezing fog":
      return Colors.grey;
    case "patchy light drizzle":
      return Colors.lightBlue;
    case "light drizzle":
      return Colors.lightBlue;
    case "freezing drizzle":
      return Colors.lightBlue;
    case "heavy freezing drizzle":
      return Colors.lightBlue;
    case "patchy light rain":
      return Colors.lightBlue;
    case "light rain":
      return Colors.lightBlue;
    case "moderate rain at times":
      return Colors.lightBlue;
    case "moderate rain":
      return Colors.lightBlue;
    case "heavy rain at times":
      return Colors.lightBlue;
    case "heavy rain":
      return Colors.lightBlue;
    case "light freezing rain":
      return Colors.lightBlue;
    case "moderate or heavy freezing rain":
      return Colors.lightBlue;
    case "light sleet":
      return Colors.lightBlue;
    case "moderate or heavy sleet":
      return Colors.lightBlue;
    case "patchy light snow":
      return Colors.lightBlue;
    case "light snow":
      return Colors.lightBlue;
    case "patchy moderate snow":
      return Colors.lightBlue;
    case "moderate snow":
      return Colors.lightBlue;
    case "patchy heavy snow":
      return Colors.lightBlue;
    case "heavy snow":
      return Colors.lightBlue;
    case "ice pellets":
      return Colors.lightBlue;
    case "light rain shower":
      return Colors.lightBlue;
    case "moderate or heavy rain shower":
      return Colors.lightBlue;
    case "torrential rain shower":
      return Colors.lightBlue;
    case "light sleet showers":
      return Colors.lightBlue;
    case "moderate or heavy sleet showers":
      return Colors.lightBlue;
    case "light snow showers":
      return Colors.lightBlue;
    case "moderate or heavy snow showers":
      return Colors.lightBlue;
    case "light showers of ice pellets":
      return Colors.lightBlue;
    case "moderate or heavy showers of ice pellets":
      return Colors.lightBlue;
    case "patchy light rain with thunder":
      return Colors.red;
    case "moderate or heavy rain with thunder":
      return Colors.red;
    case "patchy light snow with thunder":
      return Colors.red;
    case "moderate or heavy snow with thunder":
      return Colors.red;
    default:
      return Colors.teal;
  }
}
