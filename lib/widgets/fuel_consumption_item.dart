import 'package:flutter/material.dart';

class FuelCosumptionItem extends StatelessWidget {
  final String id;
  final String fuelType;
  final double price;
  final double pricePerLitter;
  final double volume;
  final DateTime date;
  final double dashKM;

  const FuelCosumptionItem(
      {Key? key,
      required this.id,
      required this.fuelType,
      required this.price,
      required this.date,
      required this.pricePerLitter,
      required this.volume,
      required this.dashKM})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(child: LayoutBuilder(
      builder: (context, constraints) {
        return Stack(children: [
          Container(
            height: 70,
            width: constraints.maxWidth,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(9),
                  child: Row(
                    children: [
                      const Icon(Icons.oil_barrel, color: Colors.white),
                      Container(
                        padding: const EdgeInsets.only(left: 10),
                        child: Column(
                          children: [
                            SizedBox(
                              width: constraints.maxWidth * 0.7,
                              child: const Text(
                                "Test first field",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: constraints.maxWidth * 0.7,
                              child: const Text(
                                "Test second field",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: constraints.maxWidth * 0.7,
                              child: const Text(
                                "Test third field",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ]);
      },
    ));
  }
}
