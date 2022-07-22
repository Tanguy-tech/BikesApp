import 'package:flutter/material.dart';

class Model {
  late final String id;
  late final String brand;
  late final Image brandLogo;
  late final String name;
  late final String hp;
  late final String manufacturedDate;
  late final Image photo;
  late final String infos;

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
