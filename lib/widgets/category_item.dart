import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import '../models/models.dart';
import 'package:meals_app/screens/brand_screen.dart';

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
    Navigator.of(ctx).pushNamed(BrandScreen.routeName, arguments: models);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectBrand(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(12.5),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              Color.fromARGB(255, 101, 101, 101),
              Color.fromARGB(255, 186, 186, 186),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: LayoutBuilder(
          builder: ((context, constraints) {
            return ListView(
              children: <Widget>[
                SizedBox(height: constraints.maxHeight * 0.6, child: image),
                SizedBox(height: constraints.maxHeight * 0.1),
                SizedBox(
                  height: constraints.maxHeight * 0.3,
                  child: Center(
                    child: Stack(
                      children: [
                        Container(
                          width: constraints.maxWidth,
                          decoration: const BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                        ),
                        Center(
                          child: Text(
                            title,
                            style: Theme.of(context).textTheme.titleLarge,
                            textScaleFactor: 0.55,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
