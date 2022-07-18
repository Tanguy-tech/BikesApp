import 'package:flutter/material.dart';

class Model {
  final String id;
  final String brand;
  final Image brandLogo;
  final String name;
  final String hp;
  final String manufacturedDate;
  final Image photo;
  final String infos;

  Model(
      {required this.id,
      required this.brand,
      required this.brandLogo,
      required this.name,
      required this.hp,
      required this.manufacturedDate,
      required this.photo,
      required this.infos});
}
