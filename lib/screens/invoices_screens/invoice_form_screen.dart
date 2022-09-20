import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/theme_provider.dart';
import '../../widgets/invoices_widgets/invoice_form.dart';

class InvoiceFormScreen extends StatelessWidget {
  const InvoiceFormScreen({Key? key}) : super(key: key);

  static const routeName = '/invoiceFormScreen';

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<AppTheme>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add an invoice'),
      ),
      body: const InvoiceForm(),
    );
  }
}
