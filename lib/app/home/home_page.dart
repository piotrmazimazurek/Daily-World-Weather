import 'package:dotestowania/app/core/enums.dart';
import 'package:dotestowania/app/domain/features/forecast_weather_page.dart';
import 'package:dotestowania/app/home/cubit/home_cubit.dart';
import 'package:dotestowania/app/domain/features/search_page.dart';
import 'package:dotestowania/app/domain/features/show_weather_page.dart';
import 'package:dotestowania/repositories/weather_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/remote_data_sources/weather_remote_data_source.dart';
import 'package:flutter_switch/flutter_switch.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isSwitchOn = true;

  Color textColor = const Color.fromARGB(255, 255, 255, 255);
  Color appBarColor = Colors.black87;
  Color scaffoldBgcolor = Colors.transparent;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(
        WeatherRepository(WeatherRemoteDataSource()),
      ),
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
                      "Daily World Weather",
                      style: TextStyle(color: textColor, fontSize: 21),
                    ),
                    backgroundColor: appBarColor,
                    automaticallyImplyLeading: false,
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
                  body: Center(child: Builder(builder: (context) {
                    if (state.status == Status.loading) {
                      return const Text('Loading');
                    }

                    return SingleChildScrollView(
                      reverse: true,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (weatherModel == null) SearchWidget(),
                          if (weatherModel != null)
                            ShowWeatherWidget(
                              weatherModel: weatherModel,
                            ),
                          if (weatherModel != null)
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                                shape: const StadiumBorder(),
                                side: const BorderSide(
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    width: 2),
                              ),
                              onPressed: () => Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) => const HomePage())),
                              child: const Text(
                                'Back',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          if (weatherModel != null)
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                                shape: const StadiumBorder(),
                                side: const BorderSide(
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    width: 2),
                              ),
                              onPressed: () =>
                                  Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const HomePage(),
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
                    );
                  }))));
        },
      ),
    );
  }
}
