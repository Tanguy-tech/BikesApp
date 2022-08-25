import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyGarageScreen extends StatelessWidget {
  static const routeName = '/garage';
  const MyGarageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(child: Text("INFORMATION ABOUT MY GARAGE")));
  }
}
