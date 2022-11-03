// ignore_for_file: prefer_const_constructors

import 'package:dotestowania/app/core/enums.dart';
import 'package:dotestowania/app/domain/models/weather_model.dart';
import 'package:dotestowania/app/first/cubit/first_cubit.dart';
import 'package:dotestowania/main.dart';
import 'package:dotestowania/repositories/weather_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../data/remote_data_sources/weather_remote_data_source.dart';

class FirstPage extends StatelessWidget {
  FirstPage({
    Key? key,
  }) : super(key: key);

  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FirstCubit(
        WeatherRepository(WeatherRemoteDataSource()),
      ),
      child: BlocListener<FirstCubit, FirstState>(
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
        child: BlocBuilder<FirstCubit, FirstState>(
          builder: (context, state) {
            return Scaffold(
                appBar: AppBar(
                  title: Text(
                    "Heavy Cloud",
                  ),
                  backgroundColor: Color.fromARGB(255, 8, 8, 8),
                ),
                body: Center(
                  child: SingleChildScrollView(
                    reverse: true,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 350,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (_) => MainPage()),
                            );
                            controller.clear();
                          },
                          child: Text('Check Again'),
                        ),
                      ],
                    ),
                  ),
                ));
          },
        ),
      ),
    );
  }
}
