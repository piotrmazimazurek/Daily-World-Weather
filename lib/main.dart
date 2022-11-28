// ignore_for_file: prefer_const_constructors

import 'package:dotestowania/app/main/main_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(),
        textTheme: GoogleFonts.latoTextTheme(),
      ),
      home: MainPage(),
    );
  }
}
