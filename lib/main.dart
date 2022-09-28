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
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        colorScheme: ColorScheme.fromSwatch(),
        textTheme: GoogleFonts.emilysCandyTextTheme(),
        scaffoldBackgroundColor: Colors.orange[100],
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Generator Nazwy Potwora Halloween",
          ),
          backgroundColor: const Color.fromARGB(255, 8, 8, 8),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage('images/dynia2.jpg'),
                radius: 100,
              ),
              Text(
                'Dynia or not to Dynia. This is a Halloween Question.',
                style: GoogleFonts.lato(
                  textStyle: Theme.of(context).textTheme.headline4,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.italic,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Nie wiesz za kogo się przebrać ? A może już się przebrałeś i nikt Cię nierozpoznał ? Chcesz obrabować dzieci z cukierków albo mały spożywczak ale wstydzisz się zrobić to w swoim zwykłym wcieleniu? Nie szkodzi ! Wygeneruj sobie losową nazwe pod którą będziesz straszyć w Dzień Halloween !',
                style: GoogleFonts.lato(
                  textStyle: Theme.of(context).textTheme.headline4,
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.italic,
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Wygeneruj'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
