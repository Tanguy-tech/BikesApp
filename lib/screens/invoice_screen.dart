import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class InvoiceScreen extends StatefulWidget {
  const InvoiceScreen({Key? key}) : super(key: key);

  static const routeName = "/invoices";

  @override
  State<InvoiceScreen> createState() => _InvoiceScreenState();
}

class _InvoiceScreenState extends State<InvoiceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My invoices")),
      drawer: const MainDrawer(),
      body: const Center(child: Text("This is my invoices screen")),
    );
  }
}
