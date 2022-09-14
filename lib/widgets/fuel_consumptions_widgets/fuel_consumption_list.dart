import 'package:flutter/material.dart';
import './fuel_consumption_item.dart';
import 'package:motobox/providers/fuel_consumptions.dart';
import 'package:provider/provider.dart';

class FuelConsumptionList extends StatelessWidget {
  const FuelConsumptionList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final fcData = Provider.of<FuelConsumptions>(context);
    final fuelConsumptions = fcData.consumptions;
    return ListView.builder(
      itemCount: fuelConsumptions.length,
      itemBuilder: (context, i) => ChangeNotifierProvider.value(
        value: fuelConsumptions[i],
        child: const FuelCosumptionItem(),
      ),
    );
  }
}
