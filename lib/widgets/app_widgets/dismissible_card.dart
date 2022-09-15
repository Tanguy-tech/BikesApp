import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../../providers/fuel_consumptions.dart';

class MyDismissibleCard extends StatelessWidget {
  Widget? children;
  String id;
  MyDismissibleCard(this.children, this.id, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      color: Theme.of(context).colorScheme.secondary,
      child: Dismissible(
        onDismissed: (direction) async {
          try {
            await Provider.of<FuelConsumptions>(context, listen: false)
                .deleteFuelConsumption(id);
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
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: const BorderRadius.all(Radius.circular(15))),
          child: children,
        ),
      ),
    );
  }
}
