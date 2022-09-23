import 'package:flutter/material.dart';

class EmptyGarageContainer extends StatelessWidget {
  BoxConstraints constraints;
  EmptyGarageContainer(
    this.constraints, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: constraints.maxWidth,
      decoration: BoxDecoration(
        border: Border.all(
            color: Theme.of(context).colorScheme.secondary.withAlpha(30)),
        color: Theme.of(context).colorScheme.background,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: const Center(
        child: Text('NO BIKE IN YOUR GARAGE'),
      ),
    );
  }
}
