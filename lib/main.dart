import 'package:flutter/material.dart';
import 'package:motobox/providers/theme_provider.dart';
import 'package:motobox/screens/add_item_screen.dart';
import 'package:motobox/screens/brand_details_screen.dart';
import 'package:motobox/screens/category_screen.dart';
import 'package:motobox/screens/invoice_screen.dart';
import 'package:motobox/screens/fuel_consumption_screen.dart';
import 'package:motobox/screens/garage_screen.dart';
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

  void addItem(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(AddItemScreen.routeName);
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer<AppTheme>(
      builder: (context, theme, __) => MaterialApp(
          navigatorKey: AppTheme.navigatorKey,
          title: 'BikesApp',
          theme: theme.myTheme,
          themeMode: theme.mode,
          home: Builder(builder: (context) {
            return Scaffold(
              appBar: AppBar(
                elevation: 5,
                title: Text(_pages[_selectedPagesIndex]["title"] as String),
                actions: [
                  Switch(
                      onChanged: (value) => theme.toogleTheme(context),
                      value: theme.sw)
                ],
              ),
              drawer: const MainDrawer(),
              body: _pages[_selectedPagesIndex]["page"] as Widget,
              extendBody: true,
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              floatingActionButton: FloatingActionButton(
                onPressed: () => addItem(context),
                backgroundColor: Colors.purpleAccent.shade400,
                child: const Icon(Icons.add),
              ),
              bottomNavigationBar: BottomAppBar(
                notchMargin: 5,
                color: theme.myTheme.bottomNavigationBarTheme.backgroundColor,
                shape: const CircularNotchedRectangle(),
                elevation: 0,
                child: BottomNavigationBar(
                    backgroundColor: theme
                        .myTheme.bottomNavigationBarTheme.backgroundColor
                        ?.withAlpha(0),
                    elevation: 0,
                    selectedItemColor: theme
                        .myTheme.bottomNavigationBarTheme.selectedItemColor,
                    unselectedItemColor: theme
                        .myTheme.bottomNavigationBarTheme.unselectedItemColor,
                    currentIndex: _selectedPagesIndex,
                    //type: BottomNavigationBarType.shifting,
                    onTap: _selectPage,
                    items: [
                      BottomNavigationBarItem(
                          backgroundColor:
                              theme.myTheme.appBarTheme.backgroundColor,
                          icon: const Icon(Icons.border_all_rounded),
                          label:
                              _pages[_selectedPagesIndex]["title"] as String),
                      BottomNavigationBarItem(
                          backgroundColor:
                              theme.myTheme.appBarTheme.backgroundColor,
                          icon: const Icon(Icons.favorite),
                          label: _pages[_selectedPagesIndex]["title"] as String)
                    ]),
              ),
            );
          }),
          routes: {
            BrandDetailsScreen.routeName: (ctx) => const BrandDetailsScreen(),
            MyGarageScreen.routeName: (ctx) => const MyGarageScreen(),
            InvoiceScreen.routeName: (ctx) => const InvoiceScreen(),
            FuelConsumptionScreen.routeName: (ctx) =>
                const FuelConsumptionScreen(),
            AddItemScreen.routeName: (ctx) => const AddItemScreen(),
          }),
    );
  }
}
