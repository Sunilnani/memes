// To parse this JSON data, do
//
//     final girlsmeme = girlsmemeFromJson(jsonString);

import 'dart:convert';

List<Girlsmeme> girlsmemeFromJson(String str) => List<Girlsmeme>.from(json.decode(str).map((x) => Girlsmeme.fromJson(x)));

String girlsmemeToJson(List<Girlsmeme> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Girlsmeme {
  Girlsmeme({
    this.id,
    this.url,
    this.v,
    this.createdAt,
    this.updatedAt,
  });

  String id;
  String url;
  int v;
  DateTime createdAt;
  DateTime updatedAt;

  factory Girlsmeme.fromJson(Map<String, dynamic> json) => Girlsmeme(
    id: json["_id"],
    url: json["url"],
    v: json["__v"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "url": url,
    "__v": v,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
  };
}
