import 'package:flutter/material.dart';
import 'package:motobox/providers/invoices.dart';
import 'package:motobox/widgets/invoices_list.dart';
import 'package:motobox/widgets/main_drawer.dart';
import 'package:provider/provider.dart';

class InvoiceScreen extends StatefulWidget {
  const InvoiceScreen({Key? key}) : super(key: key);

  static const routeName = "/invoices";

  @override
  State<InvoiceScreen> createState() => _InvoiceScreenState();
}

class _InvoiceScreenState extends State<InvoiceScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => Invoices(),
      builder: (context, child) => Scaffold(
        appBar: AppBar(
          title: const Text("My invoices"),
        ),
        drawer: const MainDrawer(),
        body: const Center(child: InvoicesList()),
      ),
    );
  }
}
