import 'package:flutter/material.dart';
import 'package:motobox/widgets/invoice_item.dart';
import 'package:provider/provider.dart';

import '../providers/invoices.dart';

class InvoicesList extends StatelessWidget {
  const InvoicesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final invoiceData = Provider.of<Invoices>(context);
    return ListView.builder(
        itemCount: invoiceData.invoices.length,
        itemBuilder: (context, i) => Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: InvoiceItem(
                invoiceData.invoices[i].id,
                invoiceData.invoices[i].title,
                invoiceData.invoices[i].price,
                invoiceData.invoices[i].date,
                invoiceData.invoices[i].photo,
              ),
            ));
  }
}
