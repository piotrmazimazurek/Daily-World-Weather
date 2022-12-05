import 'package:dotestowania/app/home/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class SearchWidget extends StatelessWidget {
  SearchWidget({
    Key? key,
  }) : super(key: key);

  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      reverse: true,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 50,
          ),
          const CircleAvatar(
            backgroundImage: AssetImage('images/Moon9.gif'),
            radius: 65,
          ),
          const SizedBox(
            height: 22,
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
              TyperAnimatedText('And Air Quality',
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
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: "Enter Location"),
            ),
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              onPressed: () {
                context
                    .read<HomeCubit>()
                    .getWeatherModel(city: _controller.text);
                _controller.clear();
              },
              child: const Text(
                'Check',
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ))
        ],
      ),
    );
  }
}
