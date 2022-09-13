// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'fuel_consumption.dart';

class FuelConsumptions with ChangeNotifier {
  List<FuelConsumption> _fuelConsumptions = [
    FuelConsumption(
        id: "f1",
        fuelType: "SP98",
        date: DateTime(2022, 7, 6, 9, 30),
        price: 27.98,
        pricePerLitter: 1.89,
        volume: 13.5,
        dashKm: 28080),
    FuelConsumption(
        id: "f1",
        fuelType: "SP98",
        date: DateTime(2022, 7, 6, 9, 30),
        price: 31.98,
        pricePerLitter: 1.89,
        volume: 13.5,
        dashKm: 28080),
    FuelConsumption(
        id: "f1",
        fuelType: "SP98",
        date: DateTime(2022, 7, 6, 9, 30),
        price: 16.12,
        pricePerLitter: 1.89,
        volume: 13.5,
        dashKm: 28080),
    FuelConsumption(
        id: "f1",
        fuelType: "SP98",
        date: DateTime(2022, 7, 6, 9, 30),
        price: 16.12,
        pricePerLitter: 1.89,
        volume: 13.5,
        dashKm: 28080),
    FuelConsumption(
        id: "f1",
        fuelType: "SP98",
        date: DateTime(2022, 7, 6, 9, 30),
        price: 16.12,
        pricePerLitter: 1.89,
        volume: 13.5,
        dashKm: 28080),
    FuelConsumption(
        id: "f1",
        fuelType: "SP98",
        date: DateTime(2022, 7, 6, 9, 30),
        price: 16.12,
        pricePerLitter: 1.89,
        volume: 13.5,
        dashKm: 28080),
  ];

  List<FuelConsumption> get consumptions {
    return [..._fuelConsumptions];
  }

  void addFuelConsumption(FuelConsumption fc) {
    final newFc = FuelConsumption(
        id: fc.id,
        fuelType: fc.fuelType,
        date: fc.date,
        price: fc.price,
        pricePerLitter: fc.pricePerLitter,
        volume: fc.volume,
        dashKm: fc.dashKm);
    //fuelConsumptions.add(newFc); // at the end of list
    _fuelConsumptions.insert(0, newFc); // at the begining of list
    //print('Adding a new fuel consumption...');
    notifyListeners();
  }
}
