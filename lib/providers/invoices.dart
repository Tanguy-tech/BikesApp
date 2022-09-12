import 'package:flutter/material.dart';

import 'invoice.dart';

class Invoices with ChangeNotifier {
  List<Invoice> invoices = [
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
        id: "02",
        title: "invoice 02 test",
        date: DateTime(2022, 7, 8, 14, 15),
        price: 87.58,
        photo: Image.asset('assets/invoices/02.png')),
    Invoice(
        id: "02",
        title: "invoice 02 test",
        date: DateTime(2022, 7, 8, 14, 15),
        price: 87.58,
        photo: Image.asset('assets/invoices/02.png')),
    Invoice(
        id: "02",
        title: "invoice 02 test",
        date: DateTime(2022, 7, 8, 14, 15),
        price: 87.58,
        photo: Image.asset('assets/invoices/02.png'))
  ];
}
