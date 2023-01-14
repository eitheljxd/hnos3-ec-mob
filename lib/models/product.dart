// To parse this JSON data, do
//
//     final product = productFromMap(jsonString);

import 'dart:convert';

import 'package:productos_app/models/models.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:productos_app/models/size.dart';

@JsonSerializable(anyMap: true, explicitToJson: true)
class Product {
  Product(
      {required this.available,
      required this.name,
      this.picture,
      required this.price,
      this.id,
      this.createdBy,
      this.sizes});

  bool available;
  String name;
  String? picture;
  double price;
  String? id;
  User? createdBy;
  List<Size>? sizes;

  factory Product.fromJson(String str) => Product.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Product.fromMap(Map<String, dynamic> json) => Product(
      available: json["available"],
      name: json["name"],
      picture: json["picture"],
      price: json["price"].toDouble(),
      createdBy: json["createdBy"],
      sizes: json["sizes"]);

  factory Product.fromMapFirebase(String id, Map<String, dynamic> json) =>
      Product(
          available: json["available"],
          name: json["name"],
          picture: json["picture"],
          price: json["price"].toDouble(),
          id: id);

  Map<String, dynamic> toMap() => {
        "available": available,
        "name": name,
        "picture": picture,
        "price": price,
        "createdBy": createdBy?.toMap(),
        "sizes": getListMap(sizes!)
      };

  Product copy() => Product(
      available: this.available,
      name: this.name,
      picture: this.picture,
      price: this.price,
      createdBy: this.createdBy,
      id: this.id,
      sizes: this.sizes);

  dynamic getListMap(List<dynamic> items) {
    if (items == null) {
      return null;
    }
    List<Map<String, dynamic>> dayItems = [];
    items.forEach((element) {
      dayItems.add(element.toMap());
    });
    return dayItems;
  }
}
