import 'package:flutter/material.dart';

class Invoice with ChangeNotifier {
  late final String id;
  late final String title;
  late final double price;
  late final DateTime date;
  //late final Image photo;

  Invoice({
    required this.id,
    required this.title,
    required this.date,
    required this.price,
    //required this.photo});
  });
}
