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
      height: 180,
      width: constraints.maxWidth,
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).colorScheme.background),
        color: Theme.of(context).colorScheme.background,
        // borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                width: constraints.maxWidth * 0.95,
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(
                  textAlign: TextAlign.right,
                  bike.model,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.tertiary),
                )),
            BikeDataField("Total costs : ${bike.costs.toStringAsFixed(2)}€"),
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
