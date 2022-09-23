// ignore_for_file: prefer_final_fields
import 'package:flutter/material.dart';
import 'package:motobox/providers/bike_data.dart';
import 'package:motobox/providers/fuel_consumption.dart';
import 'dart:convert';
import '../models/http_exception.dart';
import 'package:http/http.dart' as http;

class MyBikes with ChangeNotifier {
  List<BikeData> _myBikes = [];

  List<BikeData> get bikes {
    return [..._myBikes];
  }

  BikeData findById(String id) {
    return _myBikes.firstWhere((fc) => fc.id == id);
  }

  Future<void> fetchAndSetBikes() async {
    final url = Uri.parse(
        'https://motobox-eedda-default-rtdb.europe-west1.firebasedatabase.app/my_bikes.json');
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      final List<BikeData> loadedBikeDatas = [];
      if (extractedData == null || extractedData.isEmpty) {
        _myBikes = [];
      } else {
        extractedData.forEach((bikeID, bikeData) {
          loadedBikeDatas.insert(
              0,
              BikeData(
                  id: bikeID,
                  isSelected: bikeData['isSelected'],
                  model: bikeData['model'],
                  costs: bikeData['costs'].toDouble(),
                  totalKmRidden: bikeData['totalKmRidden'].toDouble(),
                  riddenSincePurchased:
                      bikeData['riddenSincePurchased'].toDouble(),
                  riddenWithLastRefill:
                      bikeData['riddenWithLastRefill'].toDouble(),
                  fuelConsumptions:
                      bikeData['fuelConsumptions'] as List<FuelConsumption>));
        });
        _myBikes = loadedBikeDatas;
      }
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }

  Future<void> setAsFavorite(BikeData bike) async {
    final url = Uri.parse(
        'https://motobox-eedda-default-rtdb.europe-west1.firebasedatabase.app/my_bikes.json');
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      final List<BikeData> loadedBikeDatas = [];
      if (extractedData == null || extractedData.isEmpty) {
        _myBikes = [];
      } else {
        extractedData.forEach((bikeID, bikeData) {
          loadedBikeDatas.insert(
              0,
              BikeData(
                  id: bikeID,
                  isSelected: bikeData['isSelected'],
                  model: bikeData['model'],
                  costs: bikeData['costs'].toDouble(),
                  totalKmRidden: bikeData['totalKmRidden'].toDouble(),
                  riddenSincePurchased:
                      bikeData['riddenSincePurchased'].toDouble(),
                  riddenWithLastRefill:
                      bikeData['riddenWithLastRefill'].toDouble(),
                  fuelConsumptions:
                      bikeData['fuelConsumptions'] as List<FuelConsumption>));
        });
        _myBikes = loadedBikeDatas;
      }
      _myBikes.forEach(((element) {
        if (bike.id == element.id) {
          element.isSelected = true;
          updateBike(element.id, element);
        } else {
          element.isSelected = false;
          updateBike(element.id, element);
        }
      }));
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }

  Future<void> addBike(BikeData bike) async {
    final url = Uri.parse(
        'https://motobox-eedda-default-rtdb.europe-west1.firebasedatabase.app/my_bikes.json');
    try {
      final response = await http.post(url,
          body: json.encode({
            //'id': bike.id,
            'isSelected': bike.isSelected,
            'model': bike.model,
            'costs': bike.costs,
            'totalKmRidden': bike.totalKmRidden,
            'riddenSincePurchased': bike.riddenSincePurchased,
            'riddenWithLastRefill': bike.riddenWithLastRefill,
            'fuelConsumptions': bike.fuelConsumptions
          }));
      final newBike = BikeData(
          id: json.decode(response.body)['name'],
          isSelected: bike.isSelected,
          model: bike.model,
          costs: bike.costs,
          totalKmRidden: bike.totalKmRidden,
          riddenSincePurchased: bike.riddenSincePurchased,
          riddenWithLastRefill: bike.riddenWithLastRefill,
          fuelConsumptions: bike.fuelConsumptions);
      //_myBikes.add(newFc); // at the end of list
      _myBikes.insert(0, newBike); // at the begining of list
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }

  Future<void> updateBike(String id, BikeData newBike) async {
    final bikeDataIndex = _myBikes.indexWhere((fc) => newBike.id == id);
    if (bikeDataIndex >= 0) {
      final url = Uri.parse(
          'https://motobox-eedda-default-rtdb.europe-west1.firebasedatabase.app/my_bikes/$id.json');
      try {
        await http.patch(url,
            body: json.encode({
              'isSelected': newBike.isSelected,
              'model': newBike.model,
              'costs': newBike.costs,
              'totalKmRidden': newBike.totalKmRidden,
              'riddenSincePurchased': newBike.riddenSincePurchased,
              'riddenWithLastRefill': newBike.riddenWithLastRefill,
              'fuelConsumptions': newBike.fuelConsumptions
            }));
        _myBikes[bikeDataIndex] = newBike;
        notifyListeners();
      } catch (error) {
        rethrow;
      }
    } else {
      print('...');
    }
  }

  Future<void> deleteBike(String id) async {
    final url = Uri.parse(
        'https://motobox-eedda-default-rtdb.europe-west1.firebasedatabase.app/my_bikes/$id.json');
    final existingBDIndex = _myBikes.indexWhere((fc) => fc.id == id);
    BikeData? existingBD = _myBikes[existingBDIndex];
    _myBikes.removeAt(existingBDIndex);
    final response = await http.delete(url);
    if (response.statusCode >= 400) {
      _myBikes.insert(
          existingBDIndex, // ensure to re-insert the instance if deleting fail
          existingBD);
      notifyListeners();
      throw HttpException('Could not delete Bike...');
    }
    existingBD = null;
  }
}
