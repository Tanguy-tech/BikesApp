import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:motobox/widgets/add_item_form.dart';
import 'package:provider/provider.dart';

import '../providers/theme_provider.dart';
import '../widgets/add_item_form.dart';

class AddItemScreen extends StatelessWidget {
  const AddItemScreen({Key? key}) : super(key: key);

  static const routeName = "/addscreen";

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<AppTheme>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add an expense'),
        actions: [
          Switch(
              onChanged: (value) => theme.toogleTheme(context), value: theme.sw)
        ],
      ),
      body: const AddItemForm(),
    );
  }
}
