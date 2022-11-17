// ignore_for_file: prefer_const_constructors

import 'package:dotestowania/app/first/first_page.dart';
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
      theme: ThemeData( 
        colorScheme: ColorScheme.fromSwatch(),
        textTheme: GoogleFonts.emilysCandyTextTheme(),
        scaffoldBackgroundColor: Color.fromARGB(255, 180, 221, 221),
      ),
      home: FirstPage(),
    );
  }
}
