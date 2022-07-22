import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'add_model_form.dart';

class AddModel extends StatelessWidget {
  const AddModel({Key? key}) : super(key: key);

  void _addModel(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text(
          "Add a brand",
          style: TextStyle(fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        elevation: 10,
        content: AddModelForm(key: key),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.add),
      iconSize: 30,
      onPressed: () => _addModel(context),
    );
  }
}
