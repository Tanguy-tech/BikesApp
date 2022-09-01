import 'package:flutter/material.dart';
import 'package:meals_app/providers/theme_provider.dart';
import 'package:meals_app/screens/brand_details_screen.dart';
import 'package:meals_app/screens/category_screen.dart';
import 'package:meals_app/screens/invoice_screen.dart';
import 'package:meals_app/screens/fuel_consumption_screen.dart';
import 'package:meals_app/screens/garage_screen.dart';
import 'package:provider/provider.dart';

import 'widgets/main_drawer.dart';

//part 'my_file.gform.dart';

void main() {
  runApp(ChangeNotifierProvider<AppTheme>(
    create: (_) => AppTheme(),
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Map<String, Object>> _pages = [
    {"page": CategoryScreen(), "title": "Brands"},
    {"page": const MyGarageScreen(), "title": "My Garage"},
  ];

  int _selectedPagesIndex = 1;

  void _selectPage(int index) {
    setState(() {
      _selectedPagesIndex = index;
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer<AppTheme>(
      builder: (_, theme, __) => MaterialApp(
          title: 'BikesApp',
          theme: ThemeData.light(), // Provide light theme.
          darkTheme: ThemeData.dark(), // Provide dark theme.
          themeMode: theme.mode, // Decides which theme to show.
          //home: CategoryScreen(key: key),
          home: Scaffold(
            appBar: AppBar(
              title: Text(_pages[_selectedPagesIndex]["title"] as String),
              actions: [
                Switch(
                    onChanged: (value) => theme.toogleTheme(), value: theme.sw)
              ],
            ),
            drawer: const MainDrawer(),
            body: _pages[_selectedPagesIndex]["page"] as Widget,
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Theme.of(context).colorScheme.primary,
              selectedItemColor: Theme.of(context).canvasColor,
              unselectedItemColor: Colors.black45,
              currentIndex: _selectedPagesIndex,
              type: BottomNavigationBarType.shifting,
              onTap: _selectPage,
              items: [
                BottomNavigationBarItem(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  icon: const Icon(Icons.category),
                  label: "Brands",
                ),
                BottomNavigationBarItem(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  icon: const Icon(Icons.favorite),
                  label: "My Garage",
                ),
              ],
            ),
          ),
          routes: {
            BrandDetailsScreen.routeName: (ctx) => const BrandDetailsScreen(),
            MyGarageScreen.routeName: (ctx) => const MyGarageScreen(),
            InvoiceScreen.routeName: (ctx) => const InvoiceScreen(),
            FuelConsumptionScreen.routeName: (ctx) =>
                const FuelConsumptionScreen(),
          }),
    );
  }
}
