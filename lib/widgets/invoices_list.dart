import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:meals_app/data/invoices.dart';
import 'package:meals_app/widgets/invoice_item.dart';

class InvoicesList extends StatelessWidget {
  const InvoicesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
        // padding: const EdgeInsets.all(10),
        children: INVOICES
            .map((inv) => Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: InvoiceItem(
                    id: inv.id,
                    date: inv.date,
                    title: inv.title,
                    price: inv.price,
                    photo: inv.photo,
                  ),
                ))
            .toList());
  }
}
