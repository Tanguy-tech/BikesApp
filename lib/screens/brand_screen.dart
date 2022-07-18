import 'package:flutter/material.dart';
import 'package:meals_app/widgets/category_item.dart';
import 'package:meals_app/widgets/model_item.dart';
import '../models/models.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class BrandScreen extends StatelessWidget {
  static const routeName = '/brands';
  const BrandScreen({Key? key}) : super(key: key);

  // final String categoryId;
  // final String categoryTitle;
  // final Image categoryImage;

  // const CategoryBrandScreen(
  //     {Key? key,
  //     required this.categoryId,
  //     required this.categoryTitle,
  //     required this.categoryImage})
  //     : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context)?.settings.arguments as List<Model>;

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
      body: ListView(
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
