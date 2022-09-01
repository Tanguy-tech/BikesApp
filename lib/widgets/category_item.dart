import 'package:flutter/material.dart';
import '../models/models.dart';
import 'package:meals_app/screens/brand_details_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Image image;
  final Color color;
  final List<Model> models;

  const CategoryItem({
    Key? key,
    required this.id,
    required this.title,
    required this.image,
    required this.color,
    required this.models,
  }) : super(key: key);

  void selectBrand(BuildContext ctx) {
    Navigator.of(ctx)
        .pushNamed(BrandDetailsScreen.routeName, arguments: models);
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: GridTile(
        // footer: GridTileBar(
        //backgroundColor: Colors.grey,
        // title: TextButton(
        //   onPressed: () => selectBrand(context),
        //   child: Text(title),
        // ),
        // trailing: IconButton(
        //   icon: const Icon(Icons.arrow_forward),
        //   onPressed: () => selectBrand(context),
        //   padding: EdgeInsets.only(left: 90),
        // ),
        //),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 101, 101, 101),
                Color.fromARGB(255, 186, 186, 186),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: TextButton(
            onPressed: () => selectBrand(context),
            child: image,
          ),
        ),
      ),
    );
  }
}
