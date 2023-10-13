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

    List<Widget> infoTexts = [
      Text(
        '${widget.planet.nome}',
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: AppColors.white,
          fontSize: 40,
        ),
      ),
      Container(
        width: screenWidth * 0.30,
        height: 1,
        color: AppColors.white,
        margin: const EdgeInsets.only(bottom: 25),
      ),
      Text(
        '- Temperatura Máxima: ${widget.planet.maxTemperatura}',
        style: const TextStyle(
          color: AppColors.white,
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
      ),
      Text(
        '- Temperatura Mínima: ${widget.planet.minTemperatura}',
        style: const TextStyle(
          color: AppColors.white,
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
      ),
      Text(
        '- Duração do Ano: ${widget.planet.ano}',
        style: const TextStyle(
          color: AppColors.white,
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
      ),
      Text(
        '- Duração do Dia: ${widget.planet.dia}',
        style: const TextStyle(
          color: AppColors.white,
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
      ),
      Text(
        '- Diâmetro: ${widget.planet.diametro}',
        style: const TextStyle(
          color: AppColors.white,
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
      ),
      Text(
        '- Tamanho em Relação a Terra: ${widget.planet.tamanhoRelacaoTerra}',
        style: const TextStyle(
          color: AppColors.white,
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
      ),
      Text(
        '- Gravidade: ${widget.planet.gravidade}',
        style: const TextStyle(
          color: AppColors.white,
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
      ),
      Text(
        '- Descrição: ${widget.planet.descricao}',
        style: const TextStyle(
          color: AppColors.white,
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
      ),
      SizedBox(
        width: screenWidth * 0.1,
        child: InkWell(
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
          ),
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
          child: const Text(
            'Pontos Turisticos',
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      const SizedBox(height: 50),
    ];

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
                width: screenWidth * 0.85,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(150),
                    topRight: Radius.circular(150),
                  ),
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
              SingleChildScrollView(
                child: SizedBox(
                  width: screenWidth * 0.8,
                  child: Column(
                    children: [
                      const SizedBox(height: 270),
                      SizedBox(
                        height: screenHeight * 0.6,
                        child: ListView.builder(
                          itemCount: infoTexts.length,
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.fromLTRB(
                                0,
                                index == 0 ? 5 : 0,
                                0,
                                0,
                              ),
                              child: infoTexts[index],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: widget.planet.nome == 'Saturno'
                    ? const EdgeInsets.only(top: 60)
                    : EdgeInsets.zero,
                child: Hero(
                  tag: '${widget.planet.nome}',
                  child: Image.asset(
                    widget.planet.imagem!,
                    fit: BoxFit.cover,
                    width: widget.planet.nome == 'Saturno'
                        ? screenWidth * 0.8
                        : screenWidth * 0.7,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
