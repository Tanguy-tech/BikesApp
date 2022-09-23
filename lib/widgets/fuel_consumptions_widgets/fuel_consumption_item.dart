// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:motobox/providers/my_bikes.dart';
import 'package:motobox/screens/fuel_consumptions_screens/fuel_consumption_form_screen.dart';
import 'package:provider/provider.dart';

import '../../providers/fuel_consumption.dart';

class FuelCosumptionItem extends StatelessWidget {
  bool fullView;
  FuelCosumptionItem(this.fullView, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final fuelConsumption =
        Provider.of<FuelConsumption>(context, listen: false);
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(FuelConsrumptionFormScreen.routeName,
            arguments: fuelConsumption.id);
      },
      child: ListTile(
        minLeadingWidth: 0,
        leading: SizedBox(
            height: double.infinity,
            child: Icon(Icons.oil_barrel,
                color: Theme.of(context).colorScheme.secondary)),
        title: Text(
          DateFormat('dd.MM.yy').format(fuelConsumption.date),
          textAlign: TextAlign.left,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        subtitle: fullView
            ? Text(
                '${fuelConsumption.pricePerLitter.toStringAsFixed(3)}€/L\n${fuelConsumption.volume.toStringAsFixed(3)}L\n',
                style: Theme.of(context).textTheme.bodyMedium,
              )
            : Text(
                '${fuelConsumption.fuelType}\n${fuelConsumption.price.toStringAsFixed(2)}€',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
        trailing: fullView
            ? Text(
                '${fuelConsumption.fuelType}\n\n${fuelConsumption.price.toStringAsFixed(2)}€',
                style: Theme.of(context).textTheme.titleSmall,
                textAlign: TextAlign.right,
              )
            : null,
        isThreeLine: true,
      ),
    );
  }
}
