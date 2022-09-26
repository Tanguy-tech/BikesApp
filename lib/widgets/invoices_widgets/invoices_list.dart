import 'package:flutter/material.dart';
import 'package:motobox/widgets/app_widgets/lists_skeleton_cards.dart';
import 'package:motobox/widgets/invoices_widgets/dismissible_invoice_card.dart';
import 'package:provider/provider.dart';
import '../../providers/invoices.dart';
import 'invoice_item.dart';
import 'invoice_summary.dart';

class InvoicesList extends StatefulWidget {
  final bool isPreview;
  const InvoicesList({Key? key, required this.isPreview}) : super(key: key);

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
        Future.delayed(const Duration(milliseconds: 50), () {
          setState(() {
            _isLoading = false;
          });
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
    return _isLoading
        ? const Center(
            child: ListSkeletonCards(),
          )
        : RefreshIndicator(
            onRefresh: () => _refreshData(context),
            child: widget.isPreview
                ? ListView.builder(
                    padding: const EdgeInsets.only(left: 10),
                    itemCount: invoices.length,
                    itemBuilder: (context, i) => ChangeNotifierProvider.value(
                      value: invoices[i],
                      child: DismissibleInvoiceCard(
                          InvoiceItem(false), invoices[i].id, widget.isPreview),
                    ),
                  )
                : Column(
                    children: [
                      const InvoiceSummary(),
                      ListView.builder(
                        padding: const EdgeInsets.only(left: 10),
                        shrinkWrap: true,
                        itemCount: invoices.length,
                        itemBuilder: (context, i) =>
                            ChangeNotifierProvider.value(
                          value: invoices[i],
                          child: DismissibleInvoiceCard(InvoiceItem(true),
                              invoices[i].id, widget.isPreview),
                        ),
                      )
                    ],
                  ),
          );
  }
}
