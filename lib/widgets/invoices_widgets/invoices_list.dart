import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/invoices.dart';
import 'invoice_item.dart';

class InvoicesList extends StatelessWidget {
  const InvoicesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final invData = Provider.of<Invoices>(context);
    final invoices = invData.invoices;
    return ListView.builder(
      itemCount: invoices.length,
      itemBuilder: (context, i) => ChangeNotifierProvider.value(
        value: invoices[i],
        child: const InvoiceItem(),
      ),
    );
  }
}
