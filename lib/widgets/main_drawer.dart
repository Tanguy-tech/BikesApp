import 'package:flutter/material.dart';
import 'package:meals_app/screens/fuel_consumption_screen.dart';
import 'package:meals_app/screens/invoice_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  Widget buildListTile(String title, IconData icon, Function() tapHandler) {
    return ListTile(
      leading: Icon(icon, size: 20),
      title: Text(
        title,
        style: const TextStyle(
            fontFamily: "RobotoCondensed",
            fontSize: 20,
            fontWeight: FontWeight.bold),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 103,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).colorScheme.primary,
            child: const Text(
              "MotoBox's Drawer menu",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: 20),
            ),
          ),
          const SizedBox(height: 20),
          buildListTile("Home", Icons.receipt, () {
            Navigator.of(context).pushReplacementNamed("/");
          }),
          buildListTile("My invoices", Icons.receipt, () {
            Navigator.of(context).pushReplacementNamed(InvoiceScreen.routeName);
          }),
          buildListTile("My consumption", Icons.oil_barrel, () {
            Navigator.of(context)
                .pushReplacementNamed(FuelConsumptionScreen.routeName);
          }),
        ],
      ),
    );
  }
}
