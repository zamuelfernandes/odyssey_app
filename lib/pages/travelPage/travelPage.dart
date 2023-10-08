// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:odyssey_app/services/jsonData.dart';
import 'package:odyssey_app/widgets/custom_dropdown.dart';

import '../../models/planets.dart';
import '../../themes/app_colors.dart';

class TravelPage extends StatefulWidget {
  final List<Planet> planets;
  const TravelPage({
    Key? key,
    required this.planets,
  }) : super(key: key);

  @override
  State<TravelPage> createState() => _TravelPageState();
}

class _TravelPageState extends State<TravelPage> {
  final TextEditingController _dropNamesController = TextEditingController();

  List<String> dropNames = ['Selecione a origem'];

  List<Planet> planetsToRoute = [];

  @override
  void initState() {
    print(planetsList);
    // TODO: implement initState
    super.initState();

    planetsToRoute = widget.planets;
    for (Planet planet in planetsList.planets!) {
      dropNames.add(planet.nome!);
    }
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
        body: SizedBox(
          width: screenWidth,
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: Text(
                  'Confirmação de\nViagem',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 32,
                    color: AppColors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Text(
                'Planeta de origem:',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  color: AppColors.white,
                ),
              ),
              SizedBox(
                width: screenWidth * 0.65,
                child: CustomDropDown(
                  dropOptions: dropNames,
                  controller: _dropNamesController,
                  elevation: false,
                  textStyle: const TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                  ),
                  setter: (value) {
                    print(_dropNamesController.text);

                    setState(() {});
                  },
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 30),
                child: Text(
                  'Destinos Selecionados:',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    color: AppColors.white,
                  ),
                ),
              ),
              SizedBox(
                height: screenHeight * 0.35,
                child: ListView.builder(
                  itemCount: planetsToRoute.length,
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.fromLTRB(
                        0,
                        index == 0 ? 5 : 0,
                        0,
                        index == (planetsToRoute.length - 1) ? 25 : 8,
                      ),
                      child: Card(
                        color: Colors.white30,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        elevation: 4,
                        child: ListTile(
                          tileColor: Colors.transparent,
                          leading: SizedBox(
                            width: 50,
                            child: Image(
                              image: AssetImage(planetsToRoute[index].imagem!),
                              fit: BoxFit.cover,
                            ),
                          ),
                          contentPadding: const EdgeInsets.all(5),
                          title: Text(
                            planetsToRoute[index].nome!,
                            style: const TextStyle(
                              color: AppColors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          subtitle: Text(
                            '${planetsToRoute[index].descricao!.substring(0, 65)}...',
                            style: const TextStyle(
                              color: AppColors.white,
                              fontSize: 13,
                            ),
                          ),
                          trailing: IconButton(
                            onPressed: () {
                              setState(() {
                                planetsToRoute.remove(planetsToRoute[index]);
                              });
                            },
                            icon: const Icon(
                              Icons.delete_forever,
                              size: 35,
                              color: AppColors.purple,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50),
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
                      'Visualizar Rota',
                      style: TextStyle(
                        fontSize: 24,
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
      ),
    );
  }
}
