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
    return Consumer<FuelConsumptions>(builder: (__, model, _) {
      return ListView.builder(
        itemCount: fcData.fuelConsumptions.length,
        itemBuilder: (context, i) => Card(
          elevation: 5,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: FuelCosumptionItem(
              model.fuelConsumptions[i].id,
              model.fuelConsumptions[i].fuelType,
              model.fuelConsumptions[i].price,
              model.fuelConsumptions[i].date,
              model.fuelConsumptions[i].pricePerLitter,
              model.fuelConsumptions[i].volume,
              model.fuelConsumptions[i].dashKm),
        ),
      );
    });
  }
}
