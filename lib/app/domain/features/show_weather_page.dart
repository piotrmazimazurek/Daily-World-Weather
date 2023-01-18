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
              Text('Temperature (°C / °F):',
                  style: Theme.of(context).textTheme.subtitle2),
              RichText(
                text: TextSpan(children: <TextSpan>[
                  TextSpan(
                      text: weatherModel.temperature_c.toString(),
                      style: Theme.of(context).textTheme.headline3),
                  TextSpan(
                      text: ' °C / ',
                      style: Theme.of(context).textTheme.headline3),
                  TextSpan(
                      text: weatherModel.temperature_f.toString(),
                      style: Theme.of(context).textTheme.headline3),
                  TextSpan(
                      text: ' °F',
                      style: Theme.of(context).textTheme.headline3),
                ]),
              ),
              RichText(
                text: TextSpan(children: <TextSpan>[
                  TextSpan(
                      text: ' Condition : ',
                      style: Theme.of(context).textTheme.headlineSmall),
                  TextSpan(
                      text: weatherModel.condition.toString(),
                      style: Theme.of(context).textTheme.headlineSmall),
                ]),
              ),
              const Divider(
                height: 10,
                thickness: 2,
                color: Colors.white12,
                indent: 40,
                endIndent: 40,
              ),
              Text('City:', style: Theme.of(context).textTheme.subtitle2),
              Text(
                weatherModel.city,
                style: Theme.of(context).textTheme.headline3,
              ),
              Text(
                weatherModel.country.toString(),
                style: Theme.of(context).textTheme.headline5,
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('[Local Time & Date] : ',
                        style: Theme.of(context).textTheme.overline),
                    Text(
                      weatherModel.localtime.toString(),
                      style: Theme.of(context).textTheme.overline,
                    ),
                  ],
                ),
              ),
              const Divider(
                height: 10,
                thickness: 2,
                color: Colors.white12,
                indent: 40,
                endIndent: 40,
              ),
              Text(' Sunrise / Sunset :',
                  style: Theme.of(context).textTheme.subtitle1),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: RichText(
                    text: TextSpan(children: <TextSpan>[
                  TextSpan(
                      text: weatherModel.sunriseday0.toString(),
                      style: Theme.of(context).textTheme.headlineSmall),
                  TextSpan(
                      text: ' 🌞 / 🌛 ',
                      style: Theme.of(context).textTheme.headlineSmall),
                  TextSpan(
                      text: weatherModel.sunsetday0.toString(),
                      style: Theme.of(context).textTheme.headlineSmall),
                ])),
              ),
              const Divider(
                height: 10,
                thickness: 2,
                color: Colors.white12,
                indent: 40,
                endIndent: 40,
              ),
              Text('Pressure [1013,25 hPa = Most Healthy]:',
                  style: Theme.of(context).textTheme.subtitle1),
              Text(weatherModel.pressure.toString(),
                  style: Theme.of(context).textTheme.headline5),
              const Divider(
                height: 10,
                thickness: 2,
                color: Colors.white12,
                indent: 40,
                endIndent: 40,
              ),
              Text('Air Quality [1-6 scale/Higher=Unhealthy]:',
                  style: Theme.of(context).textTheme.subtitle1),
              Text(weatherModel.airquality.toString(),
                  style: Theme.of(context).textTheme.headline5),
            ],
          ),
        );
      },
    );
  }
}
