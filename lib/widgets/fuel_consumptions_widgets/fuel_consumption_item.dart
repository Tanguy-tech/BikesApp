// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../providers/fuel_consumption.dart';

class FuelCosumptionItem extends StatelessWidget {
  const FuelCosumptionItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final fuelConsumption =
        Provider.of<FuelConsumption>(context, listen: false);
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      color: Theme.of(context).colorScheme.secondary,
      child: ListTile(
        minLeadingWidth: 0,
        leading: const SizedBox(
            height: double.infinity,
            child: Icon(Icons.oil_barrel, color: Colors.white)),
        title: Text(
          '${DateFormat('dd.MM.yy').format(fuelConsumption.date)}     ${fuelConsumption.fuelType}',
          textAlign: TextAlign.left,
          style: const TextStyle(fontSize: 14),
        ),
        subtitle: Text(
            '${fuelConsumption.pricePerLitter.toString()}€/L ${fuelConsumption.volume.toString()}L Total: ${fuelConsumption.price.toString()}€'),
        //trailing: Icon(Icons.more_vert),
        isThreeLine: true,
      ),
    );
  }
}
