import 'package:flutter/material.dart';
import 'package:meals_app/category_item.dart';
import 'package:meals_app/model_item.dart';
import '../models/models.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class BrandScreen extends StatelessWidget {
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
        title: Text(routeArgs[0].brand),
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
                ))
            .toList(),
      ),
    );
  }
}
