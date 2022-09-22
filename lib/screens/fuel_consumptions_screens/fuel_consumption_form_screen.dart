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
      backgroundColor: theme.myTheme.colorScheme.background,
      appBar: CupertinoNavigationBar(
          padding: const EdgeInsetsDirectional.all(0),
          leading: CupertinoNavigationBarBackButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              color: Theme.of(context).appBarTheme.titleTextStyle?.color),
          middle: Text(
            'Add or Edit a Refill',
            style: Theme.of(context).appBarTheme.titleTextStyle,
          ),
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor),
      body: const FuelConsumptionForm(),
    );
  }
}
