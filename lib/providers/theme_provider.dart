import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppTheme with ChangeNotifier {
  ThemeMode _mode;
  bool sw = false;
  ThemeMode get mode => _mode;
  AppTheme({ThemeMode mode = ThemeMode.light}) : _mode = mode;

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  late ThemeData myTheme = ThemeData(
      drawerTheme: myLightDrawerTheme(),
      colorScheme: myLightColorScheme(),
      appBarTheme: myLightAppBarTheme(),
      bottomNavigationBarTheme: myLightBottomNavBarTheme(),
      textTheme: myLightTextTheme());

  void toogleTheme(BuildContext ctx) {
    _mode = _mode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    if (sw == true) {
      sw = false; // LIDHT MODE
      myTheme = ThemeData(
          drawerTheme: myLightDrawerTheme(),
          colorScheme: myLightColorScheme(),
          appBarTheme: myLightAppBarTheme(),
          bottomNavigationBarTheme: myLightBottomNavBarTheme(),
          textTheme: myLightTextTheme());
    } else {
      sw = true; // DARK MODE
      myTheme = ThemeData(
          drawerTheme: myDarkDrawerTheme(),
          colorScheme: myDarkColorScheme(),
          appBarTheme: myDarkAppBarTheme(),
          bottomNavigationBarTheme: myDarkBottomNavBarTheme(),
          textTheme: myDarkTextTheme());
    }
    notifyListeners();
  }
}

/* LIGHT THEME */
/* LIGHT APP BAR */
AppBarTheme myLightAppBarTheme() {
  return const AppBarTheme(
      backgroundColor: CupertinoColors.systemGrey5,
      foregroundColor: CupertinoColors.black,
      titleTextStyle: TextStyle(
          color: CupertinoColors.black,
          fontFamily: 'CaviarDreams',
          fontSize: 20,
          fontWeight: FontWeight.bold));
}

/* LIGHT BOTTOM NAV BAR */
BottomNavigationBarThemeData myLightBottomNavBarTheme() {
  return BottomNavigationBarThemeData(
    backgroundColor: CupertinoColors.systemGrey5,
    selectedItemColor: CupertinoColors.black,
    unselectedItemColor: CupertinoColors.systemGrey2.darkColor,
  );
}

/* LIGHT DRAWER */
DrawerThemeData myLightDrawerTheme() {
  return const DrawerThemeData(
      backgroundColor: CupertinoColors.lightBackgroundGray);
}

/* LIGHT COLORSCHEME */
ColorScheme myLightColorScheme() {
  return ColorScheme.fromSwatch().copyWith(
      background: CupertinoColors.systemGrey5,
      primary: CupertinoColors.extraLightBackgroundGray,
      secondary: CupertinoColors.black,
      tertiary: const Color.fromARGB(255, 0, 185, 226),
      brightness: Brightness.light);
}

/* LIGHT TEXT THEME */
TextTheme myLightTextTheme() {
  return ThemeData.light().textTheme.copyWith(
      titleLarge: const TextStyle(
        fontFamily: 'CaviarDreams',
        fontSize: 25,
        fontWeight: FontWeight.bold,
        color: CupertinoColors.black,
      ),
      titleMedium: const TextStyle(
        fontFamily: 'CaviarDreams',
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: CupertinoColors.black,
      ),
      titleSmall: const TextStyle(
        fontFamily: 'CaviarDreams',
        fontSize: 15,
        fontWeight: FontWeight.bold,
        color: CupertinoColors.black,
      ),
      bodyLarge: const TextStyle(
          fontFamily: 'CaviarDreams',
          fontSize: 18,
          fontWeight: FontWeight.normal,
          color: CupertinoColors.black),
      bodyMedium: const TextStyle(
          fontFamily: 'CaviarDreams',
          fontSize: 13,
          fontWeight: FontWeight.normal,
          color: CupertinoColors.black),
      bodySmall: const TextStyle(
          fontFamily: 'CaviarDreams',
          fontSize: 11,
          fontWeight: FontWeight.normal,
          color: CupertinoColors.black),
      headlineLarge: const TextStyle(
          color: CupertinoColors.black,
          fontFamily: 'CaviarDreams',
          fontSize: 18,
          fontWeight: FontWeight.normal),
      headlineMedium: const TextStyle(
          color: CupertinoColors.black,
          fontFamily: 'CaviarDreams',
          fontSize: 16,
          fontWeight: FontWeight.normal),
      headlineSmall: const TextStyle(
          color: CupertinoColors.black,
          fontFamily: 'CaviarDreams',
          fontSize: 14,
          fontWeight: FontWeight.normal),
      labelLarge: const TextStyle(
          color: CupertinoColors.black,
          fontFamily: 'RobotoCondensed',
          fontSize: 18,
          fontWeight: FontWeight.normal),
      labelMedium: const TextStyle(
          color: CupertinoColors.black,
          fontFamily: 'RobotoCondensed',
          fontSize: 16,
          fontWeight: FontWeight.normal),
      labelSmall: const TextStyle(
          color: CupertinoColors.black,
          fontFamily: 'RobotoCondensed',
          fontSize: 14,
          fontWeight: FontWeight.normal));
}

