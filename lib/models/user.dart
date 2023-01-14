// To parse this JSON data, do
//
//     final product = productFromMap(jsonString);

import 'dart:convert';

class User {
  User({required this.email});

  String email;

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) => User(email: json["email"]);

  factory User.fromMapFirebase(String id, Map<String, dynamic> json) =>
      User(email: json["email"]);

  Map<String, dynamic> toMap() => {"email": email};

  User copy() => User(email: this.email);
}
