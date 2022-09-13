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
