import 'package:flutter/material.dart';

class AppTheme with ChangeNotifier {
  ThemeMode _mode;
  bool sw = false;
  ThemeMode get mode => _mode;
  AppTheme({ThemeMode mode = ThemeMode.light}) : _mode = mode;

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  late ThemeData myTheme = ThemeData(
    colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: Colors.indigoAccent.shade700,
        secondary: Colors.tealAccent.shade700,
        brightness: Brightness.light),
    appBarTheme: AppBarTheme(backgroundColor: Colors.indigoAccent.shade700),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.indigoAccent.shade700),
    //Theme.of(navigatorKey.currentContext!).colorScheme.primary),
    canvasColor: const Color.fromARGB(255, 202, 202, 202),
    textTheme: ThemeData.light().textTheme.copyWith(
          bodyLarge: const TextStyle(color: Color.fromARGB(255, 79, 79, 79)),
          bodyMedium: const TextStyle(color: Color.fromARGB(255, 79, 79, 79)),
          titleLarge: const TextStyle(fontFamily: 'Raleway', fontSize: 25),
          titleMedium: const TextStyle(
              fontFamily: 'Raleway', fontSize: 20, fontWeight: FontWeight.bold),
          titleSmall: const TextStyle(fontFamily: 'Raleway', fontSize: 15),
        ),
  );

  void toogleTheme(BuildContext ctx) {
    _mode = _mode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    if (sw == true) {
      sw = false; // LIDHT MODE
      myTheme = ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: Colors.indigoAccent.shade700,
            secondary: Colors.tealAccent.shade700,
            brightness: Brightness.light),
        appBarTheme: AppBarTheme(
            backgroundColor:
                Theme.of(navigatorKey.currentContext!).colorScheme.primary),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor:
                Theme.of(navigatorKey.currentContext!).colorScheme.primary),
        //Theme.of(navigatorKey.currentContext!).colorScheme.primary),
        canvasColor: const Color.fromARGB(255, 202, 202, 202),
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyLarge:
                  const TextStyle(color: Color.fromARGB(255, 79, 79, 79)),
              bodyMedium:
                  const TextStyle(color: Color.fromARGB(255, 79, 79, 79)),
              bodySmall:
                  const TextStyle(color: Color.fromARGB(255, 79, 79, 79)),
              titleLarge: const TextStyle(fontFamily: 'Raleway', fontSize: 25),
              titleMedium: const TextStyle(
                  fontFamily: 'Raleway',
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              titleSmall: const TextStyle(fontFamily: 'Raleway', fontSize: 15),
            ),
      );
    } else {
      sw = true; // DARK MODE
      myTheme = ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: Colors.indigoAccent.shade700,
            secondary: Colors.tealAccent.shade700,
            brightness: Brightness.dark),
        appBarTheme: AppBarTheme(
            backgroundColor: Colors.blue.shade900,
            foregroundColor: Colors.white),
        bottomNavigationBarTheme:
            BottomNavigationBarThemeData(backgroundColor: Colors.blue.shade900),
        canvasColor: const Color.fromARGB(255, 75, 75, 75),
        textTheme: ThemeData.dark().textTheme.copyWith(
              bodyLarge:
                  const TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
              bodyMedium:
                  const TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
              bodySmall:
                  const TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
              titleLarge: const TextStyle(fontFamily: 'Raleway', fontSize: 25),
              titleMedium: const TextStyle(
                  fontFamily: 'Raleway',
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              titleSmall: const TextStyle(fontFamily: 'Raleway', fontSize: 15),
            ),
      );
    }
    notifyListeners();
  }
}
