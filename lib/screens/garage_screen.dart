import 'package:flutter/material.dart';
import 'package:meals_app/widgets/bike_main_info.dart';
import 'package:meals_app/widgets/lists_header.dart';
import 'package:meals_app/widgets/lists_infos.dart';

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
          Card(
            elevation: 0,
            color: Theme.of(context).canvasColor,
            margin: const EdgeInsets.all(7),
            child: const ListInfos(),
          ),
        ],
      );
    });
  }
}
