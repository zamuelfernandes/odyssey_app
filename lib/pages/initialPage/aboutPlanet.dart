import 'package:flutter/material.dart';
import 'package:odyssey_app/models/planets.dart';
import 'package:odyssey_app/pages/initialPage/attractionsPage.dart';
import 'package:odyssey_app/themes/app_colors.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class AboutPlanetPage extends StatefulWidget {
  final Planet planet;
  final String title;

  const AboutPlanetPage({
    super.key,
    required this.planet,
    this.title = 'AboutPlanetPage',
  });

  @override
  AboutPlanetPageState createState() => AboutPlanetPageState();
}

class AboutPlanetPageState extends State<AboutPlanetPage> {
  Planet? planet;
  String videoID = '';
  YoutubePlayerController _controller =
      YoutubePlayerController(initialVideoId: '');

  @override
  void initState() {
    planet = widget.planet;
    videoID = planet!.video!;
    _controller = YoutubePlayerController(
      initialVideoId: videoID,
    );
    super.initState();
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
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              size: 30,
              color: AppColors.white,
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
        body: Center(
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                  margin: const EdgeInsets.only(top: 120),
                  width: screenWidth * 0.8,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(150),
                      topRight: Radius.circular(150),
                    ),
                    color: Colors.black.withOpacity(0.5),
                  )),
              Hero(
                tag: '${widget.planet.nome}',
                child: Image.asset(
                  widget.planet.imagem!,
                  fit: BoxFit.cover,
                  width: screenWidth * 0.6,
                ),
              ),
              SizedBox(
                width: screenWidth * 0.7,
                child: Column(
                  children: [
                    const SizedBox(height: 230),
                    Text(
                      '${widget.planet.nome}',
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        color: AppColors.white,
                        fontSize: 40,
                      ),
                    ),
                    Container(
                      width: screenWidth * 0.4,
                      height: 1,
                      color: AppColors.white,
                      margin: const EdgeInsets.symmetric(vertical: 15),
                    ),
                    infoTextWidget('Temperatura Máxima: ',
                        '${widget.planet.maxTemperatura}'),
                    infoTextWidget('Temperatura Mínima: ',
                        '${widget.planet.minTemperatura}'),
                    infoTextWidget('Duração do Ano: ', '${widget.planet.ano}'),
                    infoTextWidget('Duração do Dia: ', '${widget.planet.dia}'),
                    infoTextWidget('Diâmetro: ', '${widget.planet.nome}'),
                    infoTextWidget('Tamanho em Relação a Terra: ',
                        '${widget.planet.tamanhoRelacaoTerra}'),
                    infoTextWidget('Gravidade: ', '${widget.planet.gravidade}'),
                    // infoTextWidget('Descrição: ', '${widget.planet!.descricao}'),
                    InkWell(
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return YoutubePlayer(
                              controller: _controller,
                              showVideoProgressIndicator: true,
                              onReady: () {
                                //_controller.addListener(listener);
                              },
                            );
                          },
                        );
                      },
                      child: Image.asset(
                        'assets/images/player.png',
                        fit: BoxFit.cover,
                        width: screenWidth * 0.2,
                      ),
                    ),

                    Container(
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AttractionsPage(),
                            ),
                          );
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
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget infoTextWidget(label, value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: AppColors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        Flexible(
          child: Text(
            value,
            style: const TextStyle(color: AppColors.white),
          ),
        ),
      ],
    );
  }
}
