// ignore_for_file: prefer_const_constructors

import 'package:dotestowania/app/info/info_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FirstPage extends StatelessWidget {
  FirstPage({
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
                CircleAvatar(
                  backgroundImage: AssetImage('images/cloud2.jpg'),
                  radius: 100,
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Text(
                    'Come Rain or Come Shine',
                    style: GoogleFonts.lato(
                      textStyle: Theme.of(context).textTheme.headline4,
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
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
                      MaterialPageRoute(builder: (_) => InfoPage()),
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
