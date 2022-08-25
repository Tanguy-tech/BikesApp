import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:meals_app/widgets/category_item.dart';
import 'package:meals_app/data/brand_data.dart';
import 'package:meals_app/widgets/navbarMenu.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
        padding: const EdgeInsets.all(25),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: BRAND_CATEGORIES
            .map((catData) => Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  shadowColor: Theme.of(context).colorScheme.primary,
                  child: CategoryItem(
                    id: catData.id,
                    title: catData.title,
                    image: catData.logo,
                    color: Colors.grey,
                    models: catData.models,
                  ),
                ))
            .toList());
  }
}
