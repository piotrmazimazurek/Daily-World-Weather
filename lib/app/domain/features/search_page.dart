// ignore_for_file: depend_on_referenced_packages

import 'package:dotestowania/app/home/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:rive/rive.dart';

class SearchWidget extends StatelessWidget {
  SearchWidget({
    Key? key,
  }) : super(key: key);

  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          height: 50,
        ),
        const SizedBox(
          height: 22,
        ),
        const SizedBox(
          height: 160,
          width: 160,
          child: RiveAnimation.asset('assets/rivetest.riv'),
        ),
        AnimatedTextKit(
          isRepeatingAnimation: true,
          repeatForever: true,
          animatedTexts: [
            TyperAnimatedText('Check Weather',
                textStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  backgroundColor: Colors.black,
                )),
            TyperAnimatedText('And Weather Conditions',
                textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    backgroundColor: Colors.black)),
          ],
          onTap: () {
            ("I am executing");
          },
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: TextField(
            controller: _controller,
            cursorColor: Colors.black,
            decoration: InputDecoration(
              fillColor: const Color.fromARGB(255, 117, 112, 112),
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50.0),
                borderSide: const BorderSide(width: 2, color: Colors.white),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50.0),
                borderSide: const BorderSide(width: 2, color: Colors.white),
              ),
              hintText: "Enter Location",
              hintStyle: const TextStyle(color: Colors.white, fontSize: 16),
              suffixIcon: const Icon(
                Icons.search,
                color: Colors.white,
              ),
            ),
          ),
        ),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              shape: const StadiumBorder(),
              side: const BorderSide(
                  color: Color.fromARGB(255, 255, 255, 255), width: 2),
            ),
            onPressed: () {
              context.read<HomeCubit>().getWeatherModel(city: _controller.text);
              _controller.clear();
            },
            child: const Text(
              'Check',
              style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontSize: 16,
              ),
            ))
      ],
    );
  }
}
