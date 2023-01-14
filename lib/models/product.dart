// To parse this JSON data, do
//
//     final product = productFromMap(jsonString);

import 'dart:convert';

import 'package:productos_app/models/models.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable(anyMap: true, explicitToJson: true)
class Product {
  Product(
      {required this.available,
      required this.name,
      this.picture,
      required this.price,
      this.id,
      this.createdBy});

  bool available;
  String name;
  String? picture;
  double price;
  String? id;
  User? createdBy;

  factory Product.fromJson(String str) => Product.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Product.fromMap(Map<String, dynamic> json) => Product(
        available: json["available"],
        name: json["name"],
        picture: json["picture"],
        price: json["price"].toDouble(),
        createdBy: json["createdBy"],
      );

  factory Product.fromMapFirebase(String id, Map<String, dynamic> json) =>
      Product(
          available: json["available"],
          name: json["name"],
          picture: json["picture"],
          price: json["price"].toDouble(),
          createdBy: json["createdBy"],
          id: id);

  Map<String, dynamic> toMap() => {
        "available": available,
        "name": name,
        "picture": picture,
        "price": price,
        "createdBy": createdBy?.toMap(),
      };

  Product copy() => Product(
        available: this.available,
        name: this.name,
        picture: this.picture,
        price: this.price,
        createdBy: this.createdBy,
        id: this.id,
      );
}
