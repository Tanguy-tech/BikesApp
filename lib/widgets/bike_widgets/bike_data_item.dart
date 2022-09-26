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
    return Container(
      height: 150,
      width: constraints.maxWidth,
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).colorScheme.background),
        color: Theme.of(context).colorScheme.background,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BikeDataField(
                    "Total costs : ${bike.costs.toStringAsFixed(2)}€"),
                Container(
                    padding: const EdgeInsets.only(top: 10, right: 15),
                    child: Text(
                      bike.model,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.tertiary),
                    )),
              ],
            ),
            BikeDataField(
                "Total KM ridden : ${bike.totalKmRidden.toStringAsFixed(2)} km"),
            BikeDataField(
                "Ridden since Purchased : ${bike.riddenSincePurchased.toStringAsFixed(2)} km"),
            BikeDataField(
                "Ridden with last refuel : ${bike.riddenWithLastRefill.toStringAsFixed(2)} km"),
          ],
        ),
      ),
    );
  }
}
