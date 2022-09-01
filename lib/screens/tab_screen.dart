import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:meals_app/screens/category_screen.dart';
import 'package:meals_app/widgets/main_drawer.dart';
import 'garage_screen.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({Key? key}) : super(key: key);

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPagesIndex]["title"] as String),
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
    );
  }
}
