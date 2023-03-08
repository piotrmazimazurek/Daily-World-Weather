import 'package:dotestowania/app/core/enums.dart';
import 'package:dotestowania/app/core/injection_container.dart';
import 'package:dotestowania/app/domain/models/switch_model.dart';
import 'package:dotestowania/app/domain/models/weather_model.dart';
import 'package:dotestowania/app/features/forecast_weather_page/forecast_weather_page.dart';
import 'package:dotestowania/app/home/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:dotestowania/app/home/home_page.dart';
import 'package:provider/provider.dart';

class FirstDayContainer extends StatelessWidget {
  const FirstDayContainer({
    super.key,
    required this.widget,
  });

  final ForecastWeatherPage widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      //FIRST WEATHER CONTAINER FIRST WEATHER CONTAINER FIRST WEATHER CONTAINER WITH TOMORROW - > 1 DAY  1 DAY  1 DAY  1 DAY
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
            color: Colors.black.withOpacity(0.5),
            blurRadius: 20,
            spreadRadius: 5,
          ),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: Text('Tomorrow:',
                style: Theme.of(context).textTheme.labelLarge),
          ),
          Image.network(
            widget.weatherModel.icon_url_day1,
            scale: 0.9,
          ),
          Text('Max Temperature :',
              style: Theme.of(context).textTheme.labelLarge),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: RichText(
              text: TextSpan(children: <TextSpan>[
                TextSpan(
                    text: widget.weatherModel.maxtemp_c_day1.toString(),
                    style: Theme.of(context).textTheme.headlineSmall),
                TextSpan(
                    text: ' °C / ',
                    style: Theme.of(context).textTheme.headlineSmall),
                TextSpan(
                    text: widget.weatherModel.maxtemp_f_day1.toString(),
                    style: Theme.of(context).textTheme.headlineSmall),
                TextSpan(
                    text: ' °F',
                    style: Theme.of(context).textTheme.headlineSmall),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
