import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ModelItem extends StatelessWidget {
  final String id;
  final String brand;
  final Image brandLogo;
  final String name;
  final String hp;
  final String manufacturedDate;
  final Image photo;

  const ModelItem(
      {Key? key,
      required this.id,
      required this.brand,
      required this.name,
      required this.brandLogo,
      required this.hp,
      required this.manufacturedDate,
      required this.photo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Card(
      elevation: 5,
      margin: const EdgeInsets.all(20),
      child: Column(
        children: [
          Text(name),
          Text('$hp horse power'),
          Text(manufacturedDate),
          photo,
        ],
      ),
    ));
  }
}
