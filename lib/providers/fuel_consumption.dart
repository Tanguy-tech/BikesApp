import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class FuelConsumption with ChangeNotifier {
  late final String id;
  late final String fuelType;
  late final double price;
  late final DateTime date;
  late final double pricePerLitter;
  late final double volume;
  late final double dashKm;

  FuelConsumption(
      {required this.id,
      required this.fuelType,
      required this.date,
      required this.price,
      required this.pricePerLitter,
      required this.volume,
      required this.dashKm});
}
