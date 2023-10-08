import 'package:flutter/material.dart';
import 'pages/tutorialPage/tutorialPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    bool hasData = true;
    Widget initialPage = Container();

    if (hasData) {
      initialPage = const TutorialPage();
    }

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
