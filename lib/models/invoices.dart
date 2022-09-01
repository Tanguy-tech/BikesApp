import 'package:flutter/material.dart';

class Invoices {
  late final String id;
  late final String title;
  late final double price;
  late final DateTime date;
  late final Image photo;

  Invoices(
      {required this.id,
      required this.title,
      required this.date,
      required this.price,
      required this.photo});
}
