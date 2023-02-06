import 'package:dotestowania/app/core/injection_container.dart';
import 'package:dotestowania/app/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(),
        textTheme: GoogleFonts.latoTextTheme(Theme.of(context).textTheme.apply(
            bodyColor: const Color.fromARGB(255, 255, 255, 255),
            displayColor: const Color.fromARGB(255, 255, 255, 255))),
      ),
      home: const HomePage(),
    );
  }
}
