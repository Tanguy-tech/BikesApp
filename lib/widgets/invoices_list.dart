import 'package:flutter/material.dart';
import 'package:motobox/widgets/invoice_item.dart';
import 'package:provider/provider.dart';

import '../providers/invoices.dart';

class InvoicesList extends StatefulWidget {
  const InvoicesList({Key? key}) : super(key: key);

  @override
  State<InvoicesList> createState() => _InvoicesListState();
}

class _InvoicesListState extends State<InvoicesList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Invoices>(builder: (__, model, _) {
      return ListView.builder(
        itemCount: model.invoices.length,
        itemBuilder: (context, i) => Card(
          elevation: 5,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: InvoiceItem(
            model.invoices[i].id,
            model.invoices[i].title,
            model.invoices[i].price,
            model.invoices[i].date,
            model.invoices[i].photo,
          ),
        ),
      );
    });
  }
}
