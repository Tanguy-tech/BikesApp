// ignore_for_file: prefer_final_fields
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/http_exception.dart';
import 'invoice.dart';
import 'package:http/http.dart' as http;

class Invoices with ChangeNotifier {
  List<Invoice> _invoices = [
    // Invoice(
    //     id: "00",
    //     title: "invoice 00 test",
    //     date: DateTime(2022, 7, 6, 9, 30),
    //     price: 235.78),
    // // photo: Image.asset('assets/invoices/00.png')),
    // Invoice(
    //   id: "01",
    //   title: "invoice 01 test",
    //   date: DateTime(2022, 7, 7, 11, 23),
    //   price: 11.24,
    // ),
    // // photo: Image.asset('assets/invoices/01.png')),
    // Invoice(
    //   id: "02",
    //   title: "invoice 02 test",
    //   date: DateTime(2022, 7, 8, 14, 15),
    //   price: 87.58,
    // ),
    // // photo: Image.asset('assets/invoices/02.png')),
    // Invoice(
    //   id: "03",
    //   title: "invoice 03 test",
    //   date: DateTime(2022, 7, 8, 14, 15),
    //   price: 87.58,
    // ),
    // // photo: Image.asset('assets/invoices/02.png')),
    // Invoice(
    //   id: "04",
    //   title: "invoice 04 test",
    //   date: DateTime(2022, 7, 8, 14, 15),
    //   price: 87.58,
    // ),
    // // photo: Image.asset('assets/invoices/02.png')),
    // Invoice(
    //   id: "05",
    //   title: "invoice 05 test",
    //   date: DateTime(2022, 7, 8, 14, 15),
    //   price: 87.58,
    // ),
    // photo: Image.asset('assets/invoices/02.png'))
  ];

  List<Invoice> get invoices {
    return [..._invoices];
  }

  Future<void> fetchAndSetInvoices() async {
    final url = Uri.parse(
        'https://motobox-eedda-default-rtdb.europe-west1.firebasedatabase.app/invoices.json');
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      final List<Invoice> loadedFuelConsumptions = [];
      extractedData.forEach((fcID, fcDATA) {
        loadedFuelConsumptions.insert(
            0,
            Invoice(
              id: fcID,
              title: fcDATA['fuelType'],
              date: DateFormat('dd.MM.yy').parse(fcDATA['date']),
              price: fcDATA['price'],
            ));
      });
      _invoices = loadedFuelConsumptions;
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }

  Future<void> addInvoice(Invoice inv) async {
    final url = Uri.parse(
        'https://motobox-eedda-default-rtdb.europe-west1.firebasedatabase.app/invoices.json');
    try {
      final response = await http.post(url,
          body: json.encode({
            'title': inv.title,
            'date': DateFormat('dd.MM.yy').format(inv.date),
            'price': inv.price,
            //'photo': inv.photo,
          }));
      final newInv = Invoice(
          id: json.decode(response.body)['name'],
          title: inv.title,
          date: inv.date,
          price: inv.price);
      //photo: inv.photo);
      //_invoices.add(newInv);
      _invoices.insert(0, newInv);
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }

  Future<void> deleteInvoice(String id) async {
    final url = Uri.parse(
        'https://motobox-eedda-default-rtdb.europe-west1.firebasedatabase.app/invoices/$id.json');
    final existingFcIndex = _invoices.indexWhere((fc) => fc.id == id);
    Invoice? existingFc = _invoices[existingFcIndex];
    _invoices.removeAt(existingFcIndex);
    final response = await http.delete(url);
    if (response.statusCode >= 400) {
      _invoices.insert(
          existingFcIndex, // ensure to re-insert the instance if deleting fail
          existingFc);
      notifyListeners();
      throw HttpException('Could not delete FuelConsumption item..');
    }
    existingFc = null;
  }
}
