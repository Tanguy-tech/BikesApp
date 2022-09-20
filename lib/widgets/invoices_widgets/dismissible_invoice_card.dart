import 'package:flutter/material.dart';
import 'package:motobox/screens/invoices_screens/invoice_form_screen.dart';
import 'package:provider/provider.dart';

import '../../providers/invoice.dart';
import '../../providers/invoices.dart';

// ignore: must_be_immutable
class DismissibleInvoiceCard extends StatelessWidget {
  Widget? children;
  String id;
  final bool _isPreview;
  DismissibleInvoiceCard(this.children, this.id, this._isPreview, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final invData = Provider.of<Invoice>(context);
    final scaffold = ScaffoldMessenger.of(context);
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      color: Theme.of(context).colorScheme.primary,
      child: Dismissible(
        onDismissed: (direction) async {
          try {
            await Provider.of<Invoices>(context, listen: false)
                .deleteInvoice(id);
          } catch (error) {
            scaffold.showSnackBar(const SnackBar(
              content: Text(
                'Deleting Failed...',
                textAlign: TextAlign.center,
              ),
            ));
          }
        },
        key: UniqueKey(),
        background: Container(
          padding: const EdgeInsets.only(left: 10),
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 223, 30, 16),
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          child: Row(
            children: [
              Icon(Icons.delete,
                  color: Theme.of(context).textTheme.titleLarge?.color),
              Text(
                'Delete',
                style: TextStyle(
                    color: Theme.of(context).textTheme.titleLarge?.color),
              ),
            ],
          ),
        ),
        secondaryBackground: Container(
          padding: const EdgeInsets.only(left: 105),
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 223, 30, 16),
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          child: Row(
            children: [
              Icon(Icons.delete,
                  color: Theme.of(context).textTheme.titleLarge?.color),
              Text(
                'Delete',
                style: TextStyle(
                    color: Theme.of(context).textTheme.titleLarge?.color),
              ),
            ],
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: const BorderRadius.all(Radius.circular(10))),
          child: children,
        ),
      ),
    );
  }
}
