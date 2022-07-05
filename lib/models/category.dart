import 'package:flutter/material.dart';
import './models.dart';

class Category {
  final String id;
  final String title;
  final Color color;
  final Image logo;
  final List<Model> models;

  const Category(
      {required this.id,
      required this.title,
      required this.logo,
      this.color = Colors.orange,
      required this.models});
}
