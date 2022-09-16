// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../providers/invoice.dart';

class InvoiceItem extends StatelessWidget {
  const InvoiceItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final invoice = Provider.of<Invoice>(context, listen: false);
    return ListTile(
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
        '${invoice.title}   Total: ${invoice.price.toString()}€',
        style: TextStyle(color: Theme.of(context).textTheme.labelSmall?.color),
      ),
      //trailing: Icon(Icons.more_vert),
      isThreeLine: true,
    );
  }
}
