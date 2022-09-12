import 'package:flutter/material.dart';
import 'package:motobox/widgets/invoice_item.dart';
import 'package:provider/provider.dart';
import '../providers/invoices.dart';

class InvoicesList extends StatefulWidget {
  InvoicesList({Key? key}) : super(key: key);

  @override
  State<InvoicesList> createState() => _InvoicesListState();
}

class _InvoicesListState extends State<InvoicesList> {
  @override
  Widget build(BuildContext context) {
    final invData = Provider.of<Invoices>(context, listen: false);
    final invoices = invData.invoices;
    return ListView.builder(
      itemCount: invoices.length,
      itemBuilder: (context, i) => Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: InvoiceItem(
          invoices[i].id,
          invoices[i].title,
          invoices[i].price,
          invoices[i].date,
          invoices[i].photo,
        ),
      ),
    );
  }
}
