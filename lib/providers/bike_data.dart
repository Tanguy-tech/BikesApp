import 'package:flutter/material.dart';

class BikeData with ChangeNotifier {
  final String id;
  bool isSelected;
  final String model;
  final double costs;
  final double totalKmRidden;
  final double riddenSincePurchased;
  final double riddenWithLastRefill;
  // final List<FuelConsumption> fuelConsumptions;

  BikeData(
      {required this.id,
      required this.isSelected,
      required this.model,
      required this.costs,
      required this.totalKmRidden,
      required this.riddenSincePurchased,
      required this.riddenWithLastRefill});
  // required this.fuelConsumptions});
}
