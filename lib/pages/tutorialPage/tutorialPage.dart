// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'package:odyssey_app/themes/app_colors.dart';

class TutorialPage extends StatefulWidget {
  final String title;
  const TutorialPage({
    Key? key,
    this.title = 'TutorialPage',
  }) : super(key: key);
  @override
  TutorialPageState createState() => TutorialPageState();
}

class TutorialPageState extends State<TutorialPage> {
  int activeIndex = 0;
  final _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.sizeOf(context).height;
    double screenWidth = MediaQuery.sizeOf(context).width;

    return Container(
      width: screenWidth,
      height: screenHeight,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/background.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            PageView(
              controller: _pageController,
              children: [
                //TUTORIAL 1 ----------------------------------------------
                Padding(
                  padding: EdgeInsets.only(bottom: screenHeight * 0.4),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image(
                        width: screenWidth * 0.85,
                        fit: BoxFit.cover,
                        image: const AssetImage('assets/images/ody.png'),
                      ),
                      const Text(
                        'Tutorial 1',
                        style: TextStyle(color: AppColors.white),
                      )
                    ],
                  ),
                ),
                //TUTORIAL 2 ----------------------------------------------
                Padding(
                  padding: EdgeInsets.only(bottom: screenHeight * 0.4),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SvgPicture.asset(
                        'assets/images/tutorial1.svg',
                        width: screenWidth * 0.85,
                      ),
                      const Text(
                        'Conheça os planetas do nosso sistema solar com alguns cliques!',
                        style: TextStyle(color: AppColors.white),
                      )
                    ],
                  ),
                ),
                //TUTORIAL 3 ----------------------------------------------
                Padding(
                  padding: EdgeInsets.only(bottom: screenHeight * 0.4),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SvgPicture.asset(
                        'assets/images/tutorial2.svg',
                        width: screenWidth * 0.85,
                      ),
                      const Text(
                        'Veja os pontos turísticos mais famosos de cada planeta!',
                        style: TextStyle(color: AppColors.white),
                      )
                    ],
                  ),
                ),
                //TUTORIAL 4 ----------------------------------------------
                Padding(
                  padding: EdgeInsets.only(bottom: screenHeight * 0.4),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SvgPicture.asset(
                        'assets/images/tutorial3.svg',
                        width: screenWidth * 0.85,
                      ),
                      const Text(
                        'Desenhe sua rota turística e conheça todo o sistema solar!',
                        style: TextStyle(color: AppColors.white),
                      )
                    ],
                  ),
                ),
                //TUTORIAL 5 ----------------------------------------------
                Padding(
                  padding: EdgeInsets.only(bottom: screenHeight * 0.4),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SvgPicture.asset(
                        'assets/images/tutorial4.svg',
                        width: screenWidth * 0.85,
                      ),
                      const Text(
                        'Envie seu pedido para a NASA e aguarde a confirmação da sua viagem interespacial!',
                        style: TextStyle(color: AppColors.white),
                      )
                    ],
                  ),
                ),
              ],
              onPageChanged: (index) => setState(() => activeIndex = index),
            ),
            //DOT INDCATOR ----------------------------------------------
            Padding(
              padding: EdgeInsets.only(bottom: screenHeight * 0.3),
              child: AnimatedSmoothIndicator(
                activeIndex: activeIndex,
                count: 5,
                effect: const JumpingDotEffect(
                  activeDotColor: AppColors.purple,
                  dotColor: AppColors.deepPurple,
                  dotWidth: 10,
                  dotHeight: 10,
                ),
              ),
            ),
            //NEXT BUTTON ----------------------------------------------
            Padding(
              padding: const EdgeInsets.only(bottom: 50),
              child: ElevatedButton(
                onPressed: () {
                  if (activeIndex < 4) {
                    _pageController.nextPage(
                      duration: const Duration(
                        milliseconds: 500,
                      ),
                      curve: Curves.easeInOut,
                    );
                  } else {
                    print('Bora pra outra página');
                  }
                },
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(AppColors.blue),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    activeIndex < 4 ? 'Próximo' : 'Vamos lá!',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.white,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
