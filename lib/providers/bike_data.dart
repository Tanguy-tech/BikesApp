import 'package:flutter/material.dart';
import '../models/models.dart';

class BikeData with ChangeNotifier {
  late final String id;
  late final Model bikeModel;
  late final double costs;
  late final double totalKmRidden;
  late final double riddenSincePurchased;
  late final double riddenWithLastRefill;

  BikeData(
      {required this.id,
      required this.bikeModel,
      required this.costs,
      required this.totalKmRidden,
      required this.riddenSincePurchased,
      required this.riddenWithLastRefill});
}
