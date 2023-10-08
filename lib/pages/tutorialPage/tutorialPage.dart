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
                  padding: EdgeInsets.only(
                    bottom: screenHeight * 0.4,
                    left: 30,
                    right: 30,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SvgPicture.asset(
                        'assets/images/tutorial1.svg',
                        width: screenWidth * 0.80,
                      ),
                      const SizedBox(height: 25),
                      const Text(
                        'Conheça os planetas do nosso sistema solar com alguns cliques!',
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
                //TUTORIAL 2 ----------------------------------------------
                Padding(
                  padding: EdgeInsets.only(
                    bottom: screenHeight * 0.4,
                    left: 30,
                    right: 30,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SvgPicture.asset(
                        'assets/images/tutorial2.svg',
                        width: screenWidth * 0.80,
                      ),
                      const SizedBox(height: 25),
                      const Text(
                        'Veja os pontos turísticos mais famosos de cada planeta!',
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
                //TUTORIAL 3 ----------------------------------------------
                Padding(
                  padding: EdgeInsets.only(
                    bottom: screenHeight * 0.4,
                    left: 30,
                    right: 30,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SvgPicture.asset(
                        'assets/images/tutorial3.svg',
                        width: screenWidth * 0.80,
                      ),
                      const SizedBox(height: 50),
                      const Text(
                        'Desenhe sua rota turística e conheça todo o sistema solar!',
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
                //TUTORIAL 4 ----------------------------------------------
                Padding(
                  padding: EdgeInsets.only(
                    bottom: screenHeight * 0.4,
                    left: 30,
                    right: 30,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SvgPicture.asset(
                        'assets/images/tutorial4.svg',
                        width: screenWidth * 0.80,
                      ),
                      const SizedBox(height: 15),
                      const Text(
                        'Envie seu pedido para a NASA e aguarde a confirmação da sua viagem interespacial!',
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
                //LET'S GOOO ----------------------------------------------
                Padding(
                  padding: EdgeInsets.only(
                    bottom: screenHeight * 0.4,
                    left: 30,
                    right: 30,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image(
                        width: screenWidth * 0.80,
                        fit: BoxFit.cover,
                        image: const AssetImage('assets/images/ody.png'),
                      ),
                      const SizedBox(height: 15),
                      const Text(
                        'ODYSSEY',
                        style: TextStyle(
                          fontFamily: 'NicoMoji',
                          fontSize: 55,
                          color: AppColors.white,
                        ),
                      ),
                      const Text(
                        'O universo na palma da sua mão!',
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ],
              onPageChanged: (index) => setState(() => activeIndex = index),
            ),
            //DOT INDCATOR ----------------------------------------------
            Padding(
              padding: EdgeInsets.only(bottom: screenHeight * 0.25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //PREV PAGE ------------------------
                  IconButton.filled(
                    onPressed: () {
                      if (activeIndex > 0) {
                        _pageController.previousPage(
                          duration: const Duration(
                            milliseconds: 500,
                          ),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios_rounded,
                      size: 35,
                      color: AppColors.white,
                    ),
                    style: const ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(AppColors.purple),
                    ),
                  ),
                  const SizedBox(width: 25),
                  //INDICATOR ------------------------
                  AnimatedSmoothIndicator(
                    activeIndex: activeIndex,
                    count: 5,
                    effect: const JumpingDotEffect(
                      activeDotColor: AppColors.purple,
                      dotColor: AppColors.deepPurple,
                      dotWidth: 15,
                      dotHeight: 15,
                    ),
                  ),
                  const SizedBox(width: 25),
                  //NEXT PAGE ------------------------
                  IconButton.filled(
                    onPressed: () {
                      if (activeIndex < 4) {
                        _pageController.nextPage(
                          duration: const Duration(
                            milliseconds: 500,
                          ),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                    icon: const Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 35,
                      color: AppColors.white,
                    ),
                    style: const ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(AppColors.purple),
                    ),
                  ),
                ],
              ),
            ),
            activeIndex > 3
                ? Padding(
                    padding: EdgeInsets.only(bottom: screenHeight * 0.1),
                    child: Container(
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.white,
                            blurRadius: 15,
                            spreadRadius: 0.2,
                          ),
                        ],
                      ),
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const Text(
                          'Entre no\nUniverso',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  )
                : Container(),
            activeIndex < 4
                ? Padding(
                    padding: EdgeInsets.only(bottom: screenHeight * 0.05),
                    child: const Text(
                      'ODYSSEY',
                      style: TextStyle(
                        fontFamily: 'NicoMoji',
                        fontSize: 26,
                        color: AppColors.white,
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
