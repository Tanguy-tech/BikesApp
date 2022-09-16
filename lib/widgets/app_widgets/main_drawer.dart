import 'package:flutter/material.dart';
import 'package:motobox/screens/fuel_consumptions_screens/my_fuel_consumption_screen.dart';
import 'package:motobox/screens/invoices_screens/invoice_screen.dart';

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
            color: Theme.of(context).appBarTheme.backgroundColor,
            child: Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Text(
                "MotoBox's Drawer menu",
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 20,
                    color: Theme.of(context).textTheme.titleLarge?.color),
              ),
            ),
          ),
          const SizedBox(height: 20),
          buildListTile("Home", Icons.home, () {
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
