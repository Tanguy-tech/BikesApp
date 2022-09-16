import 'package:flutter/material.dart';

import 'skeleton.dart';

class ListSkeletonCards extends StatelessWidget {
  const ListSkeletonCards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: ((context, constraints) {
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 4.0, right: 4.0, bottom: 10),
            child: Skeleton(85, constraints.maxWidth),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 4.0, right: 4.0, bottom: 10),
            child: Skeleton(85, constraints.maxWidth),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 4.0, right: 4.0, bottom: 10),
            child: Skeleton(85, constraints.maxWidth),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 4.0, right: 4.0, bottom: 10),
            child: Skeleton(85, constraints.maxWidth),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 4.0, right: 4.0, bottom: 10),
            child: Skeleton(85, constraints.maxWidth),
          ),
        ],
      );
    }));
  }
}
