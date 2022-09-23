import 'package:flutter/material.dart';
import 'package:motobox/providers/bike_data.dart';
import 'package:motobox/providers/my_bikes.dart';
import 'package:provider/provider.dart';

import 'bike_data_field.dart';

class BikesDataItems extends StatefulWidget {
  BoxConstraints constraints;
  BikesDataItems(
    this.constraints, {
    Key? key,
    required this.bikeData,
  }) : super(key: key);

  final List<BikeData> bikeData;

  @override
  State<BikesDataItems> createState() => _BikesDataItemsState();
}

class _BikesDataItemsState extends State<BikesDataItems> {
  @override
  Widget build(BuildContext context) {
    final bike = Provider.of<BikeData>(context, listen: false);
    final myBikes = Provider.of<MyBikes>(context, listen: false);
    return Container(
      height: 50,
      width: widget.constraints.maxWidth,
      decoration: BoxDecoration(
        border: Border.all(
            color: Theme.of(context).colorScheme.secondary.withAlpha(30)),
        color: Theme.of(context).colorScheme.background,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Transform.scale(
                  scale: .7,
                  child: Checkbox(
                      checkColor: Theme.of(context).appBarTheme.backgroundColor,
                      activeColor:
                          Theme.of(context).appBarTheme.foregroundColor,
                      shape: const CircleBorder(),
                      value: bike.isSelected,
                      onChanged: (bool? value) {
                        setState(() {
                          bike.isSelected = value!;
                          myBikes.setAsFavorite(bike);
                        });
                      }),
                ),
                BikeDataField(bike.model),
                Text('current cost :${bike.costs.toStringAsFixed(2)}€'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
