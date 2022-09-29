import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:motobox/providers/auth.dart';
import 'package:motobox/providers/my_bikes.dart';
import 'package:motobox/providers/fuel_consumptions.dart';
import 'package:motobox/providers/invoices.dart';
import 'package:motobox/providers/theme_provider.dart';
import 'package:motobox/screens/auth_screen.dart';
import 'package:motobox/screens/expenses_screen.dart';
import 'package:motobox/screens/home_screen.dart';
import 'package:motobox/screens/my_bike/my_bike_screen.dart';
import 'package:motobox/widgets/app_widgets/dropup_button.dart';
import 'package:motobox/widgets/app_widgets/my_bottom_app_bar.dart';
import 'package:motobox/widgets/fuel_consumptions_widgets/fuel_consumption_form.dart';
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
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer<AppTheme>(
      builder: (context, theme, __) => MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => Auth()),
          ChangeNotifierProxyProvider<Auth, FuelConsumptions>(
              create: (context) => FuelConsumptions('', []),
              update: ((context, auth, previous) =>
                  FuelConsumptions(auth.token, previous!.consumptions))),
          ChangeNotifierProxyProvider<Auth, Invoices>(
              create: (context) => Invoices('', []),
              update: ((context, auth, previous) =>
                  Invoices(auth.token, previous!.invoices))),
          ChangeNotifierProxyProvider<Auth, MyBikes>(
              create: (context) => MyBikes('', []),
              update: ((context, auth, previous) =>
                  MyBikes(auth.token, previous!.bikes))),
        ],
        child: Consumer<Auth>(
          builder: ((context, auth, _) => MaterialApp(
              navigatorKey: AppTheme.navigatorKey,
              title: 'BikesApp',
              theme: theme.myTheme,
              themeMode: theme.mode,
              home: auth.isAuth ? const HomeScreen() : AuthScreen(),
              routes: Routes().myAppRoutes)),
        ),
      ),
    );
  }
}
