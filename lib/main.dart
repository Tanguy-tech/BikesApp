import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:motobox/providers/fuel_consumptions.dart';
import 'package:motobox/providers/invoices.dart';
import 'package:motobox/providers/theme_provider.dart';
import 'package:motobox/screens/category_screen.dart';
import 'package:motobox/screens/garage_screen.dart';
import 'package:motobox/widgets/app_widgets/dropup_button.dart';
import 'package:motobox/widgets/app_widgets/my_bottom_app_bar.dart';
import 'package:motobox/widgets/routes.dart';
import 'package:provider/provider.dart';
import 'widgets/app_widgets/main_drawer.dart';

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

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer<AppTheme>(
      builder: (context, theme, __) => MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => FuelConsumptions()),
          ChangeNotifierProvider(create: (context) => Invoices()),
        ],
        child: MaterialApp(
            navigatorKey: AppTheme.navigatorKey,
            title: 'BikesApp',
            theme: theme.myTheme,
            themeMode: theme.mode,
            home: Builder(builder: (context) {
              return Scaffold(
                backgroundColor: theme.myTheme.colorScheme.background,
                endDrawerEnableOpenDragGesture: true,
                drawer: const MainDrawer(),
                appBar: CupertinoNavigationBar(
                  backgroundColor:
                      Theme.of(context).appBarTheme.backgroundColor,
                  leading: Builder(
                    builder: (context) {
                      return CupertinoButton(
                        padding: const EdgeInsets.all(0),
                        child: Icon(Icons.more_vert,
                            color:
                                Theme.of(context).appBarTheme.foregroundColor),
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
                        activeColor:
                            Theme.of(context).appBarTheme.foregroundColor,
                        trackColor: Theme.of(context).colorScheme.background,
                        onChanged: (value) => theme.toogleTheme(context),
                        value: theme.sw),
                  ),
                ),
                body: _pages[_index]["page"] as Widget,
                extendBody: true,
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.centerDocked,
                floatingActionButton: DropUpButton(context),
                bottomNavigationBar:
                    MyBottomAppBar(_index, _selectPage, _pages),
              );
            }),
            routes: Routes().myAppRoutes),
      ),
    );
  }
}
