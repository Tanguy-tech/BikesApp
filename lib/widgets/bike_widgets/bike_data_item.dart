import 'package:flutter/material.dart';
import 'package:motobox/providers/bike_data.dart';

import 'bike_data_field.dart';

class BikeDataItem extends StatelessWidget {
  BoxConstraints constraints;
  BikeDataItem(
    this.constraints, {
    Key? key,
    required this.bikeData,
  }) : super(key: key);

  final List<BikeData> bikeData;

  @override
  Widget build(BuildContext context) {
    final bike = bikeData.firstWhere((element) => element.isSelected == true);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            width: constraints.maxWidth * .95,
            padding: const EdgeInsets.only(bottom: 20, top: 20),
            child: Text(
              textAlign: TextAlign.right,
              bike.model,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.tertiary),
            )),
        Card(
          elevation: 5,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          color: Theme.of(context).colorScheme.primary,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BikeDataField("Costs : ${bike.costs.toStringAsFixed(2)}€"),
                BikeDataField(
                    "KM ridden : ${bike.totalKmRidden.toStringAsFixed(2)} km"),
                BikeDataField(
                    "RSP : ${bike.riddenSincePurchased.toStringAsFixed(2)} km"),
                BikeDataField(
                    "RWLR : ${bike.riddenWithLastRefill.toStringAsFixed(2)} km"),
              ],
            ),
          ),
        ),
        // ),
      ],
    );
  }
}
