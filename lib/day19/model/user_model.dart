import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserModel {
  int? hp;
  String? name;
  String? email;
  String? asalkota;
  UserModel({this.hp, this.name, this.email, this.asalkota});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'hp': hp,
      'name': name,
      'email': email,
      'asalkota': asalkota,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      hp: map['hp'] != null ? map['hp'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      asalkota: map['asalkota'] != null ? map['asalkota'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
