import 'package:flutter/material.dart';
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
    return Scaffold(
      appBar: AppBar(title: const Text("My fuel consumption")),
      drawer: const MainDrawer(),
      body: const Center(child: Text("This is my fuel consumption screen")),
    );
  }
}
