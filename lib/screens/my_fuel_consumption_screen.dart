import 'package:flutter/material.dart';
import 'package:motobox/providers/theme_provider.dart';
import 'package:motobox/widgets/fuel_consumptions_widgets/fuel_consumption_list.dart';
import 'package:provider/provider.dart';
import '../../widgets/app_widgets/main_drawer.dart';

class FuelConsumptionScreen extends StatelessWidget {
  const FuelConsumptionScreen({Key? key}) : super(key: key);

  static const routeName = "/fuelconsumptionScreen";

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<AppTheme>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("My fuel consumption"),
        actions: [
          Switch(
              onChanged: (value) => theme.toogleTheme(context), value: theme.sw)
        ],
      ),
      drawer: const MainDrawer(),
      body: const FuelConsumptionList(),
    );
  }
}
