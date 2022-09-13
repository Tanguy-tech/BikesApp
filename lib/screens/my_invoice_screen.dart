import 'package:flutter/material.dart';
import 'package:motobox/providers/theme_provider.dart';
import 'package:motobox/widgets/invoices_list.dart';
import 'package:motobox/widgets/main_drawer.dart';
import 'package:provider/provider.dart';

class InvoiceScreen extends StatelessWidget {
  const InvoiceScreen({Key? key}) : super(key: key);

  static const routeName = "/invoices";

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<AppTheme>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Invoices"),
        actions: [
          Switch(
              onChanged: (value) => theme.toogleTheme(context), value: theme.sw)
        ],
      ),
      drawer: const MainDrawer(),
      body: const InvoicesList(),
    );
  }
}
