// ignore_for_file: prefer_final_fields
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:motobox/providers/bike_data.dart';
import 'package:motobox/providers/my_bikes.dart';
import '../models/http_exception.dart';
import 'fuel_consumption.dart';
import 'package:http/http.dart' as http;

class FuelConsumptions with ChangeNotifier {
  List<FuelConsumption> _fuelConsumptions = [];

  List<FuelConsumption> get consumptions {
    return [..._fuelConsumptions];
  }

  FuelConsumption findById(String id) {
    return _fuelConsumptions.firstWhere((fc) => fc.id == id);
  }

  Future<void> fetchAndSetFuelConsumptions() async {
    final url = Uri.parse(
        'https://motobox-eedda-default-rtdb.europe-west1.firebasedatabase.app/fuel_consumptions.json');
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      final List<FuelConsumption> loadedFuelConsumptions = [];
      if (extractedData == null || extractedData.isEmpty) {
        _fuelConsumptions = [];
      } else {
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
                  dashKm: fcDATA['dashKm'],
                  kmRidden: fcDATA['kmRidden'],
                  bikeId: fcDATA['bikeId']));
        });
        _fuelConsumptions = loadedFuelConsumptions;
      }
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
            //'id': fc.id,
            'fuelType': fc.fuelType,
            'date': DateFormat('dd.MM.yy').format(fc.date),
            'price': fc.price,
            'pricePerLitter': fc.pricePerLitter,
            'volume': fc.volume,
            'dashKm': fc.dashKm,
            'kmRidden': fc.kmRidden,
            'bikeId': fc.bikeId
          }));
      final newFc = FuelConsumption(
          id: json.decode(response.body)['name'],
          fuelType: fc.fuelType,
          date: fc.date,
          price: fc.price,
          pricePerLitter: fc.pricePerLitter,
          volume: fc.volume,
          dashKm: fc.dashKm,
          kmRidden: fc.kmRidden,
          bikeId: fc.bikeId);
      //_fuelConsumptions.add(newFc); // at the end of list
      _fuelConsumptions.insert(0, newFc); // at the begining of list
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }

  Future<void> updateFuelConsumption(String id, FuelConsumption newFc) async {
    final fuelConsumptionIndex =
        _fuelConsumptions.indexWhere((fc) => newFc.id == id);
    if (fuelConsumptionIndex >= 0) {
      final url = Uri.parse(
          'https://motobox-eedda-default-rtdb.europe-west1.firebasedatabase.app/fuel_consumptions/$id.json');
      try {
        await http.patch(url,
            body: json.encode({
              'fuelType': newFc.fuelType,
              'date': DateFormat('dd.MM.yy').format(newFc.date),
              'price': newFc.price,
              'pricePerLitter': newFc.pricePerLitter,
              'dashKm': newFc.dashKm,
              'volume': newFc.volume,
              'kmRidden': newFc.kmRidden
              //'bikeData': newFc.bikeData
            }));
        _fuelConsumptions[fuelConsumptionIndex] = newFc;
        notifyListeners();
      } catch (error) {
        rethrow;
      }
    } else {
      print('...');
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
