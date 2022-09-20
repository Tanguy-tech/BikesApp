import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:motobox/widgets/fuel_consumptions_widgets/fuel_consumption_form.dart';
import 'package:provider/provider.dart';

import '../../../providers/theme_provider.dart';

class FuelConsrumptionFormScreen extends StatelessWidget {
  const FuelConsrumptionFormScreen({Key? key}) : super(key: key);

  static const routeName = '/fuelConsumptionFormScreen';

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<AppTheme>(context);
    return Scaffold(
      //appBar: AppBar(title: const Text('Add or Edit a Refill')),
      appBar: CupertinoNavigationBar(
          padding: const EdgeInsetsDirectional.all(0),
          // leading: CupertinoNavigationBarBackButton(
          //     color: Theme.of(context).appBarTheme.foregroundColor,
          //     previousPageTitle: 'Home'),
          previousPageTitle: 'Home',
          middle: Text(
            'Add or Edit a Refill',
            style:
                TextStyle(color: Theme.of(context).appBarTheme.foregroundColor),
          ),
          backgroundColor: Theme.of(context).backgroundColor),
      body: const FuelConsumptionForm(),
    );
  }
}
