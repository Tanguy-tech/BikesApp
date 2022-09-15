import 'package:flutter/material.dart';
import 'package:motobox/widgets/invoices_widgets/dismissible_invoice_card.dart';
import 'package:provider/provider.dart';
import '../../providers/invoices.dart';
import 'invoice_item.dart';

class InvoicesList extends StatefulWidget {
  const InvoicesList({Key? key}) : super(key: key);

  @override
  State<InvoicesList> createState() => _InvoicesListState();
}

class _InvoicesListState extends State<InvoicesList> {
  var _isInit = true;
  var _isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<Invoices>(context).fetchAndSetInvoices().then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  Future<void> _refreshData(BuildContext ctx) async {
    await Provider.of<Invoices>(ctx, listen: false).fetchAndSetInvoices();
  }

  @override
  Widget build(BuildContext context) {
    final invData = Provider.of<Invoices>(context);
    final invoices = invData.invoices;
    return RefreshIndicator(
      onRefresh: () => _refreshData(context),
      child: ListView.builder(
        itemCount: invoices.length,
        itemBuilder: (context, i) => ChangeNotifierProvider.value(
          value: invoices[i],
          child: _isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : DismissibleInvoiceCard(const InvoiceItem(), invoices[i].id),
        ),
      ),
    );
  }
}
