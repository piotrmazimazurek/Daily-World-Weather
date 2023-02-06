import 'package:dotestowania/app/core/enums.dart';
import 'package:dotestowania/app/core/injection_container.dart';
import 'package:dotestowania/app/domain/models/weather_model.dart';
import 'package:dotestowania/app/home/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_switch/flutter_switch.dart';
import '../../home/home_page.dart';

class ForecastWeatherPage extends StatefulWidget {
  const ForecastWeatherPage({
    Key? key,
    required this.weatherModel,
  }) : super(key: key);

  final WeatherModel weatherModel;

  @override
  State<ForecastWeatherPage> createState() => _ForecastWeatherPageState();
}

class _ForecastWeatherPageState extends State<ForecastWeatherPage> {
  bool isSwitchOn = true;

  Color textColor = const Color.fromARGB(255, 255, 255, 255);
  Color appBarColor = Colors.black87;
  Color scaffoldBgcolor = Colors.transparent;

  _ForecastWeatherPageState();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomeCubit>(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          if (state.status == Status.error) {
            final errorMessage =
                state.errorMessage ?? 'Whoopsy...something went wrong';
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(errorMessage),
              ),
            );
          }
        },
        builder: (context, state) {
          final weatherModel = state.model;
          return Container(
              constraints: const BoxConstraints.expand(),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage("images/world.jpg"),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.white.withOpacity(1.0),
                    BlendMode.dst,
                  ),
                ),
              ),
              child: Scaffold(
                backgroundColor: scaffoldBgcolor,
                appBar: AppBar(
                  title: Text(
                    "Back to Today",
                    style: TextStyle(color: textColor, fontSize: 21),
                  ),
                  backgroundColor: appBarColor,
                  actions: [
                    FlutterSwitch(
                      showOnOff: true,
                      width: 90.0,
                      height: 50.0,
                      toggleSize: 45.0,
                      value: isSwitchOn,
                      borderRadius: 30.0,
                      padding: 2.0,
                      inactiveTextColor: Colors.black,
                      activeTextColor: Colors.white,
                      activeTextFontWeight: FontWeight.w400,
                      inactiveTextFontWeight: FontWeight.w400,
                      activeToggleColor:
                          const Color.fromARGB(255, 117, 112, 112),
                      inactiveToggleColor: const Color(0xFF2F363D),
                      activeSwitchBorder: Border.all(
                        color: const Color.fromARGB(160, 117, 112, 112),
                        width: 6.0,
                      ),
                      inactiveSwitchBorder: Border.all(
                        color: const Color(0xFFD1D5DA),
                        width: 6.0,
                      ),
                      activeColor: const Color.fromARGB(255, 10, 10, 10),
                      inactiveColor: Colors.white,
                      activeIcon: const Icon(
                        Icons.nightlight_round,
                        color: Color(0xFFF8E3A1),
                      ),
                      inactiveIcon: const Icon(
                        Icons.wb_sunny,
                        color: Color(0xFFFFDF5D),
                      ),
                      onToggle: (value) {
                        setState(() {
                          isSwitchOn = value;

                          if (value) {
                            textColor = Colors.white;
                            appBarColor = Colors.black87;
                            scaffoldBgcolor = Colors.transparent;
                          } else {
                            textColor = Colors.black87;
                            appBarColor =
                                const Color.fromARGB(197, 255, 255, 255);
                            scaffoldBgcolor =
                                const Color.fromARGB(169, 255, 255, 255);
                          }
                        });
                      },
                    ),
                  ],
                ),
                body: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Container(
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
                                    border: Border.all(
                                        width: 3, color: Colors.white30),
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
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall),
                                      ),
                                      Image.network(
                                        widget.weatherModel.icon_url_day1,
                                        scale: 0.9,
                                      ),
                                      Text('Max Temperature :',
                                          style: Theme.of(context)
                                              .textTheme
                                              .overline),
                                      Padding(
                                        padding: const EdgeInsets.all(3.0),
                                        child: RichText(
                                          text: TextSpan(children: <TextSpan>[
                                            TextSpan(
                                                text: widget
                                                    .weatherModel.maxtemp_c_day1
                                                    .toString(),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headlineSmall),
                                            TextSpan(
                                                text: ' °C / ',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headlineSmall),
                                            TextSpan(
                                                text: widget
                                                    .weatherModel.maxtemp_f_day1
                                                    .toString(),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headlineSmall),
                                            TextSpan(
                                                text: ' °F',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headlineSmall),
                                          ]),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: Container(
                                    //SECOND WEATHER CONTAINER SECOND WEATHER CONTAINER SECOND WEATHER CONTAINER  WITH TOMORROW - > 1 DAY  1 DAY  1 DAY  1 DAY
                                    constraints: const BoxConstraints(
                                      maxHeight: double.infinity,
                                    ),
                                    decoration: BoxDecoration(
                                      gradient: const LinearGradient(
                                        begin: Alignment.topRight,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          Colors.white60,
                                          Colors.white10
                                        ],
                                      ),
                                      borderRadius: BorderRadius.circular(25),
                                      border: Border.all(
                                          width: 3, color: Colors.white30),
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
                                        Row(
                                          children: [
                                            const Text(' 🌞 '),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(3.0),
                                              child: Text(
                                                widget.weatherModel.sunrise_day1
                                                    .toString(),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headlineSmall,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            const Text(' 🌛 '),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(3.0),
                                              child: Text(
                                                widget.weatherModel.sunset_day1
                                                    .toString(),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headlineSmall,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(3.0),
                                          child: Row(
                                            children: [
                                              Text('Wind Speed (max) : ',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .overline),
                                              Text(
                                                widget.weatherModel.wind_day1
                                                    .toString(),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .overline,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(3.0),
                                          child: Row(
                                            children: [
                                              Text('Pressure (noon) : ',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .overline),
                                              Text(
                                                widget
                                                    .weatherModel.pressure_day1
                                                    .toString(),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .overline,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(3.0),
                                          child: Row(
                                            children: [
                                              Text('Air Quality : ',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .overline),
                                              Text(
                                                widget.weatherModel
                                                    .airquality_day1
                                                    .toString(),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .overline,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    )),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Container(
                            //THIRD WEATHER CONTAINER THIRD WEATHER CONTAINER THIRD WEATHER CONTAINER THIRD WEATHER CONTAINER THIRD WEATHER CONTAINER
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
                              border:
                                  Border.all(width: 3, color: Colors.white30),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.5),
                                  blurRadius: 20,
                                  spreadRadius: 5,
                                ),
                              ],
                            ),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: IntrinsicWidth(
                                child: Column(
                                  children: [
                                    Text(' Next Days :',
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle1),
                                    Row(
                                      // 2 DAY  2 DAY  2 DAY  2 DAY  2 DAY  2 DAY  2 DAY  2 DAY  2 DAY  2 DAY  2 DAY  2 DAY  2 DAY  2 DAY  2 DAY  2 DAY  2 DAY
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            widget.weatherModel.weekday2
                                                .toString(),
                                            style: Theme.of(context)
                                                .textTheme
                                                .overline,
                                          ),
                                        ),
                                        Column(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(3.0),
                                              child: Text('Max Temp of Day:',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .overline),
                                            ),
                                            RichText(
                                              text:
                                                  TextSpan(children: <TextSpan>[
                                                TextSpan(
                                                    text: widget.weatherModel
                                                        .maxtemp_c_day2
                                                        .toString(),
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .overline),
                                                TextSpan(
                                                    text: ' °C / ',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .overline),
                                                TextSpan(
                                                    text: widget.weatherModel
                                                        .maxtemp_f_day2
                                                        .toString(),
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .overline),
                                                TextSpan(
                                                    text: ' °F',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .overline),
                                              ]),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(3.0),
                                              child: Text(' Sunrise / Sunset :',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .overline),
                                            ),
                                            RichText(
                                                text: TextSpan(
                                                    children: <TextSpan>[
                                                  TextSpan(
                                                      text: widget.weatherModel
                                                          .sunrise_day2
                                                          .toString(),
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .overline),
                                                  TextSpan(
                                                      text: ' / ',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .overline),
                                                  TextSpan(
                                                      text: widget.weatherModel
                                                          .sunset_day2
                                                          .toString(),
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .overline),
                                                ])),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(15.0),
                                          child: Column(
                                            children: [
                                              Image.network(
                                                widget
                                                    .weatherModel.icon_url_day2,
                                                scale: 1.0,
                                              ),
                                              Text(' Condition : ',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .overline),
                                              Text(
                                                  widget.weatherModel
                                                      .condition_day2
                                                      .toString(),
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .overline),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(3.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text('Wind Speed 💨 : ',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .overline),
                                          Text(
                                            widget.weatherModel.wind_day2
                                                .toString(),
                                            style: Theme.of(context)
                                                .textTheme
                                                .overline,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(3.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text('Pressure 💤 : ',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .overline),
                                          Text(
                                            widget.weatherModel.pressure_day2
                                                .toString(),
                                            style: Theme.of(context)
                                                .textTheme
                                                .overline,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(3.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text('Air Quality 🍃 : ',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .overline),
                                          Text(
                                            widget.weatherModel.airquality_day2
                                                .toString(),
                                            style: Theme.of(context)
                                                .textTheme
                                                .overline,
                                          ),
                                        ],
                                      ),
                                    ),
                                    const Divider(
                                      height: 10,
                                      thickness: 2,
                                      color: Colors.white12,
                                      indent: 10,
                                      endIndent: 10,
                                    ), // 3 DAY 3 DAY 3 DAY 3 DAY 3 DAY 3 DAY 3 DAY 3 DAY 3 DAY 3 DAY 3 DAY 3 DAY 3 DAY - >
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            widget.weatherModel.weekday3
                                                .toString(),
                                            style: Theme.of(context)
                                                .textTheme
                                                .overline,
                                          ),
                                        ),
                                        Column(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(3.0),
                                              child: Text('Max Temp of Day:',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .overline),
                                            ),
                                            RichText(
                                              text:
                                                  TextSpan(children: <TextSpan>[
                                                TextSpan(
                                                    text: widget.weatherModel
                                                        .maxtemp_c_day3
                                                        .toString(),
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .overline),
                                                TextSpan(
                                                    text: ' °C / ',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .overline),
                                                TextSpan(
                                                    text: widget.weatherModel
                                                        .maxtemp_f_day3
                                                        .toString(),
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .overline),
                                                TextSpan(
                                                    text: ' °F',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .overline),
                                              ]),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(3.0),
                                              child: Text(' Sunrise / Sunset :',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .overline),
                                            ),
                                            RichText(
                                                text: TextSpan(
                                                    children: <TextSpan>[
                                                  TextSpan(
                                                      text: widget.weatherModel
                                                          .sunrise_day3
                                                          .toString(),
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .overline),
                                                  TextSpan(
                                                      text: ' / ',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .overline),
                                                  TextSpan(
                                                      text: widget.weatherModel
                                                          .sunset_day3
                                                          .toString(),
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .overline),
                                                ])),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(15.0),
                                          child: Column(
                                            children: [
                                              Image.network(
                                                widget
                                                    .weatherModel.icon_url_day3,
                                                scale: 1.0,
                                              ),
                                              Text(' Condition : ',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .overline),
                                              Text(
                                                  widget.weatherModel
                                                      .condition_day3
                                                      .toString(),
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .overline),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(3.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text('Wind Speed 💨 : ',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .overline),
                                          Text(
                                            widget.weatherModel.wind_day3
                                                .toString(),
                                            style: Theme.of(context)
                                                .textTheme
                                                .overline,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(3.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text('Pressure 💤 : ',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .overline),
                                          Text(
                                            widget.weatherModel.pressure_day3
                                                .toString(),
                                            style: Theme.of(context)
                                                .textTheme
                                                .overline,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(3.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text('Air Quality 🍃 : ',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .overline),
                                          Text(
                                            widget.weatherModel.airquality_day3
                                                .toString(),
                                            style: Theme.of(context)
                                                .textTheme
                                                .overline,
                                          ),
                                        ],
                                      ),
                                    ),
                                    const Divider(
                                      height: 10,
                                      thickness: 2,
                                      color: Colors.white12,
                                      indent: 10,
                                      endIndent: 10,
                                    ), // 4 DAY  4 DAY  4 DAY  4 DAY  4 DAY  4 DAY  4 DAY  4 DAY  4 DAY  4 DAY  4 DAY  4 DAY - >
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            widget.weatherModel.weekday4
                                                .toString(),
                                            style: Theme.of(context)
                                                .textTheme
                                                .overline,
                                          ),
                                        ),
                                        Column(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(3.0),
                                              child: Text('Max Temp of Day:',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .overline),
                                            ),
                                            RichText(
                                              text:
                                                  TextSpan(children: <TextSpan>[
                                                TextSpan(
                                                    text: widget.weatherModel
                                                        .maxtemp_c_day4
                                                        .toString(),
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .overline),
                                                TextSpan(
                                                    text: ' °C / ',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .overline),
                                                TextSpan(
                                                    text: widget.weatherModel
                                                        .maxtemp_f_day4
                                                        .toString(),
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .overline),
                                                TextSpan(
                                                    text: ' °F',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .overline),
                                              ]),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(3.0),
                                              child: Text(' Sunrise / Sunset :',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .overline),
                                            ),
                                            RichText(
                                                text: TextSpan(
                                                    children: <TextSpan>[
                                                  TextSpan(
                                                      text: widget.weatherModel
                                                          .sunrise_day4
                                                          .toString(),
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .overline),
                                                  TextSpan(
                                                      text: ' / ',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .overline),
                                                  TextSpan(
                                                      text: widget.weatherModel
                                                          .sunset_day4
                                                          .toString(),
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .overline),
                                                ])),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(15.0),
                                          child: Column(
                                            children: [
                                              Image.network(
                                                widget
                                                    .weatherModel.icon_url_day4,
                                                scale: 1.0,
                                              ),
                                              Text(' Condition : ',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .overline),
                                              Text(
                                                  widget.weatherModel
                                                      .condition_day4
                                                      .toString(),
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .overline),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(3.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text('Wind Speed 💨 : ',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .overline),
                                          Text(
                                            widget.weatherModel.wind_day4
                                                .toString(),
                                            style: Theme.of(context)
                                                .textTheme
                                                .overline,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(3.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text('Pressure 💤 : ',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .overline),
                                          Text(
                                            widget.weatherModel.pressure_day4
                                                .toString(),
                                            style: Theme.of(context)
                                                .textTheme
                                                .overline,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(3.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text('Air Quality 🍃 : ',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .overline),
                                          Text(
                                            widget.weatherModel.airquality_day4
                                                .toString(),
                                            style: Theme.of(context)
                                                .textTheme
                                                .overline,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.black,
                                          shape: const StadiumBorder(),
                                          side: const BorderSide(
                                              color: Color.fromARGB(
                                                  255, 255, 255, 255),
                                              width: 2),
                                        ),
                                        onPressed: () => Navigator.of(context)
                                            .push(MaterialPageRoute(
                                          builder: (context) =>
                                              const HomePage(),
                                        )),
                                        child: const Text(
                                          'Check New Location',
                                          style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 255, 255, 255),
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ));
        },
      ),
    );
  }
}
