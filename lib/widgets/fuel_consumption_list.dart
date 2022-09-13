import 'package:flutter/material.dart';
import 'package:motobox/widgets/fuel_consumption_item.dart';
import 'package:motobox/providers/fuel_consumptions.dart';
import 'package:provider/provider.dart';

class FuelConsumptionList extends StatefulWidget {
  const FuelConsumptionList({Key? key}) : super(key: key);

  @override
  State<FuelConsumptionList> createState() => _FuelConsumptionListState();
}

class _FuelConsumptionListState extends State<FuelConsumptionList> {
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
