// ignore_for_file: public_member_api_docs, sort_constructors_first
// To parse this JSON data, do
//
//     final planets = planetsFromJson(jsonString);

import 'dart:convert';

List<Planets> planetsFromJson(String str) =>
    List<Planets>.from(json.decode(str).map((x) => Planets.fromJson(x)));

String planetsToJson(List<Planets> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Planets {
  String? nome;
  String? maxTemperatura;
  String? minTemperatura;
  String? ano;
  String? dia;
  double? diametro;
  int? tamanhoRelacaoTerra;
  double? gravidade;
  String? descricao;
  String? video;
  List<Ponto>? pontos;

  Planets({
    this.nome,
    this.maxTemperatura,
    this.minTemperatura,
    this.ano,
    this.dia,
    this.diametro,
    this.tamanhoRelacaoTerra,
    this.gravidade,
    this.descricao,
    this.video,
    this.pontos,
  });

  factory Planets.fromJson(Map<String, dynamic> json) => Planets(
        nome: json["nome"],
        maxTemperatura: json["max_temperatura"],
        minTemperatura: json["min_temperatura"],
        ano: json["ano"],
        dia: json["dia"],
        diametro: json["diametro"]?.toDouble(),
        tamanhoRelacaoTerra: json["tamanho_relacao_terra"],
        gravidade: json["gravidade"]?.toDouble(),
        descricao: json["descricao"],
        video: json["video"],
        pontos: json["pontos"] == null
            ? []
            : List<Ponto>.from(json["pontos"]!.map((x) => Ponto.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "nome": nome,
        "max_temperatura": maxTemperatura,
        "min_temperatura": minTemperatura,
        "ano": ano,
        "dia": dia,
        "diametro": diametro,
        "tamanho_relacao_terra": tamanhoRelacaoTerra,
        "gravidade": gravidade,
        "descricao": descricao,
        "video": video,
        "pontos": pontos == null
            ? []
            : List<dynamic>.from(pontos!.map((x) => x.toJson())),
      };

  @override
  String toString() {
    return 'Planets(nome: $nome, maxTemperatura: $maxTemperatura, minTemperatura: $minTemperatura, ano: $ano, dia: $dia, diametro: $diametro, tamanhoRelacaoTerra: $tamanhoRelacaoTerra, gravidade: $gravidade, descricao: $descricao, video: $video, pontos: $pontos)';
  }
}

class Ponto {
  String? nome;
  String? descricao;
  String? imagem;

  Ponto({
    this.nome,
    this.descricao,
    this.imagem,
  });

  factory Ponto.fromJson(Map<String, dynamic> json) => Ponto(
        nome: json["nome"],
        descricao: json["descricao"],
        imagem: json["imagem"],
      );

  Map<String, dynamic> toJson() => {
        "nome": nome,
        "descricao": descricao,
        "imagem": imagem,
      };
}
