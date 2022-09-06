import 'package:flutter/material.dart';
import 'package:meals_app/widgets/bike_main_info.dart';
import 'package:meals_app/widgets/lists_header.dart';

import '../widgets/fuel_consumption_list.dart';
import '../widgets/invoices_list.dart';

class MyGarageScreen extends StatelessWidget {
  static const routeName = '/garage';
  const MyGarageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Column(
        children: [
          const Card(
            elevation: 5,
            margin: EdgeInsets.all(10),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: BikeMainInfo(),
          ),
          const ListHeader(),
          Stack(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 5),
                height: constraints.maxHeight * 0.6927,
                width: constraints.maxWidth,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Expanded(child: InvoicesList()),
                    Expanded(child: FuelConsumptionList())
                  ],
                ),
              ),
            ],
          ),
        ],
      );
    });
  }
}
