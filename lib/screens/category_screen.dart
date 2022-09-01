import 'package:flutter/material.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/widgets/category_item.dart';
import 'package:meals_app/data/brand_data.dart';

class CategoryScreen extends StatelessWidget {
  final List<Category> ci = brandCategories;
  CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: ci.length,
      padding: const EdgeInsets.all(25),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      itemBuilder: (context, i) => CategoryItem(
          id: ci[i].id,
          title: ci[i].title,
          image: ci[i].logo,
          color: ci[i].color,
          models: ci[i].models),
    );
  }
}
