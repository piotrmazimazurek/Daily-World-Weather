// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Za kogo przebierzesz sie na Halloween?"),
          backgroundColor: const Color.fromARGB(255, 8, 8, 8)),
    );
  }
}
