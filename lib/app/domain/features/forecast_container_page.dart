import 'package:flutter/material.dart';

class ForecastContainerWidget extends StatelessWidget {
  const ForecastContainerWidget({
    Key? key,
  }) : super(key: key);

  final child = Column;

  @override
  Widget build(BuildContext context) {
    return Container(
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
        border: Border.all(width: 3, color: Colors.white30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            blurRadius: 20,
            spreadRadius: 5,
          ),
        ],
      ),
    );
  }
}
