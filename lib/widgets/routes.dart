import 'package:flutter/material.dart';
import 'package:motobox/screens/invoices_screens/invoice_form_screen.dart';
import 'package:motobox/screens/my_bike/new_bike_form_screen.dart';
import 'package:motobox/screens/my_bike/my_bike_screen.dart';
import 'package:motobox/screens/profile_screen.dart';
import '../screens/brand_details_screen.dart';
import '../screens/fuel_consumptions_screens/fuel_consumption_form_screen.dart';
import '../screens/expenses_screen.dart';
import '../screens/invoices_screens/my_invoice_screen.dart';
import '../screens/fuel_consumptions_screens/my_fuel_consumption_screen.dart';

class Routes {
  Map<String, Widget Function(BuildContext)> myAppRoutes = {
    BrandDetailsScreen.routeName: (ctx) => const BrandDetailsScreen(),
    MyExpensesScreen.routeName: (ctx) => const MyExpensesScreen(),
    InvoiceScreen.routeName: (ctx) => const InvoiceScreen(),
    FuelConsumptionScreen.routeName: (ctx) => const FuelConsumptionScreen(),
    FuelConsrumptionFormScreen.routeName: (ctx) =>
        const FuelConsrumptionFormScreen(),
    InvoiceFormScreen.routeName: (ctx) => const InvoiceFormScreen(),
    MyProfileScreen.routeName: (ctx) => const MyProfileScreen(),
    MyBikeScreen.routeName: (ctx) => const MyBikeScreen(),
    NewBikeFormScreen.routeName: (ctx) => const NewBikeFormScreen(),
  };
}
