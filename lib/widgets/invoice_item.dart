import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/image.dart';

class InvoiceItem extends StatelessWidget {
  final String id;
  final String title;
  final double price;
  final DateTime date;
  final Image photo;

  const InvoiceItem(
      {Key? key,
      required this.id,
      required this.title,
      required this.price,
      required this.date,
      required this.photo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(child: LayoutBuilder(
      builder: (context, constraints) {
        return Stack(children: [
          Container(
            height: 70,
            width: constraints.maxWidth,
            decoration: const BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      const Icon(Icons.receipt, color: Colors.white),
                      Container(
                        padding: const EdgeInsets.only(left: 10),
                        child: Column(
                          children: [
                            SizedBox(
                              width: constraints.maxWidth * 0.7,
                              child: const Text(
                                "Test first field",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: constraints.maxWidth * 0.7,
                              child: const Text(
                                "Test second field",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: constraints.maxWidth * 0.7,
                              child: const Text(
                                "Test third field",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ]);
      },
    ));
  }
}
