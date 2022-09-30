import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:motobox/providers/auth.dart';
import 'package:motobox/providers/my_bikes.dart';
import 'package:motobox/providers/fuel_consumptions.dart';
import 'package:motobox/providers/invoices.dart';
import 'package:motobox/providers/theme_provider.dart';
import 'package:motobox/screens/auth_screen.dart';
import 'package:motobox/screens/home_screen.dart';
import 'package:motobox/widgets/routes.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
