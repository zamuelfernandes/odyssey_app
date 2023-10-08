import 'package:flutter/material.dart';
import 'package:odyssey_app/themes/app_colors.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
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
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),
            ),
          ),
          leading: Row(
            children: [
              const SizedBox(width: 5),
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  size: 30,
                  color: AppColors.white,
                ),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: SizedBox(
            width: screenWidth,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: screenWidth * 0.45,
                  child: const Image(
                    image: AssetImage('assets/images/ody.png'),
                  ),
                ),
                const Text(
                  'ODYSSEY',
                  style: TextStyle(
                    fontFamily: 'NicoMoji',
                    fontSize: 30,
                    color: AppColors.white,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 35, horizontal: 25),
                  child: Text(
                    'A ODYSSEY é uma empresa do setor de turismo interplanetário, abrindo as portas para uma experiência de viagem verdadeiramente fora des-te mundo! Nosso compromisso é fornecer aventuras espaciais ines-quecíveis para viajantes visionários que desejam explorar os limites do universo!\n\nNossa equipe nasceu em Itajubá (Minas Gerais - Brasil - Terra) no ano de 2023 no NASA SPACE APPS CHALLENGE com base no desafio “Planetary Tourism Office”  Desde então, trabalhamos para que as viagens interplanetárias sejam cada vez mais eficientes e confortáveis!',
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 25),
                  child: Text(
                    'EQUIPE ODYSSEY',
                    style: TextStyle(
                      fontFamily: 'NicoMoji',
                      fontSize: 30,
                      color: AppColors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: SizedBox(
                    height: screenHeight * 0.75,
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 10,
                      ),
                      itemCount: 6,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return SizedBox(
                          width: screenWidth * 0.25,
                          child: Image(
                            image: AssetImage(
                              'assets/images/team/member${index + 1}.png',
                            ),
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.05),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
