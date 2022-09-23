import 'package:flutter/material.dart';
import 'package:motobox/screens/fuel_consumptions_screens/my_fuel_consumption_screen.dart';
import 'package:motobox/screens/invoices_screens/my_invoice_screen.dart';
import 'package:motobox/screens/profile_screen.dart';

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
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).appBarTheme.backgroundColor,
            child: Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Text("Menu",
                  style: Theme.of(context).appBarTheme.titleTextStyle),
            ),
          ),
          const SizedBox(height: 20),
          ListTile(
            leading: Icon(Icons.home,
                color: Theme.of(context).appBarTheme.foregroundColor),
            title: Text('Home', style: Theme.of(context).textTheme.bodyLarge),
            onTap: () {
              Navigator.of(context).pushReplacementNamed("/");
            },
          ),
          ListTile(
            leading: Icon(Icons.sports_motorsports,
                color: Theme.of(context).appBarTheme.foregroundColor),
            title: Text('My profile',
                style: Theme.of(context).textTheme.bodyLarge),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(MyProfileScreen.routeName);
            },
          ),
          ListTile(
            leading: Icon(Icons.receipt,
                color: Theme.of(context).appBarTheme.foregroundColor),
            title: Text('My invoices',
                style: Theme.of(context).textTheme.bodyLarge),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(InvoiceScreen.routeName);
            },
          ),
          ListTile(
            leading: Icon(Icons.oil_barrel,
                color: Theme.of(context).appBarTheme.foregroundColor),
            title: Text('My consumptions',
                style: Theme.of(context).textTheme.bodyLarge),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(FuelConsumptionScreen.routeName);
            },
          )
        ],
      ),
    );
  }
}
