import 'package:flutter/material.dart';
import 'package:motobox/widgets/app_widgets/skeleton.dart';

class HomeSkeletonCards extends StatelessWidget {
  const HomeSkeletonCards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: ((context, constraints) {
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Skeleton(150, constraints.maxWidth),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10),
            child: Skeleton(30, constraints.maxWidth),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 4.0, right: 4.0, top: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Row(
                    children: const [
                      Expanded(child: Skeleton(85, 80)),
                      SizedBox(width: 8),
                      Expanded(child: Skeleton(85, 80))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Row(
                    children: const [
                      Expanded(child: Skeleton(85, 80)),
                      SizedBox(width: 8),
                      Expanded(child: Skeleton(85, 80))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Row(
                    children: const [
                      Expanded(child: Skeleton(85, 80)),
                      SizedBox(width: 8),
                      Expanded(child: Skeleton(85, 80))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Row(
                    children: const [
                      Expanded(child: Skeleton(85, 80)),
                      SizedBox(width: 8),
                      Expanded(child: Skeleton(85, 80))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Row(
                    children: const [
                      Expanded(child: Skeleton(85, 80)),
                      SizedBox(width: 8),
                      Expanded(child: Skeleton(85, 80))
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      );
    }));
  }
}
