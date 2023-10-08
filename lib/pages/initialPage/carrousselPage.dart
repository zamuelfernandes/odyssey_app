import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:odyssey_app/themes/app_colors.dart';

class CarrouselPage extends StatefulWidget {
  final String title;

  const CarrouselPage({
    Key? key,
    this.title = 'CarrouselPage',
  }) : super(key: key);
  @override
  CarrouselPageState createState() => CarrouselPageState();
}

class CarrouselPageState extends State<CarrouselPage> {
  final List<String> planetImgList = [
    //'assets/images/Saturno.png',
    'assets/images/Terra.png',
    'assets/images/Marte.png',
    'assets/images/Urano.png'
    //   'assets/images/planets/mercurio.png',
    //   'assets/images/planets/Venus.png',
    //   'assets/images/planets/Terra.png',
    //   'assets/images/planets/Marte.png',
    //   'assets/images/planets/Jupiter.png',
    //   // 'assets/images/planets/Saturno.svg',
    //   'assets/images/planets/Uranus.png',
  ];
  // var planetsImgMap = {
  //   'Saturno' : 'assets/images/Saturno.png',
  //   'Terra' : 'assets/images/Terra.png',
  //   'Marte' : 'assets/images/Marte.png',
  //   'Urano' : 'assets/images/Urano.png',
  // }

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
      )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
            color: AppColors.white,
            onPressed: () {},
            icon: const Icon(
              Icons.menu,
              size: 30,
            ),
          ),
          actions: <Widget>[
            IconButton(
              color: AppColors.white,
              iconSize: 30,
              onPressed: () {},
              icon: const Icon(Icons.rocket_launch_outlined),
            ),
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Planetas',
                  style: TextStyle(
                    fontFamily: 'NicoMoji',
                    color: AppColors.white,
                    fontSize: 48,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 350,
                  enlargeCenterPage: true,
                  aspectRatio: 16 / 2,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  viewportFraction: 0.6,
                ),
                items: planetImgList
                    .map(
                      (planet) => Column(
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                planet,
                                fit: BoxFit.cover,
                                height: 200,
                              ),
                            ],
                          ),

                          Text(
                            'Planeta',
                          ),
                        ],
                      ),
                    )
                    .toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
