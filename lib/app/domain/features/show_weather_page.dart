// ignore_for_file: depend_on_referenced_packages

import 'package:dotestowania/app/domain/models/weather_model.dart';
import 'package:dotestowania/app/home/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShowWeatherWidget extends StatelessWidget {
  const ShowWeatherWidget({
    Key? key,
    required this.weatherModel,
  }) : super(key: key);

  final WeatherModel weatherModel;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
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
              Text('Temperature (°C):',
                  style: Theme.of(context).textTheme.subtitle2),
              Text(
                weatherModel.temperature.toString(),
                style: Theme.of(context).textTheme.headline3,
              ),
              const Divider(
                height: 10,
                thickness: 2,
                color: Colors.white12,
                indent: 40,
                endIndent: 40,
              ),
              Text('City:', style: Theme.of(context).textTheme.subtitle2),
              Padding(
                padding: const EdgeInsets.all(9.0),
                child: Text(
                  weatherModel.city,
                  style: Theme.of(context).textTheme.headline3,
                ),
              ),
              Text(
                weatherModel.country.toString(),
                style: Theme.of(context).textTheme.headline5,
              ),
              const SizedBox(
                height: 5,
              ),
              Text('[Local Time & Date]:',
                  style: Theme.of(context).textTheme.overline),
              Text(
                weatherModel.localtime.toString(),
                style: Theme.of(context).textTheme.overline,
              ),
              const Divider(
                height: 10,
                thickness: 2,
                color: Colors.white12,
                indent: 40,
                endIndent: 40,
              ),
              Text('Condition:', style: Theme.of(context).textTheme.subtitle1),
              Padding(
                padding: const EdgeInsets.all(9.0),
                child: Text(
                  weatherModel.condition.toString(),
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
              const Divider(
                height: 10,
                thickness: 2,
                color: Colors.white12,
                indent: 40,
                endIndent: 40,
              ),
              Padding(
                padding: const EdgeInsets.all(9.0),
                child: Text('Pressure [1013,25 hPa = Most Healthy]:',
                    style: Theme.of(context).textTheme.subtitle1),
              ),
              Text(weatherModel.pressure.toString(),
                  style: Theme.of(context).textTheme.headline4),
              const Divider(
                height: 10,
                thickness: 2,
                color: Colors.white12,
                indent: 40,
                endIndent: 40,
              ),
              Padding(
                padding: const EdgeInsets.all(9.0),
                child: Text('Air Quality [1-6 scale/Higher=Unhealthy]:',
                    style: Theme.of(context).textTheme.subtitle1),
              ),
              Text(weatherModel.airquality.toString(),
                  style: Theme.of(context).textTheme.headline4),
            ],
          ),
        );
      },
    );
  }
}
