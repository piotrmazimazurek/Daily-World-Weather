import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';

class InfoPage extends StatelessWidget {
  List<PageViewModel> getPages() {
    return [
      PageViewModel(
        image: null,
        title: 'Strona Testowa',
        body: 'Wygeneruj Nazwe',
        footer: Text('Udanego Straszenia'),
      ),
    ];
  }

  const InfoPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Generator Nazwy Potwora Halloween",
        ),
        backgroundColor: const Color.fromARGB(255, 8, 8, 8),
      ),
      body: IntroductionScreen(
          done: Text(
            'Done',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          onDone: () {},
          pages: getPages()),
    );
  }
}
