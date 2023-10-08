// ignore_for_file: file_names

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:odyssey_app/models/planets.dart';
import 'package:odyssey_app/pages/aboutPage/aboutPage.dart';
import 'package:odyssey_app/pages/initialPage/aboutPlanet.dart';
import 'package:odyssey_app/pages/travelPage/travelPage.dart';
import 'package:odyssey_app/services/jsonData.dart';
import 'package:odyssey_app/themes/app_colors.dart';

class InitialPage extends StatefulWidget {
  final String title;

  const InitialPage({
    Key? key,
    this.title = 'InitialPage',
  }) : super(key: key);
  @override
  InitialPageState createState() => InitialPageState();
}

class InitialPageState extends State<InitialPage> {
  Planets planets = Planets();
  List<Planet> cart = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    planets = planetsList;
    cart = [
      planetsList.planets![0],
      planetsList.planets![3],
      planetsList.planets![1],
      planetsList.planets![6],
    ];
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
          image: AssetImage("assets/images/background2.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
            color: AppColors.white,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AboutPage(),
                ),
              );
            },
            icon: const Icon(
              Icons.info_outlined,
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
            const Text(
              'Planetas',
              style: TextStyle(
                fontFamily: 'NicoMoji',
                color: AppColors.white,
                fontSize: 48,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 50, bottom: screenHeight * 0.1),
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 350,
                  enlargeCenterPage: true,
                  aspectRatio: 16 / 2,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  viewportFraction: 0.65,
                ),
                items: planets.planets!
                    .map(
                      (planet) => InkWell(
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: ((context) =>
                                  AboutPlanetPage(planet: planet)),
                            ),
                          );
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Hero(
                              tag: '${planet.nome}',
                              child: Image.asset(
                                planet.imagem!,
                                fit: BoxFit.cover,
                                width: planet.nome == 'Saturno'
                                    ? screenWidth * 0.7
                                    : screenWidth * 0.6,
                              ),
                            ),
                            Text(
                              planet.nome!,
                              style: const TextStyle(
                                color: AppColors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
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
                  onPressed: () {
                    if (cart.isEmpty) {
                      final snackBar = SnackBar(
                        backgroundColor: Colors.red[600],
                        content: const Row(
                          children: [
                            Icon(
                              Icons.error_outline,
                              color: Colors.white,
                            ),
                            SizedBox(width: 12.0),
                            Text(
                              'NENHUM PLANETA SELECIONADO.',
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        duration: const Duration(seconds: 3),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TravelPage(planets: cart),
                        ),
                      );
                    }
                  },
                  child: const Text(
                    'Resumo do\nTrajeto',
                    style: TextStyle(
                      fontSize: 30,
                      color: AppColors.black,
                    ),
                    textAlign: TextAlign.center,
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
