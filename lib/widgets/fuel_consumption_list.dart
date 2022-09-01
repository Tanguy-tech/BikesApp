import 'package:flutter/material.dart';
import 'package:meals_app/widgets/fuel_consumption_item.dart';
import "package:meals_app/data/fuel_consumption.dart";

class FuelConsumptionList extends StatelessWidget {
  const FuelConsumptionList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
        // padding: const EdgeInsets.all(10),
        children: fuelConsumption
            .map((fc) => Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: FuelCosumptionItem(
                    id: fc.id,
                    date: fc.date,
                    pricePerLitter: fc.pricePerLitter,
                    price: fc.price,
                    volume: fc.volume,
                    dashKM: fc.dashKm,
                    fuelType: fc.fuelType,
                  ),
                ))
            .toList());
  }
}
