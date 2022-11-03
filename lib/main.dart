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
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  MainPage({
    Key? key,
  }) : super(key: key);

  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Heavy Cloud",
          ),
          backgroundColor: Color.fromARGB(255, 8, 8, 8),
        ),
        body: Center(
          child: SingleChildScrollView(
            reverse: true,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 150,
                ),
                CircleAvatar(
                  backgroundImage: AssetImage('images/cloud2.jpg'),
                  radius: 65,
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Check the weather and other features",
                    style: GoogleFonts.lato(
                      textStyle: Theme.of(context).textTheme.headline4,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
                TextField(
                  controller: controller,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: "Enter The City"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => FirstPage()),
                    );
                    controller.clear();
                  },
                  child: Text('Check'),
                ),
              ],
            ),
          ),
        ));
  }
}
