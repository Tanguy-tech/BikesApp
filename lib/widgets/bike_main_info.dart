import 'package:flutter/material.dart';
import 'package:motobox/providers/bike_datas.dart';
import 'package:provider/provider.dart';

class BikeMainInfo extends StatelessWidget {
  const BikeMainInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bikeData = Provider.of<BikeDatas>(context).myBikeData;
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
                  child: Text(
                    "Total costs : ${bikeData.costs}€",
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 15, top: 10),
                  child: Text(
                    "Total KM ridden : ${bikeData.totalKmRidden} km",
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 15, top: 10),
                  child: Text(
                    "Ridden since Purchased : ${bikeData.riddenSincePurchased} km",
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 15, top: 10),
                  child: Text(
                    "Ridden with last refuel : ${bikeData.riddenWithLastRefill} km",
                    textAlign: TextAlign.left,
                    style: const TextStyle(
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
