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
          Container(
              padding: const EdgeInsets.all(9.0),
              width: 150,
              height: 150,
              decoration: const BoxDecoration(
                border: Border(
                  left: BorderSide(
                    color: Colors.black,
                    width: 25.0,
                  ),
                  right: BorderSide(
                    color: Colors.black,
                    width: 25.0,
                  ),
                  top: BorderSide(
                    color: Color.fromARGB(255, 255, 245, 245),
                    width: 20.0,
                  ),
                  bottom: BorderSide(
                    color: Color.fromARGB(255, 255, 255, 255),
                    width: 8.0,
                  ),
                ),
              ),
              child: const CircleAvatar(
                backgroundImage: AssetImage('images/change.gif'),
                radius: 130,
              )),
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
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0),
                    borderSide: const BorderSide(width: 2, color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0),
                    borderSide: const BorderSide(width: 2, color: Colors.white),
                  ),
                  hintText: "Enter Location",
                  hintStyle: const TextStyle(color: Colors.white)),
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
