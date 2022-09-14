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
      appBar: AppBar(
        title: const Text('Add Refill'),
        actions: [
          Switch(
              onChanged: (value) => theme.toogleTheme(context), value: theme.sw)
        ],
      ),
      body: const FuelConsumptionForm(),
    );
  }
}
