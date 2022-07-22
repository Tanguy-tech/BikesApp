import 'package:flutter/material.dart';
import 'package:meals_app/data/brand_data.dart';
import './models.dart';

class Category {
  late final String id;
  late final String title;
  late final Color color;
  late final Image logo;
  late final List<Model> models;

  Category(
      {required this.id,
      required this.title,
      required this.logo,
      this.color = Colors.orange,
      required this.models});
}
