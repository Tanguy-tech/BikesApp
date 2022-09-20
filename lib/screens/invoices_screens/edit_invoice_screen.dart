import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/theme_provider.dart';

class EditInvoiceScreen extends StatelessWidget {
  const EditInvoiceScreen({Key? key}) : super(key: key);

  static const routeName = "/editInvoice";

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<AppTheme>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("My fuel consumption"),
        actions: [
          Switch(
              onChanged: (value) => theme.toogleTheme(context), value: theme.sw)
        ],
      ),
    );
  }
}
