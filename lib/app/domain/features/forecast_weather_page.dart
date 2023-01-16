import 'package:dotestowania/app/domain/features/forecast_weather_page.dart';
import 'package:dotestowania/app/domain/models/weather_model.dart';
import 'package:dotestowania/app/home/cubit/home_cubit.dart';
import 'package:dotestowania/app/domain/features/search_page.dart';
import 'package:dotestowania/app/domain/features/show_weather_page.dart';
import 'package:dotestowania/repositories/weather_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dotestowania/data/remote_data_sources/weather_remote_data_source.dart';
import 'package:flutter_switch/flutter_switch.dart';

class ForecastWeatherWidget extends StatelessWidget {
  const ForecastWeatherWidget({
    Key? key,
    required this.weatherModel,
  }) : super(key: key);

  final WeatherModel weatherModel;

  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: const BoxConstraints(
          maxHeight: double.infinity,
        ),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomCenter,
            colors: [Colors.white60, Colors.white10],
          ),
          borderRadius: BorderRadius.circular(25),
          border: Border.all(width: 3, color: Colors.white30),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.7),
              blurRadius: 20,
              spreadRadius: 5,
            ),
          ],
        ),
        child: Column(
          children: [
            Image.network(
              weatherModel.icon_url,
              scale: 0.7,
            ),
          ],
        ));
  }
}
