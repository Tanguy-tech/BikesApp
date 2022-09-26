import 'package:flutter/material.dart';

class TwinListsHeader extends StatelessWidget {
  const TwinListsHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Stack(
          children: [
            Container(
              height: 30,
              width: constraints.maxWidth,
              decoration: BoxDecoration(
                  color: Theme.of(context).appBarTheme.backgroundColor,
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text("Invoices",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleMedium),
                  ),
                  Expanded(
                      child: Text("Fuel",
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.titleMedium)),
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
