import 'package:dotestowania/app/home/home_page.dart';
import 'package:dotestowania/main.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: Hive.box(darkModeBox).listenable(),
        builder: (context, box, widget) {
          //saving the value inside the hive box,
          var darkMode = box.get('darkMode', defaultValue: false);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode: darkMode ? ThemeMode.light : ThemeMode.dark,
            darkTheme: ThemeData(
              colorScheme: ColorScheme.fromSwatch(),
              textTheme: GoogleFonts.latoTextTheme(Theme.of(context)
                  .textTheme
                  .apply(
                      bodyColor: const Color.fromARGB(255, 255, 255, 255),
                      displayColor: const Color.fromARGB(255, 255, 255, 255))),
            ),
            home: HomePage(),
          );
        });
  }
}
