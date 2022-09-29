import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:motobox/providers/theme_provider.dart';
import 'package:provider/provider.dart';

import '../widgets/app_widgets/dropup_button.dart';
import '../widgets/app_widgets/main_drawer.dart';
import '../widgets/app_widgets/my_bottom_app_bar.dart';
import 'expenses_screen.dart';
import 'my_bike/my_bike_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, Object>> _pages = [
    // {"page": BrandsScreen(), "title": "Brands"},
    {"page": const MyBikeScreen(), "title": "My bike"},
    // {"page": const MyProfileScreen(), "title": "Profile"},
    {"page": const MyExpensesScreen(), "title": "Expenses"},
  ];

  int _index = 1;

  void _selectPage(int index) {
    setState(() {
      _index = index;
    });
  }

  late bool _isLoading;

  @override
  void initState() {
    _isLoading = true;
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<AppTheme>(context, listen: false);
    return Builder(builder: (context) {
      return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        endDrawerEnableOpenDragGesture: true,
        drawer: const MainDrawer(),
        appBar: CupertinoNavigationBar(
          border: const Border(bottom: BorderSide(color: Colors.transparent)),
          // backgroundColor:
          //     Theme.of(context).appBarTheme.backgroundColor,
          backgroundColor: Colors.transparent,
          leading: Builder(
            builder: (context) {
              return CupertinoButton(
                padding: const EdgeInsets.all(0),
                child: Icon(Icons.more_vert,
                    color: Theme.of(context).appBarTheme.foregroundColor),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          ),
          middle: Text(_pages[_index]["title"] as String,
              style: Theme.of(context).appBarTheme.titleTextStyle),
          trailing: Transform.scale(
            scale: 0.7,
            child: CupertinoSwitch(
                activeColor: Theme.of(context).colorScheme.primary,
                trackColor: Theme.of(context).colorScheme.secondary,
                onChanged: (value) => theme.toogleTheme(context),
                value: theme.sw),
          ),
        ),
        body: _pages[_index]["page"] as Widget,
        extendBody: true,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: DropUpButton(context),
        bottomNavigationBar: MyBottomAppBar(_index, _selectPage, _pages),
      );
    });
  }
}
