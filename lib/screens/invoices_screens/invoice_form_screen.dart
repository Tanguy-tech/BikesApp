import 'package:flutter/cupertino.dart';
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
      backgroundColor: theme.myTheme.colorScheme.background,
      appBar: CupertinoNavigationBar(
          padding: const EdgeInsetsDirectional.all(0),
          leading: CupertinoNavigationBarBackButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              color: Theme.of(context).appBarTheme.titleTextStyle?.color),
          middle: Text(
            'Add an invoice',
            style: Theme.of(context).appBarTheme.titleTextStyle,
          ),
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor),
      body: const InvoiceForm(),
    );
  }
}
