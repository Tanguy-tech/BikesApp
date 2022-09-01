import 'package:flutter/material.dart';
import 'package:meals_app/widgets/model_item.dart';
import '../models/models.dart';

import '../widgets/add_model_widget.dart';

class BrandDetailsScreen extends StatelessWidget {
  static const routeName = '/brands';
  const BrandDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context)?.settings.arguments as List<Model>;
    bool isEmpty = false;
    if (routeArgs.isEmpty) {
      isEmpty = true;
    }

    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      appBar: AppBar(
        title: LayoutBuilder(
          builder: ((context, constraints) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("${routeArgs[0].brand} "),
                SizedBox(
                  height: 40,
                  child: routeArgs[0].brandLogo,
                ),
              ],
            );
          }),
        ),
      ),
      body: isEmpty
          ? Container(
              padding: const EdgeInsets.all(10),
              child: const AddModel(),
            )
          : ListView(
              children: routeArgs
                  .map((modelData) => ModelItem(
                        id: modelData.id,
                        brand: modelData.brand,
                        name: modelData.name,
                        hp: modelData.hp,
                        manufacturedDate: modelData.manufacturedDate,
                        photo: modelData.photo,
                        brandLogo: modelData.brandLogo,
                        infos: modelData.infos,
                      ))
                  .toList(),
            ),
    );
  }
}
