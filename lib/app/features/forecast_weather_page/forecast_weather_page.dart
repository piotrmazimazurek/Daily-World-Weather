import 'package:dotestowania/app/core/enums.dart';
import 'package:dotestowania/app/core/injection_container.dart';
import 'package:dotestowania/app/domain/models/switch_model.dart';
import 'package:dotestowania/app/domain/models/weather_model.dart';
import 'package:dotestowania/app/features/forecast_weather_page/widgets/first_day_container.dart';
import 'package:dotestowania/app/features/forecast_weather_page/widgets/first_day_second_container.dart';
import 'package:dotestowania/app/features/forecast_weather_page/widgets/fourth_day_widget.dart';
import 'package:dotestowania/app/features/forecast_weather_page/widgets/second_day_widget.dart';
import 'package:dotestowania/app/features/forecast_weather_page/widgets/third_day_widget.dart';
import 'package:dotestowania/app/home/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_switch/flutter_switch.dart';
import '../../home/home_page.dart';
import 'package:provider/provider.dart';

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
                backgroundColor: context.watch<SwitchModel>().scaffoldBgcolor,
                appBar: AppBar(
                  title: Text(
                    "Back to Today",
                    style: TextStyle(
                        color: context.watch<SwitchModel>().textColor,
                        fontSize: 21),
                  ),
                  backgroundColor: context.watch<SwitchModel>().appBarColor,
                  actions: [
                    Consumer<SwitchModel>(builder: (context, value, _) {
                      return FlutterSwitch(
                        showOnOff: true,
                        width: 90.0,
                        height: 50.0,
                        toggleSize: 45.0,
                        value: value.isSwitchOn,
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
                        onToggle: (val) {
                          value.isSwitchOn = val;
                        },
                      );
                    })
                  ],
                ),
                body: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: FirstDayContainer(widget: widget),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: FirstDaySecondContainer(widget: widget),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Container(
                            constraints: const BoxConstraints(
                              maxHeight: double.infinity,
                            ),
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
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
                                    Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Text(' Next Days :',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium),
                                    ),
                                    SecondDayWidget(widget: widget),
                                    const Divider(
                                      height: 10,
                                      thickness: 2,
                                      color: Colors.white12,
                                      indent: 10,
                                      endIndent: 10,
                                    ),
                                    ThirdDayWidget(widget: widget),
                                    const Divider(
                                      height: 10,
                                      thickness: 2,
                                      color: Colors.white12,
                                      indent: 10,
                                      endIndent: 10,
                                    ),
                                    FourthDayWidget(widget: widget),
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
