// ignore_for_file: prefer_final_fields
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/http_exception.dart';
import 'fuel_consumption.dart';
import 'package:http/http.dart' as http;

class FuelConsumptions with ChangeNotifier {
  List<FuelConsumption> _fuelConsumptions = [
    // FuelConsumption(
    //     id: "f1",
    //     fuelType: "SP98",
    //     date: DateTime(2022, 7, 6, 9, 30),
    //     price: 27.98,
    //     pricePerLitter: 1.89,
    //     volume: 13.5,
    //     dashKm: 28080),
    // FuelConsumption(
    //     id: "f1",
    //     fuelType: "SP98",
    //     date: DateTime(2022, 7, 6, 9, 30),
    //     price: 31.98,
    //     pricePerLitter: 1.89,
    //     volume: 13.5,
    //     dashKm: 28080),
    // FuelConsumption(
    //     id: "f1",
    //     fuelType: "SP98",
    //     date: DateTime(2022, 7, 6, 9, 30),
    //     price: 16.12,
    //     pricePerLitter: 1.89,
    //     volume: 13.5,
    //     dashKm: 28080),
    // FuelConsumption(
    //     id: "f1",
    //     fuelType: "SP98",
    //     date: DateTime(2022, 7, 6, 9, 30),
    //     price: 16.12,
    //     pricePerLitter: 1.89,
    //     volume: 13.5,
    //     dashKm: 28080),
    // FuelConsumption(
    //     id: "f1",
    //     fuelType: "SP98",
    //     date: DateTime(2022, 7, 6, 9, 30),
    //     price: 16.12,
    //     pricePerLitter: 1.89,
    //     volume: 13.5,
    //     dashKm: 28080),
    // FuelConsumption(
    //     id: "f1",
    //     fuelType: "SP98",
    //     date: DateTime(2022, 7, 6, 9, 30),
    //     price: 16.12,
    //     pricePerLitter: 1.89,
    //     volume: 13.5,
    //     dashKm: 28080),
  ];

  List<FuelConsumption> get consumptions {
    return [..._fuelConsumptions];
  }

  Future<void> fetchAndSetFuelConsumptions() async {
    final url = Uri.parse(
        'https://motobox-eedda-default-rtdb.europe-west1.firebasedatabase.app/fuel_consumptions.json');
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      final List<FuelConsumption> loadedFuelConsumptions = [];
      extractedData.forEach((fcID, fcDATA) {
        loadedFuelConsumptions.insert(
            0,
            FuelConsumption(
                id: fcID,
                fuelType: fcDATA['fuelType'],
                date: DateFormat('dd.MM.yy').parse(fcDATA['date']),
                price: fcDATA['price'],
                pricePerLitter: fcDATA['pricePerLitter'],
                volume: fcDATA['volume'],
                dashKm: fcDATA['dashKm']));
      });
      _fuelConsumptions = loadedFuelConsumptions;
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }

  Future<void> addFuelConsumption(FuelConsumption fc) async {
    final url = Uri.parse(
        'https://motobox-eedda-default-rtdb.europe-west1.firebasedatabase.app/fuel_consumptions.json');
    try {
      final response = await http.post(url,
          body: json.encode({
            'fuelType': fc.fuelType,
            'date': DateFormat('dd.MM.yy').format(fc.date),
            'price': fc.price,
            'pricePerLitter': fc.pricePerLitter,
            'volume': fc.volume,
            'dashKm': fc.dashKm
          }));
      final newFc = FuelConsumption(
          id: json.decode(response.body)['name'],
          fuelType: fc.fuelType,
          date: fc.date,
          price: fc.price,
          pricePerLitter: fc.pricePerLitter,
          volume: fc.volume,
          dashKm: fc.dashKm);
      //_fuelConsumptions.add(newFc); // at the end of list
      _fuelConsumptions.insert(0, newFc); // at the begining of list
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }

  Future<void> deleteFuelConsumption(String id) async {
    final url = Uri.parse(
        'https://motobox-eedda-default-rtdb.europe-west1.firebasedatabase.app/fuel_consumptions/$id.json');
    final existingFcIndex = _fuelConsumptions.indexWhere((fc) => fc.id == id);
    FuelConsumption? existingFc = _fuelConsumptions[existingFcIndex];
    _fuelConsumptions.removeAt(existingFcIndex);
    final response = await http.delete(url);
    if (response.statusCode >= 400) {
      _fuelConsumptions.insert(
          existingFcIndex, // ensure to re-insert the instance if deleting fail
          existingFc);
      notifyListeners();
      throw HttpException('Could not delete FuelConsumption item..');
    }
    existingFc = null;
  }
}
