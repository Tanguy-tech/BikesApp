import 'package:flutter/material.dart';
import 'package:motobox/providers/fuel_consumptions.dart';
import 'package:motobox/widgets/fuel_consumption_list.dart';
import 'package:provider/provider.dart';
import '../widgets/main_drawer.dart';

class FuelConsumptionScreen extends StatefulWidget {
  const FuelConsumptionScreen({Key? key}) : super(key: key);

  static const routeName = "/fuelconsumption";

  @override
  State<FuelConsumptionScreen> createState() => _FuelConsumptionScreenState();
}

class _FuelConsumptionScreenState extends State<FuelConsumptionScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => FuelConsumptions(),
      builder: ((context, child) => Scaffold(
            appBar: AppBar(title: const Text("My fuel consumption")),
            drawer: const MainDrawer(),
            body: const Center(child: FuelConsumptionList()),
          )),
    );
  }
}