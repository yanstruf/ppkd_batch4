// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

class KategoriModel {
  final String name;
  final String image;
  final Color? backgroundColor;
  final String description;
  KategoriModel({
    required this.name,
    required this.image,
    this.backgroundColor,
    required this.description,
  });
}
