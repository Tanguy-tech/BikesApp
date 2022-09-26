// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:motobox/screens/invoices_screens/invoice_form_screen.dart';
import 'package:provider/provider.dart';
import '../../providers/invoice.dart';

class InvoiceItem extends StatelessWidget {
  bool fullView;
  InvoiceItem(this.fullView, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final invoice = Provider.of<Invoice>(context, listen: false);
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .pushNamed(InvoiceFormScreen.routeName, arguments: invoice.id);
      },
      child: ListTile(
        minLeadingWidth: 0,
        leading: SizedBox(
            height: double.infinity,
            child: Icon(Icons.receipt,
                color: fullView
                    ? Theme.of(context).colorScheme.tertiary
                    : Theme.of(context).colorScheme.secondary)),
        title: Text(
          DateFormat('dd.MM.yy').format(invoice.date),
          textAlign: TextAlign.left,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        subtitle: fullView
            ? const Text('')
            : Text(
                '${invoice.title}\n${invoice.price.toString()}€',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
        trailing: fullView
            ? Text(
                '${invoice.title}\n\n${invoice.price.toString()}€',
                style: Theme.of(context).textTheme.titleSmall,
                textAlign: TextAlign.right,
              )
            : null,
        isThreeLine: true,
      ),
    );
  }
}