/* DARK THEME */
/* DARK APP BAR */
AppBarTheme myDarkAppBarTheme() {
  return const AppBarTheme(
      backgroundColor: CupertinoColors.black,
      foregroundColor: CupertinoColors.systemGrey5,
      titleTextStyle: TextStyle(
          color: CupertinoColors.systemGrey5,
          fontFamily: 'CaviarDreams',
          fontSize: 20,
          fontWeight: FontWeight.bold));
}

/* DARK BOTTOM NAV BAR */
BottomNavigationBarThemeData myDarkBottomNavBarTheme() {
  return BottomNavigationBarThemeData(
      backgroundColor: CupertinoColors.black,
      selectedItemColor: CupertinoColors.systemGrey5,
      unselectedItemColor: CupertinoColors.systemGrey2.darkColor);
}

/* DARK DRAWER */
DrawerThemeData myDarkDrawerTheme() {
  return const DrawerThemeData(
      backgroundColor: CupertinoColors.darkBackgroundGray);
}

/* DARK COLORSCHEME */
ColorScheme myDarkColorScheme() {
  return ColorScheme.fromSwatch().copyWith(
      background: CupertinoColors.black,
      primary: CupertinoColors.systemGrey6.darkHighContrastColor,
      secondary: CupertinoColors.white,
      tertiary: const Color.fromARGB(255, 0, 185, 226),
      brightness: Brightness.light);
}

/* DARK TEXT THEME */
TextTheme myDarkTextTheme() {
  return ThemeData.light().textTheme.copyWith(
      titleLarge: const TextStyle(
        fontFamily: 'CaviarDreams',
        fontSize: 25,
        fontWeight: FontWeight.bold,
        color: CupertinoColors.white,
      ),
      titleMedium: const TextStyle(
        fontFamily: 'CaviarDreams',
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: CupertinoColors.white,
      ),
      titleSmall: const TextStyle(
        fontFamily: 'CaviarDreams',
        fontSize: 15,
        fontWeight: FontWeight.bold,
        color: CupertinoColors.white,
      ),
      bodyLarge: const TextStyle(
          fontFamily: 'CaviarDreams',
          fontSize: 18,
          fontWeight: FontWeight.normal,
          color: CupertinoColors.white),
      bodyMedium: const TextStyle(
          fontFamily: 'CaviarDreams',
          fontSize: 13,
          fontWeight: FontWeight.normal,
          color: CupertinoColors.white),
      bodySmall: const TextStyle(
          fontFamily: 'CaviarDreams',
          fontSize: 11,
          fontWeight: FontWeight.normal,
          color: CupertinoColors.white),
      headlineLarge: const TextStyle(
          color: CupertinoColors.white,
          fontFamily: 'CaviarDreams',
          fontSize: 18,
          fontWeight: FontWeight.normal),
      headlineMedium: const TextStyle(
          color: CupertinoColors.white,
          fontFamily: 'CaviarDreams',
          fontSize: 16,
          fontWeight: FontWeight.normal),
      headlineSmall: const TextStyle(
          color: CupertinoColors.white,
          fontFamily: 'CaviarDreams',
          fontSize: 14,
          fontWeight: FontWeight.normal),
      labelLarge: const TextStyle(
          color: CupertinoColors.white,
          fontFamily: 'RobotoCondensed',
          fontSize: 18,
          fontWeight: FontWeight.normal),
      labelMedium: const TextStyle(
          color: CupertinoColors.white,
          fontFamily: 'RobotoCondensed',
          fontSize: 16,
          fontWeight: FontWeight.normal),
      labelSmall: const TextStyle(
          color: CupertinoColors.white,
          fontFamily: 'RobotoCondensed',
          fontSize: 14,
          fontWeight: FontWeight.normal));
}
