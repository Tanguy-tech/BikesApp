import 'package:flutter/material.dart';
import 'package:motobox/providers/fuel_consumptions.dart';
import 'package:provider/provider.dart';

class FuelConsumptionSummary extends StatefulWidget {
  const FuelConsumptionSummary({Key? key}) : super(key: key);

  @override
  State<FuelConsumptionSummary> createState() => _FuelConsumptionSummaryState();
}

class _FuelConsumptionSummaryState extends State<FuelConsumptionSummary> {
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<FuelConsumptions>(context).consumptions;
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
    return Container(
      height: 100,
      //color: Colors.pink,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Total fuel costs: $totalCosts€'),
            Text('Most expensive refill: $mostExpensive€'),
          ],
        ),
      ),
    );
  }
}
