// ignore_for_file: file_names

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:odyssey_app/models/planets.dart';
import 'package:odyssey_app/pages/aboutPage/aboutPage.dart';
import 'package:odyssey_app/pages/travelPage/travelPage.dart';
import 'package:odyssey_app/services/jsonData.dart';
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
  Planets planets = Planets();
  List<Planet> cart = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    planets = planetsList;
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
              padding: const EdgeInsets.only(top: 50, bottom: 100),
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
                        onTap: () {},
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              planet.imagem!,
                              fit: BoxFit.cover,
                              width: screenWidth * 0.6,
                            ),
                            Text(
                              planet.nome!,
                              style: const TextStyle(
                                color: AppColors.white,
                                fontSize: 30,
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
                  child: const Column(
                    children: [
                      Icon(
                        Icons.rocket_launch_outlined,
                        size: 45,
                      ),
                      Text(
                        'Ver Rota',
                        style: TextStyle(fontSize: 30),
                        textAlign: TextAlign.center,
                      ),
                    ],
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
