import 'package:dotestowania/info/info_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Za kogo przebierzesz sie na Halloween?",
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
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                '"Dynia or not to Dynia. This is a Halloween Question."- Pułkownik Serious Pumpkin',
                style: GoogleFonts.lato(
                  textStyle: Theme.of(context).textTheme.headline4,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Nie wiesz za kogo się przebrać ? A może już się przebrałeś i nikt Cię nierozpoznał ? Chcesz obrabować dzieci z cukierków albo mały spożywczak ale wstydzisz się zrobić to w swoim zwykłym wcieleniu? Nie szkodzi ! Generator pomoże podjąć Ci decyzje za kogo się przebrać w Dzień Halloween ! Od teraz w ten dzień będziesz straszyć jako.....',
                style: GoogleFonts.lato(
                  textStyle: Theme.of(context).textTheme.headline4,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const InfoPage()),
                );
              },
              child: const Text('Wygeneruj'),
            ),
          ],
        ),
      ),
    );
  }
}
