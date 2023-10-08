// ignore_for_file: public_member_api_docs, sort_constructors_first
// To parse this JSON data, do
//
//     final distances = distancesFromJson(jsonString);

import 'dart:convert';

Distances distancesFromJson(String str) => Distances.fromJson(json.decode(str));

String distancesToJson(Distances data) => json.encode(data.toJson());

class Distances {
  Classe? classeC;
  Classe? classeB;
  Classe? classeA;

  Distances({
    this.classeC,
    this.classeB,
    this.classeA,
  });

  factory Distances.fromJson(Map<String, dynamic> json) => Distances(
        classeC:
            json["classe_c"] == null ? null : Classe.fromJson(json["classe_c"]),
        classeB:
            json["classe_b"] == null ? null : Classe.fromJson(json["classe_b"]),
        classeA:
            json["classe_a"] == null ? null : Classe.fromJson(json["classe_a"]),
      );

  Map<String, dynamic> toJson() => {
        "classe_c": classeC?.toJson(),
        "classe_b": classeB?.toJson(),
        "classe_a": classeA?.toJson(),
      };

  @override
  String toString() =>
      'Distances(classeC: $classeC, classeB: $classeB, classeA: $classeA)';
}

class Classe {
  int? velocidade;
  ClasseAJupiter? mercurio;
  ClasseAJupiter? venus;
  ClasseAJupiter? terra;
  ClasseAJupiter? marte;
  ClasseAJupiter? jupiter;
  ClasseAJupiter? saturno;
  ClasseAJupiter? urano;
  ClasseAJupiter? netuno;

  Classe({
    this.velocidade,
    this.mercurio,
    this.venus,
    this.terra,
    this.marte,
    this.jupiter,
    this.saturno,
    this.urano,
    this.netuno,
  });

  factory Classe.fromJson(Map<String, dynamic> json) => Classe(
        velocidade: json["velocidade"],
        mercurio: json["mercurio"] == null
            ? null
            : ClasseAJupiter.fromJson(json["mercurio"]),
        venus: json["venus"] == null
            ? null
            : ClasseAJupiter.fromJson(json["venus"]),
        terra: json["terra"] == null
            ? null
            : ClasseAJupiter.fromJson(json["terra"]),
        marte: json["marte"] == null
            ? null
            : ClasseAJupiter.fromJson(json["marte"]),
        jupiter: json["jupiter"] == null
            ? null
            : ClasseAJupiter.fromJson(json["jupiter"]),
        saturno: json["saturno"] == null
            ? null
            : ClasseAJupiter.fromJson(json["saturno"]),
        urano: json["urano"] == null
            ? null
            : ClasseAJupiter.fromJson(json["urano"]),
        netuno: json["netuno"] == null
            ? null
            : ClasseAJupiter.fromJson(json["netuno"]),
      );

  Map<String, dynamic> toJson() => {
        "velocidade": velocidade,
        "mercurio": mercurio?.toJson(),
        "venus": venus?.toJson(),
        "terra": terra?.toJson(),
        "marte": marte?.toJson(),
        "jupiter": jupiter?.toJson(),
        "saturno": saturno?.toJson(),
        "urano": urano?.toJson(),
        "netuno": netuno?.toJson(),
      };

  @override
  String toString() => 'Classe(velocidade: $velocidade)';
}

class ClasseAJupiter {
  JupiterJupiter? mercurio;
  JupiterJupiter? venus;
  JupiterJupiter? terra;
  JupiterJupiter? marte;
  JupiterJupiter? saturno;
  JupiterJupiter? urano;
  JupiterJupiter? netuno;
  JupiterJupiter? jupiter;

  ClasseAJupiter({
    this.mercurio,
    this.venus,
    this.terra,
    this.marte,
    this.saturno,
    this.urano,
    this.netuno,
    this.jupiter,
  });

  factory ClasseAJupiter.fromJson(Map<String, dynamic> json) => ClasseAJupiter(
        mercurio: json["mercurio"] == null
            ? null
            : JupiterJupiter.fromJson(json["mercurio"]),
        venus: json["venus"] == null
            ? null
            : JupiterJupiter.fromJson(json["venus"]),
        terra: json["terra"] == null
            ? null
            : JupiterJupiter.fromJson(json["terra"]),
        marte: json["marte"] == null
            ? null
            : JupiterJupiter.fromJson(json["marte"]),
        saturno: json["saturno"] == null
            ? null
            : JupiterJupiter.fromJson(json["saturno"]),
        urano: json["urano"] == null
            ? null
            : JupiterJupiter.fromJson(json["urano"]),
        netuno: json["netuno"] == null
            ? null
            : JupiterJupiter.fromJson(json["netuno"]),
        jupiter: json["jupiter"] == null
            ? null
            : JupiterJupiter.fromJson(json["jupiter"]),
      );

  Map<String, dynamic> toJson() => {
        "mercurio": mercurio?.toJson(),
        "venus": venus?.toJson(),
        "terra": terra?.toJson(),
        "marte": marte?.toJson(),
        "saturno": saturno?.toJson(),
        "urano": urano?.toJson(),
        "netuno": netuno?.toJson(),
        "jupiter": jupiter?.toJson(),
      };
}

class JupiterJupiter {
  int? distancia;
  int? tempo;

  JupiterJupiter({
    this.distancia,
    this.tempo,
  });

  factory JupiterJupiter.fromJson(Map<String, dynamic> json) => JupiterJupiter(
        distancia: json["distancia"],
        tempo: json["tempo"],
      );

  Map<String, dynamic> toJson() => {
        "distancia": distancia,
        "tempo": tempo,
      };
}
