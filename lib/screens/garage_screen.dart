import 'package:flutter/material.dart';
import 'package:motobox/providers/bike_datas.dart';
import 'package:motobox/widgets/twin_lists_header.dart';
import 'package:provider/provider.dart';
import '../widgets/bike_widgets/bike_data_container.dart';
import '../widgets/fuel_consumptions_widgets/fuel_consumption_list.dart';
import '../widgets/invoices_widgets/invoices_list.dart';

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
              margin:
                  const EdgeInsets.only(bottom: 8, top: 8, left: 4, right: 4),
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: ChangeNotifierProvider(
                create: (_) => BikeDatas(),
                builder: (context, child) => const BikeMainInfo(),
              ),
            ),
            const Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: TwinListsHeader(),
            ),
            Stack(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 5),
                  height: constraints.maxHeight * 0.6927,
                  width: constraints.maxWidth,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Expanded(
                          child: InvoicesList(
                        isPreview: true,
                      )),
                      Expanded(
                          child: FuelConsumptionList(
                        isPreview: true,
                      )),
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
