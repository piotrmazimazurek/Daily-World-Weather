import 'package:dotestowania/app/core/enums.dart';
import 'package:dotestowania/app/main/cubit/main_cubit.dart';
import 'package:dotestowania/app/widgets/search_widget.dart';
import 'package:dotestowania/app/widgets/show_weather_widget.dart';
import 'package:dotestowania/repositories/weather_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/remote_data_sources/weather_remote_data_source.dart';

class MainPage extends StatelessWidget {
  const MainPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainCubit(
        WeatherRepository(WeatherRemoteDataSource()),
      ),
      child: BlocConsumer<MainCubit, MainState>(
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
                      image: const AssetImage("images/heavyclouds.jpg"),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                          Colors.white.withOpacity(0.5), BlendMode.darken))),
              child: Scaffold(
                  backgroundColor: Colors.transparent,
                  appBar: AppBar(
                    title: const Text(
                      "The Eye of Moon",
                    ),
                    backgroundColor: const Color.fromARGB(255, 8, 8, 8),
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
                          if (weatherModel != null)
                            ShowWeatherWidget(
                              weatherModel: weatherModel,
                            ),
                          SearchWidget()
                        ],
                      ),
                    );
                  }))));
        },
      ),
    );
  }
}
