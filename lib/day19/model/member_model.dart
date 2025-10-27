import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class MemberModel {
  int? id;
  String name;
  String email;
  String domisiliName;
  int nomorHP;
  MemberModel({
    this.id,
    required this.name,
    required this.email,
    required this.domisiliName,
    required this.nomorHP,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'domisili': domisiliName,
      'nomorHP': nomorHP,
    };
  }

  factory MemberModel.fromMap(Map<String, dynamic> map) {
    return MemberModel(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] as String,
      email: map['email'] as String,
      domisiliName: map['domisili'] as String,
      nomorHP: map['nomorHP'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory MemberModel.fromJson(String source) =>
      MemberModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
