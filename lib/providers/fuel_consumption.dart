import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class FuelConsumption with ChangeNotifier {
  final String id;
  final String fuelType;
  final double price;
  final DateTime date;
  final double pricePerLitter;
  final double volume;
  final double dashKm;
  final double kmRidden;

  FuelConsumption(
      {required this.id,
      required this.fuelType,
      required this.date,
      required this.price,
      required this.pricePerLitter,
      required this.volume,
      required this.dashKm,
      required this.kmRidden});
}
