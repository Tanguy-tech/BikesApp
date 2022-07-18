import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:meals_app/models/models.dart';

class ModelItem extends StatelessWidget {
  final String id;
  final String brand;
  final Image brandLogo;
  final String name;
  final String hp;
  final String manufacturedDate;
  final Image photo;
  final String infos;

  const ModelItem(
      {Key? key,
      required this.id,
      required this.brand,
      required this.name,
      required this.brandLogo,
      required this.hp,
      required this.manufacturedDate,
      required this.photo,
      required this.infos})
      : super(key: key);

  void showDetailsOfModel(BuildContext ctx) {
    showDialog(
      context: ctx,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        backgroundColor: Theme.of(ctx).canvasColor,
        title: Text(
          name,
          textAlign: TextAlign.center,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        content: SingleChildScrollView(
          child: Column(
            children: [
              Text('$hp horse power'),
              Text(manufacturedDate),
              const SizedBox(height: 20),
              Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                shadowColor: Theme.of(ctx).colorScheme.primary,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(15), child: photo),
              ),
              const SizedBox(height: 20),
              Text(
                infos,
                textAlign: TextAlign.start,
                style: Theme.of(ctx).textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ),
      barrierDismissible: true,
    );
  }

  void _addToMyGarage() {}

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => showDetailsOfModel(context),
        child: Container(
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(10)),
          margin: const EdgeInsets.all(20),
          child: Container(
            padding: const EdgeInsets.all(5),
            child: LayoutBuilder(
              builder: ((context, constraints) {
                return Column(
                  children: [
                    Container(
                        padding: const EdgeInsets.all(5),
                        width: constraints.maxWidth,
                        decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color.fromARGB(255, 101, 101, 101),
                                Color.fromARGB(255, 186, 186, 186),
                              ],
                            ),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                Text(name,
                                    style:
                                        const TextStyle(color: Colors.white)),
                                Text('$hp horse power ',
                                    style:
                                        const TextStyle(color: Colors.white)),
                                Text(manufacturedDate,
                                    style:
                                        const TextStyle(color: Colors.white)),
                              ],
                            ),
                            SizedBox(
                              child: SizedBox(
                                height: 30,
                                child: brandLogo,
                              ),
                            )
                          ],
                        )),
                    ClipRRect(
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10)),
                        child: Stack(children: [
                          photo,
                          Positioned(
                            left: constraints.maxWidth * 0.85,
                            child: IconButton(
                                onPressed: () => _addToMyGarage(),
                                icon: const Icon(Icons.add)),
                          )
                        ])),
                  ],
                );
              }),
            ),
          ),
        ));
  }
}
