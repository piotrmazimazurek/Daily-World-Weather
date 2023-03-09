import 'package:dotestowania/app/features/forecast_weather_page/forecast_weather_page.dart';
import 'package:flutter/material.dart';

class FirstDayContainer extends StatelessWidget {
  const FirstDayContainer({
    super.key,
    required this.widget,
  });

  final ForecastWeatherPage widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(),
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
          Padding(
            padding: const EdgeInsets.all(1.0),
            child: Text('Max Temperature :',
                style: Theme.of(context).textTheme.labelLarge),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
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
