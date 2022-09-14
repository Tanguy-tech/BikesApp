import 'package:flutter/material.dart';

class InvoiceItem extends StatelessWidget {
  final String id;
  final String title;
  final double price;
  final DateTime date;
  final Image photo;

  const InvoiceItem(this.id, this.title, this.price, this.date, this.photo,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(child: LayoutBuilder(
      builder: (context, constraints) {
        return Stack(children: [
          Container(
            height: 70,
            width: constraints.maxWidth,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(9),
                  child: Row(
                    children: [
                      const Icon(Icons.receipt, color: Colors.white),
                      Container(
                        padding: const EdgeInsets.only(left: 10),
                        child: Column(
                          children: [
                            SizedBox(
                              width: constraints.maxWidth * 0.7,
                              child: Text(
                                '${date.day}.${date.month}.${date.year}',
                                textAlign: TextAlign.left,
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: constraints.maxWidth * 0.7,
                              child: Text(
                                title,
                                textAlign: TextAlign.left,
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: constraints.maxWidth * 0.7,
                              child: Text(
                                '$price€',
                                textAlign: TextAlign.left,
                                style: const TextStyle(
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
