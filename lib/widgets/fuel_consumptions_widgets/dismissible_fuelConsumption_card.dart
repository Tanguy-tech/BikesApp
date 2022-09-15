import 'package:flutter/material.dart';
import 'package:motobox/screens/fuel_consumptions_screens/edit_fuel_cosumption_screen.dart';
import 'package:provider/provider.dart';

import '../../providers/fuel_consumption.dart';
import '../../providers/fuel_consumptions.dart';

// ignore: must_be_immutable
class DismissibleFuelComsumptionCard extends StatelessWidget {
  Widget? children;
  String id;
  DismissibleFuelComsumptionCard(this.children, this.id, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final fcData = Provider.of<FuelConsumption>(context);
    final scaffold = ScaffoldMessenger.of(context);
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => Container(
            padding: const EdgeInsets.symmetric(vertical: 250, horizontal: 80),
            child: Stack(
              children: [
                Card(
                  margin: const EdgeInsets.only(top: 50.0),
                  child: SizedBox(
                    height: 400.0,
                    width: double.infinity,
                    child: Center(
                      child: ListTile(
                        leading: IconButton(
                            onPressed: () {
                              Navigator.of(context).pushReplacementNamed(
                                  EditFuelConsumptionScreen.routeName);
                            },
                            icon: const Icon(Icons.edit)),
                        title: Text(
                          '${fcData.price}',
                          style: TextStyle(
                              color:
                                  Theme.of(context).textTheme.bodyLarge?.color),
                        ),
                        subtitle: const Text('SUBTITLE'),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  //top: .0,
                  bottom: 170,
                  left: .0,
                  right: .0,
                  child: Center(
                    child: CircleAvatar(
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                      radius: 45.0,
                      child: Icon(Icons.oil_barrel,
                          color: Theme.of(context).textTheme.titleLarge?.color),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
      child: Card(
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
      ),
    );
  }
}
