// To parse this JSON data, do
//
//     final product = productFromMap(jsonString);

import 'dart:convert';

class Size {
  final String name;
  final int? id;

  Size({this.id, required this.name});

  factory Size.fromJson(String str) => Size.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Size.fromMap(Map<String, dynamic> json) => Size(name: json["name"]);

  factory Size.fromMapFirebase(int id, Map<String, dynamic> json) =>
      Size(name: json["name"], id: id);

  Map<String, dynamic> toMap() => {"name": name};

  Size copy() => Size(name: this.name, id: this.id);
}
