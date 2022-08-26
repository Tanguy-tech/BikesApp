import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:meals_app/models/fuel_consumption.dart';
import 'package:meals_app/models/models.dart';

import '../models/invoices.dart';

List<FuelConsumption> FUELCONSUMPTION = [
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
];
