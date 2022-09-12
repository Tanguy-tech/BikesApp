import 'package:flutter/material.dart';
import 'package:motobox/widgets/fuel_consumption_item.dart';
import 'package:motobox/providers/fuel_consumptions.dart';
import 'package:provider/provider.dart';

class FuelConsumptionList extends StatelessWidget {
  const FuelConsumptionList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final fcData = Provider.of<FuelConsumptions>(context);
    return ListView.builder(
      itemCount: fcData.fuelConsumptions.length,
      itemBuilder: (context, i) => Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: FuelCosumptionItem(
            fcData.fuelConsumptions[i].id,
            fcData.fuelConsumptions[i].fuelType,
            fcData.fuelConsumptions[i].price,
            fcData.fuelConsumptions[i].date,
            fcData.fuelConsumptions[i].pricePerLitter,
            fcData.fuelConsumptions[i].volume,
            fcData.fuelConsumptions[i].dashKm),
      ),
    );
  }
}
