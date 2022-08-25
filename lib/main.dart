import 'package:flutter/material.dart';
import 'package:meals_app/screens/brand_screen.dart';
import 'package:meals_app/screens/category_screen.dart';
import 'package:meals_app/screens/invoice_screen.dart';
import 'package:meals_app/screens/fuel_consumption_screen.dart';
import 'package:meals_app/screens/garage_screen.dart';
import 'package:meals_app/screens/tab_screen.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';

//part 'my_file.gform.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BikesApp',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: Colors.indigoAccent.shade700,
            secondary: Colors.tealAccent.shade700),
        canvasColor: const Color.fromARGB(255, 202, 202, 202),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
            bodyLarge: const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
            bodyMedium: const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
            titleLarge: const TextStyle(fontFamily: 'Raleway', fontSize: 25),
            titleMedium: const TextStyle(
                fontFamily: 'Raleway',
                fontSize: 20,
                fontWeight: FontWeight.bold),
            titleSmall: const TextStyle(fontFamily: 'Raleway', fontSize: 15)),
      ),
      //home: CategoryScreen(key: key),
      home: const TabScreen(),
      routes: {
        BrandScreen.routeName: (ctx) => const BrandScreen(),
        MyGarageScreen.routeName: (ctx) => const MyGarageScreen(),
        InvoiceScreen.routeName: (ctx) => const InvoiceScreen(),
        FuelConsumptionScreen.routeName: (ctx) => const FuelConsumptionScreen(),
      },
    );
  }
}
