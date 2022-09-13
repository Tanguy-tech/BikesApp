import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/theme_provider.dart';
import '../widgets/invoice_form.dart';

class InvoiceFormScreen extends StatelessWidget {
  const InvoiceFormScreen({Key? key}) : super(key: key);

  static const routeName = '/invoiceFormScreen';

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<AppTheme>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add an invoice'),
        actions: [
          Switch(
              onChanged: (value) => theme.toogleTheme(context), value: theme.sw)
        ],
      ),
      body: const InvoiceForm(),
    );
  }
}
