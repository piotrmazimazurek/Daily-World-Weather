import 'package:dotestowania/app/core/enums.dart';
import 'package:dotestowania/app/core/injection_container.dart';
import 'package:dotestowania/app/domain/models/switch_model.dart';
import 'package:dotestowania/app/features/forecast_weather_page/forecast_weather_page.dart';
import 'package:dotestowania/app/home/cubit/home_cubit.dart';
import 'package:dotestowania/app/features/search_page/search_page.dart';
import 'package:dotestowania/app/features/current_weather_page/current_weather_page.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                  backgroundColor: context.watch<SwitchModel>().scaffoldBgcolor,
                  appBar: AppBar(
                    title: Text(
                      "Daily World Forecast",
                      style: TextStyle(
                          color: context.watch<SwitchModel>().textColor,
                          fontSize: 21),
                    ),
                    backgroundColor: context.watch<SwitchModel>().appBarColor,
                    automaticallyImplyLeading: false,
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
                            color: const Color.fromARGB(188, 117, 112, 112),
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
                  body: Center(child: Builder(builder: (context) {
                    if (state.status == Status.loading) {
                      return const Text('Loading');
                    }

                    return SingleChildScrollView(
                      reverse: true,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (weatherModel == null) SearchPage(),
                          if (weatherModel != null)
                            CurrentWeatherWidget(
                              weatherModel: weatherModel,
                            ),
                          if (weatherModel != null)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.black,
                                    shape: const StadiumBorder(),
                                    side: const BorderSide(
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                        width: 2),
                                  ),
                                  onPressed: () => Navigator.of(context).push(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const HomePage())),
                                  child: const Text(
                                    'Back To Search',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.black,
                                    shape: const StadiumBorder(),
                                    side: const BorderSide(
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                        width: 2),
                                  ),
                                  onPressed: () => Navigator.of(context)
                                      .push(MaterialPageRoute(
                                    builder: (context) => ForecastWeatherPage(
                                      weatherModel: weatherModel,
                                    ),
                                  )),
                                  child: const Text(
                                    'Next Days Forecast',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                        ],
                      ),
                    );
                  }))));
        },
      ),
    );
  }
}
