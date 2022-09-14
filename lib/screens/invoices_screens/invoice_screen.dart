import 'package:flutter/material.dart';
import 'package:motobox/providers/invoices.dart';
import 'package:motobox/providers/theme_provider.dart';
import 'package:provider/provider.dart';
import '../../widgets/app_widgets/main_drawer.dart';
import '../../widgets/invoices_widgets/invoices_list.dart';

class InvoiceScreen extends StatefulWidget {
  const InvoiceScreen({Key? key}) : super(key: key);

  static const routeName = "/invoices";

  @override
  State<InvoiceScreen> createState() => _InvoiceScreenState();
}

class _InvoiceScreenState extends State<InvoiceScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<AppTheme>(context);
    return ChangeNotifierProvider(
      create: (_) => Invoices(),
      builder: (context, child) => Scaffold(
        appBar: AppBar(
          title: const Text("My invoices"),
          actions: [
            Switch(
                onChanged: (value) => theme.toogleTheme(context),
                value: theme.sw)
          ],
        ),
        drawer: const MainDrawer(),
        body: const Center(child: InvoicesList()),
      ),
    );
  }
}
