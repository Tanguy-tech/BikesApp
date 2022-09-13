// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';

import 'invoice.dart';

class Invoices with ChangeNotifier {
  List<Invoice> _invoices = [
    Invoice(
        id: "00",
        title: "invoice 00 test",
        date: DateTime(2022, 7, 6, 9, 30),
        price: 235.78,
        photo: Image.asset('assets/invoices/00.png')),
    Invoice(
        id: "01",
        title: "invoice 01 test",
        date: DateTime(2022, 7, 7, 11, 23),
        price: 11.24,
        photo: Image.asset('assets/invoices/01.png')),
    Invoice(
        id: "02",
        title: "invoice 02 test",
        date: DateTime(2022, 7, 8, 14, 15),
        price: 87.58,
        photo: Image.asset('assets/invoices/02.png')),
    Invoice(
        id: "03",
        title: "invoice 03 test",
        date: DateTime(2022, 7, 8, 14, 15),
        price: 87.58,
        photo: Image.asset('assets/invoices/02.png')),
    Invoice(
        id: "04",
        title: "invoice 04 test",
        date: DateTime(2022, 7, 8, 14, 15),
        price: 87.58,
        photo: Image.asset('assets/invoices/02.png')),
    Invoice(
        id: "05",
        title: "invoice 05 test",
        date: DateTime(2022, 7, 8, 14, 15),
        price: 87.58,
        photo: Image.asset('assets/invoices/02.png'))
  ];

  List<Invoice> get invoices {
    return [..._invoices];
  }

  void addInvoice(Invoice inv) {
    final newInv = Invoice(
        id: inv.id,
        title: inv.title,
        date: inv.date,
        price: inv.price,
        photo: inv.photo);
    //_invoices.add(newInv);
    _invoices.insert(0, newInv);
    notifyListeners();
  }
}
