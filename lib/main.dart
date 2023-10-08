import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'pages/tutorialPage/tutorialPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  List? _planets = [];

  @override
  Widget build(BuildContext context) {
    bool hasData = true;
    Widget initialPage = Container();

    if (hasData) {
      initialPage = const TutorialPage();
    }

    Future<void> readJson() async {
      final String response =
          await rootBundle.loadString('lib/services/planetas.json');
      final data = await json.decode(response);
      _planets = data["planets"];
      print(_planets);
    }

    readJson();

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        fontFamily: 'TypoRound',
        //ELEVATED BUTTON STYLE -------------------------------------------
        elevatedButtonTheme: const ElevatedButtonThemeData(
          style: ButtonStyle(
            shadowColor: MaterialStatePropertyAll(Colors.transparent),
            shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
            ),
            padding: MaterialStatePropertyAll(
              EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            ),
            textStyle: MaterialStatePropertyAll(
              TextStyle(
                fontFamily: 'NicoMoji',
                fontSize: 30,
              ),
            ),
          ),
        ),
      ),
      home: initialPage,
    );
  }
}
