// ignore_for_file: unnecessary_brace_in_string_interps

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
                            Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  SizedBox(
                                    width: constraints.maxWidth * 0.35,
                                    child: Text(
                                      '${date.day}.${date.month}.${date.year}',
                                      textAlign: TextAlign.left,
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: constraints.maxWidth * 0.35,
                                    child: Text(
                                      fuelType,
                                      textAlign: TextAlign.left,
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ]),
                            SizedBox(
                              width: constraints.maxWidth * 0.7,
                              child: Text(
                                '${pricePerLitter}€/L  ${volume}L',
                                textAlign: TextAlign.left,
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: constraints.maxWidth * 0.7,
                              child: Text(
                                'Total: ${price}€',
                                textAlign: TextAlign.left,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
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
