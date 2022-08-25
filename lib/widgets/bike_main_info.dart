import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class BikeMainInfo extends StatelessWidget {
  const BikeMainInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: ((context, constraints) {
      return Stack(
        children: [
          Container(
            height: 150,
            width: constraints.maxWidth,
            decoration: BoxDecoration(
              color: Colors.purpleAccent.shade400,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 15, top: 25),
                  child: const Text(
                    "Total costs : BIKE TOTAL COSTS IN EUR",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 15, top: 10),
                  child: const Text(
                    "Total KM ridden : BIKE TOTAL KM ridden in KM",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 15, top: 10),
                  child: const Text(
                    "Ridden since Purchased : Ridden in KM",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 15, top: 10),
                  child: const Text(
                    "Ridden with last refuel : Ridden in KM",
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
      );
    }));
  }
}
