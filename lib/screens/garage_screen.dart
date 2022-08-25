import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:meals_app/widgets/bike_main_info.dart';

class MyGarageScreen extends StatelessWidget {
  static const routeName = '/garage';
  const MyGarageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Column(
        children: const [
          Card(
            elevation: 10,
            margin: EdgeInsets.all(10),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: BikeMainInfo(),
          )
        ],
      );
    });
  }
}
