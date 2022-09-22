import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:motobox/providers/theme_provider.dart';
import 'package:motobox/screens/invoices_screens/invoice_form_screen.dart';
import 'package:provider/provider.dart';
import '../../widgets/app_widgets/main_drawer.dart';
import '../../widgets/invoices_widgets/invoices_list.dart';

class InvoiceScreen extends StatelessWidget {
  const InvoiceScreen({Key? key}) : super(key: key);

  static const routeName = "/invoices";

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<AppTheme>(context);
    return Scaffold(
      backgroundColor: theme.myTheme.colorScheme.background,
      drawer: const MainDrawer(),
      endDrawerEnableOpenDragGesture: true,
      appBar: CupertinoNavigationBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        leading: Builder(
          builder: (context) {
            return CupertinoButton(
              padding: const EdgeInsets.all(0),
              child: Icon(Icons.menu,
                  color: Theme.of(context).appBarTheme.foregroundColor),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        middle: Text(
          "My invoices",
          style:
              TextStyle(color: Theme.of(context).appBarTheme.foregroundColor),
        ),
      ),
      body: const InvoicesList(isPreview: false),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).backgroundColor,
        onPressed: () {
          Navigator.of(context).pushNamed(InvoiceFormScreen.routeName);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
