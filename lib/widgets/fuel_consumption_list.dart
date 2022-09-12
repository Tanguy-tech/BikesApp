import 'package:flutter/material.dart';
import 'package:motobox/widgets/fuel_consumption_item.dart';
import 'package:motobox/providers/fuel_consumptions.dart';
import 'package:provider/provider.dart';

class FuelConsumptionList extends StatefulWidget {
  FuelConsumptionList({Key? key}) : super(key: key);

  @override
  State<FuelConsumptionList> createState() => _FuelConsumptionListState();
}

class _FuelConsumptionListState extends State<FuelConsumptionList> {
  @override
  Widget build(BuildContext context) {
    final fcData = Provider.of<FuelConsumptions>(context, listen: false);
    final fuelConsumptions = fcData.fuelConsumptions;
    return ListView.builder(
      itemCount: fuelConsumptions.length,
      itemBuilder: (context, i) => Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: FuelCosumptionItem(
          fuelConsumptions[i].id,
          fuelConsumptions[i].fuelType,
          fuelConsumptions[i].price,
          fuelConsumptions[i].date,
          fuelConsumptions[i].pricePerLitter,
          fuelConsumptions[i].volume,
          fuelConsumptions[i].dashKm,
        ),
      ),
    );
  }
}
