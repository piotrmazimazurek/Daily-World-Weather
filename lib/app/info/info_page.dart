// ignore_for_file: prefer_const_constructors

import 'package:dotestowania/app/core/enums.dart';
import 'package:dotestowania/app/first/cubit/first_cubit.dart';
import 'package:dotestowania/data/remote_data_sources/weather_remote_data_source.dart';
import 'package:dotestowania/repositories/weather_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => FirstCubit(
              WeatherRepository(WeatherRemoteDataSource()),
            ),
        child: BlocListener<FirstCubit, FirstState>(listener: (context, state) {
          if (state.status == Status.error) {
            final errorMessage =
                state.errorMessage ?? 'Whoopsy...something went wrong';
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(errorMessage),
              ),
            );
          }
        }, child: BlocBuilder<FirstCubit, FirstState>(
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                  title: Text("There You Go ! "),
                  backgroundColor: const Color.fromARGB(255, 8, 8, 8)),
            );
          },
        )));
  }
}
