import 'package:flutter/material.dart';
import 'package:motobox/providers/bike_datas.dart';
import 'package:motobox/providers/invoices.dart';
import 'package:motobox/widgets/bike_main_info.dart';
import 'package:motobox/widgets/lists_header.dart';
import 'package:provider/provider.dart';

import '../providers/fuel_consumptions.dart';
import '../widgets/fuel_consumption_list.dart';
import '../widgets/invoices_list.dart';

class MyGarageScreen extends StatelessWidget {
  static const routeName = '/garage';
  const MyGarageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          children: [
            Card(
              elevation: 5,
              margin: const EdgeInsets.all(10),
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: ChangeNotifierProvider(
                create: (_) => BikeDatas(),
                builder: (context, child) => const BikeMainInfo(),
              ),
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
                      Expanded(child: FuelConsumptionList()),
                    ],
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
