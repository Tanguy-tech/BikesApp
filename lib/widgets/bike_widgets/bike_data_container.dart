import 'package:flutter/material.dart';
import 'package:motobox/providers/bike_datas.dart';
import 'package:motobox/widgets/bike_widgets/bike_data_field.dart';
import 'package:provider/provider.dart';

class BikeMainInfo extends StatelessWidget {
  const BikeMainInfo({Key? key}) : super(key: key);

  Future<void> _fetch(BuildContext ctx) async {
    await Provider.of<BikeDatas>(ctx, listen: false).fetchAndSetBikeDatas();
  }

  @override
  Widget build(BuildContext context) {
    final bikeData = Provider.of<BikeDatas>(context).myBikeData;
    return LayoutBuilder(builder: ((context, constraints) {
      return Stack(
        children: [
          GestureDetector(
            onTap: () => _fetch(context),
            child: Container(
              height: 150,
              width: constraints.maxWidth,
              decoration: BoxDecoration(
                border: Border.all(
                    color:
                        Theme.of(context).colorScheme.secondary.withAlpha(30)),
                color: Theme.of(context).colorScheme.background,
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 15, left: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BikeDataField("Total costs : ${bikeData.costs}€"),
                    BikeDataField(
                        "Total KM ridden : ${bikeData.totalKmRidden} km"),
                    BikeDataField(
                        "Ridden since Purchased : ${bikeData.riddenSincePurchased} km"),
                    BikeDataField(
                        "Ridden with last refuel : ${bikeData.riddenWithLastRefill} km"),
                  ],
                ),
              ),
            ),
          ),
        ],
      );
    }));
  }
}
