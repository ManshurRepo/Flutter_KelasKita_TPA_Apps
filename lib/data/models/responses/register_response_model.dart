import 'package:meta/meta.dart';
import 'dart:convert';

class RegisterResponseModel {
  final String accesToken;
  final User user;

  RegisterResponseModel({
    required this.accesToken,
    required this.user,
  });

  factory RegisterResponseModel.fromJson(String str) =>
      RegisterResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RegisterResponseModel.fromMap(Map<String, dynamic> json) =>
      RegisterResponseModel(
        accesToken: json["acces_token"],
        user: User.fromMap(json["user"]),
      );

  Map<String, dynamic> toMap() => {
        "acces_token": accesToken,
        "user": user.toMap(),
      };
}

class User {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String roles;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.roles,
  });

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        roles: json["roles"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "email": email,
        "phone": phone,
        "roles": roles,
      };
}
