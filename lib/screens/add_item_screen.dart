import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:motobox/widgets/add_item_form.dart';

import '../widgets/add_item_form.dart';

class AddItemScreen extends StatelessWidget {
  const AddItemScreen({Key? key}) : super(key: key);

  static const routeName = "/addscreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add fuel refill or invoice'),
      ),
      body: const AddItemForm(),
    );
  }
}
