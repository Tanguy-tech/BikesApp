import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../providers/invoice.dart';

class InvoiceItem extends StatelessWidget {
  const InvoiceItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final invoice = Provider.of<Invoice>(context, listen: false);
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      color: Theme.of(context).colorScheme.primary,
      child: ListTile(
        minLeadingWidth: 0,
        leading: const SizedBox(
            height: double.infinity,
            child: Icon(Icons.receipt, color: Colors.white)),
        title: Text(
          DateFormat('dd.MM.yy').format(invoice.date),
          textAlign: TextAlign.left,
          style: const TextStyle(fontSize: 14),
        ),
        subtitle: Text(
          '${invoice.title}\nTotal: ${invoice.price.toString()}€',
          style:
              TextStyle(color: Theme.of(context).textTheme.labelSmall?.color),
        ),
        //trailing: Icon(Icons.more_vert),
        isThreeLine: true,
      ),
    );
  }
}
