import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:motobox/screens/fuel_consumptions_screens/fuel_consumption_form_screen.dart';
import 'package:provider/provider.dart';

import '../../providers/bike_data.dart';
import '../../providers/fuel_consumption.dart';
import '../../providers/fuel_consumptions.dart';
import '../../providers/my_bikes.dart';

// ignore: must_be_immutable
class DismissibleFuelComsumptionCard extends StatelessWidget {
  Widget? children;
  String id;
  final bool _isPreview;
  DismissibleFuelComsumptionCard(this.children, this.id, this._isPreview,
      {Key? key})
      : super(key: key);

  Future<void> _deleteAndUpdate(
      BuildContext context, FuelConsumption fc, BikeData currentBike) async {
    await Provider.of<FuelConsumptions>(context, listen: false)
        .deleteFuelConsumption(id);
    await Provider.of<MyBikes>(context, listen: false).updateBike(
        fc.bikeId,
        BikeData(
            id: currentBike.id,
            isSelected: currentBike.isSelected,
            model: currentBike.model,
            costs: currentBike.costs - fc.price,
            totalKmRidden: currentBike.totalKmRidden - fc.kmRidden,
            riddenSincePurchased:
                currentBike.riddenSincePurchased - fc.kmRidden,
            riddenWithLastRefill: 0));
  }

  @override
  Widget build(BuildContext context) {
    final fc = Provider.of<FuelConsumptions>(context, listen: false)
        .consumptions
        .firstWhere((element) => element.id == id);
    final currentBike = Provider.of<MyBikes>(context, listen: false)
        .bikes
        .firstWhere((element) => element.id == fc.bikeId);
    final scaffold = ScaffoldMessenger.of(context);
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      color: Theme.of(context).colorScheme.primary,
      child: Dismissible(
        confirmDismiss: (direction) {
          return showCupertinoDialog(
              context: context,
              builder: (context) => CupertinoAlertDialog(
                    title: Text(
                      'Delete FuelConsumption',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    content: Text(
                      'Do you really want to delete this fuel consumption? It will automatically update the bike\'s data it is refering',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    actions: <CupertinoDialogAction>[
                      CupertinoDialogAction(
                        child: const Text('No'),
                        onPressed: () {
                          Navigator.of(context).pop(false);
                        },
                      ),
                      CupertinoDialogAction(
                        isDestructiveAction: true,
                        onPressed: () {
                          // _deleteAndUpdate(context, fc, currentBike);
                          Navigator.of(context).pop(true);
                        },
                        child: const Text('Yes'),
                      )
                    ],
                  ));
        },
        onDismissed: (direction) async {
          try {
            _deleteAndUpdate(context, fc, currentBike);
          } catch (error) {
            scaffold.showSnackBar(const SnackBar(
              content: Text(
                'Deleting Failed...',
                textAlign: TextAlign.center,
              ),
            ));
          }
        },
        key: UniqueKey(),
        background: Container(
          padding: const EdgeInsets.only(left: 10),
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 223, 30, 16),
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          child: Row(
            children: [
              Icon(Icons.delete,
                  color: Theme.of(context).textTheme.titleLarge?.color),
              Text(
                'Delete',
                style: TextStyle(
                    color: Theme.of(context).textTheme.titleLarge?.color),
              ),
            ],
          ),
        ),
        secondaryBackground: Container(
          padding: const EdgeInsets.only(left: 105),
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 223, 30, 16),
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          child: Row(
            children: [
              Icon(Icons.delete,
                  color: Theme.of(context).textTheme.titleLarge?.color),
              Text(
                'Delete',
                style: TextStyle(
                    color: Theme.of(context).textTheme.titleLarge?.color),
              ),
            ],
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: const BorderRadius.all(Radius.circular(10))),
          child: children,
        ),
      ),
    );
  }
}
