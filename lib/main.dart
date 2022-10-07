// ignore_for_file: prefer_const_constructors

import 'package:dotestowania/first/first_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  List<PageViewModel> getPages() {
    return [
      PageViewModel(
          image: null,
          title: 'Strona Testowa',
          body: 'Wygeneruj Nazwe',
          footer: Text('Udanego Straszenia'),
          decoration:
              PageDecoration(pageColor: Color.fromARGB(255, 153, 59, 30)))
    ];
  }

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        colorScheme: ColorScheme.fromSwatch(),
        textTheme: GoogleFonts.emilysCandyTextTheme(),
        scaffoldBackgroundColor: Colors.orange[100],
      ),
      home: FirstPage(),
    );
  }
}
