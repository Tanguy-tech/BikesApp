import 'package:flutter/material.dart';
import 'package:motobox/providers/invoices.dart';
import 'package:provider/provider.dart';

class InvoiceSummary extends StatefulWidget {
  const InvoiceSummary({Key? key}) : super(key: key);

  @override
  State<InvoiceSummary> createState() => _InvoiceSummaryState();
}

class _InvoiceSummaryState extends State<InvoiceSummary> {
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<Invoices>(context).invoices;
    double totalCosts = 0;
    double mostExpensive = 0;
    for (var element in data) {
      {
        totalCosts += element.price;
        if (mostExpensive < element.price) {
          mostExpensive = element.price;
        }
      }
    }
    return SizedBox(
      height: 100,
      //color: Colors.pink,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Total fuel costs: $totalCosts€',
                style: Theme.of(context).textTheme.titleSmall),
            Text('Most expensive refill: $mostExpensive€',
                style: Theme.of(context).textTheme.titleSmall),
          ],
        ),
      ),
    );
  }
}
