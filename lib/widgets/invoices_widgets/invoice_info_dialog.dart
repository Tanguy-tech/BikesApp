import 'package:flutter/material.dart';
import 'package:motobox/screens/invoices_screens/invoice_form_screen.dart';
import 'package:provider/provider.dart';

import '../../providers/invoice.dart';

class InvoiceInfoDialog extends StatelessWidget {
  const InvoiceInfoDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final invData = Provider.of<Invoice>(context);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 250, horizontal: 80),
      child: Stack(
        children: [
          Card(
            margin: const EdgeInsets.only(top: 50.0),
            child: SizedBox(
              height: 400.0,
              width: double.infinity,
              child: Center(
                child: ListTile(
                  leading: IconButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed(InvoiceFormScreen.routeName);
                      },
                      icon: const Icon(Icons.edit)),
                  title: Text(
                    '${invData.price}',
                    style: TextStyle(
                        color: Theme.of(context).textTheme.bodyLarge?.color),
                  ),
                  subtitle: const Text('SUBTITLE'),
                ),
              ),
            ),
          ),
          Positioned(
            //top: .0,
            bottom: 170,
            left: .0,
            right: .0,
            child: Center(
              child: CircleAvatar(
                backgroundColor: Theme.of(context).colorScheme.primary,
                radius: 45.0,
                child: Icon(Icons.receipt,
                    color: Theme.of(context).textTheme.titleLarge?.color),
              ),
            ),
          )
        ],
      ),
    );
  }
}
