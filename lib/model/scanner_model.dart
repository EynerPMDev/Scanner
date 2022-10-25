import 'dart:convert';

ScannerModel scanModelFromJson(String str) =>
    ScannerModel.fromJson(json.decode(str));
String scanModelToJson(ScannerModel data) => json.encode(data.toJson());

class ScannerModel {
  int? id;
  String? tipo;
  String valor;

  ScannerModel({
    this.id,
    this.tipo,
    required this.valor,
  }) {
    if (valor.contains('http')) {
      tipo = 'http';
    } else {
      tipo = 'other';
    }
  }

  factory ScannerModel.fromJson(Map<String, dynamic> json) => ScannerModel(
        id: json["id"],
        tipo: json["tipo"],
        valor: json["valor"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "tipo": tipo,
        "valor": valor,
      };
}
