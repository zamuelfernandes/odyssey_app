import 'package:flutter/material.dart';
import 'package:odyssey_app/services/jsonData.dart';
import 'package:odyssey_app/themes/app_colors.dart';
import 'pages/tutorialPage/tutorialPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    bool hasData = true;
    Widget initialPage = Container();

    if (hasData) {
      initialPage = const TutorialPage();
    }

    print(planetsList);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.deepPurple),
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
              EdgeInsets.symmetric(vertical: 10, horizontal: 15),
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
