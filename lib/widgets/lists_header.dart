import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ListHeader extends StatelessWidget {
  const ListHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Stack(
          children: [
            Container(
              height: 30,
              width: constraints.maxWidth,
              margin: const EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                  color: Colors.green, borderRadius: BorderRadius.circular(10)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Expanded(
                    child: Text(
                      "Header 1",
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                      child: Text(
                    "Header 2",
                    textAlign: TextAlign.center,
                  )),
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
