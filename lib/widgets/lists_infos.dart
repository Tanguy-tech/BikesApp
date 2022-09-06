import 'package:flutter/material.dart';
import 'package:meals_app/widgets/fuel_consumption_list.dart';
import 'package:meals_app/widgets/invoices_list.dart';

class ListInfos extends StatelessWidget {
  const ListInfos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: ((context, constraints) {
      return Stack(
        children: [
          SizedBox(
            height: 437,
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
      );
    }));
  }
}
