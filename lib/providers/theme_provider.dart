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
  return AppBarTheme(
      backgroundColor: const Color.fromARGB(255, 161, 221, 250),
      foregroundColor: CupertinoColors.systemGrey6.darkHighContrastColor,
      titleTextStyle: TextStyle(
          color: CupertinoColors.systemGrey6.darkHighContrastColor,
          fontFamily: 'CaviarDreams',
          fontSize: 16,
          fontWeight: FontWeight.bold));
}

/* LIGHT BOTTOM NAV BAR */
BottomNavigationBarThemeData myLightBottomNavBarTheme() {
  return BottomNavigationBarThemeData(
    backgroundColor: const Color.fromARGB(255, 161, 221, 250),
    selectedItemColor: CupertinoColors.systemGrey6.darkHighContrastColor,
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
      background: CupertinoColors.secondarySystemBackground,
      primary: CupertinoColors.systemGrey3,
      secondary: CupertinoColors.systemGrey6.darkHighContrastColor,
      brightness: Brightness.light);
}

/* LIGHT TEXT THEME */
TextTheme myLightTextTheme() {
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
            color: CupertinoColors.secondaryLabel),
        bodyMedium: const TextStyle(
            fontFamily: 'CaviarDreams',
            fontSize: 13,
            fontWeight: FontWeight.normal,
            color: CupertinoColors.secondaryLabel),
        bodySmall: const TextStyle(
            fontFamily: 'CaviarDreams',
            fontSize: 11,
            fontWeight: FontWeight.normal,
            color: CupertinoColors.secondaryLabel),
        headlineLarge: TextStyle(
            color: CupertinoColors.systemGrey6.darkHighContrastColor,
            fontFamily: 'CaviarDreams',
            fontSize: 18,
            fontWeight: FontWeight.normal),
        headlineMedium: TextStyle(
            color: CupertinoColors.systemGrey6.darkHighContrastColor,
            fontFamily: 'CaviarDreams',
            fontSize: 16,
            fontWeight: FontWeight.normal),
        headlineSmall: TextStyle(
            color: CupertinoColors.systemGrey6.darkHighContrastColor,
            fontFamily: 'CaviarDreams',
            fontSize: 14,
            fontWeight: FontWeight.normal),
      );
}

/* DARK THEME */
/* DARK APP BAR */
AppBarTheme myDarkAppBarTheme() {
  return AppBarTheme(
      backgroundColor: CupertinoColors.systemGrey6.darkHighContrastColor,
      foregroundColor: const Color.fromARGB(255, 161, 221, 250),
      titleTextStyle: const TextStyle(
          color: Color.fromARGB(255, 161, 221, 250),
          fontFamily: 'CaviarDreams',
          fontSize: 16,
          fontWeight: FontWeight.bold));
}

/* DARK BOTTOM NAV BAR */
BottomNavigationBarThemeData myDarkBottomNavBarTheme() {
  return BottomNavigationBarThemeData(
      backgroundColor: CupertinoColors.systemGrey6.darkHighContrastColor,
      selectedItemColor: const Color.fromARGB(255, 161, 221, 250),
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
      background: CupertinoColors.secondarySystemBackground.darkColor,
      primary: CupertinoColors.systemGrey4.darkHighContrastColor,
      secondary: const Color.fromARGB(255, 161, 221, 250),
      brightness: Brightness.light);
}

/* DARK TEXT THEME */
TextTheme myDarkTextTheme() {
  return ThemeData.light().textTheme.copyWith(
        titleLarge: const TextStyle(
          fontFamily: 'CaviarDreams',
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: CupertinoColors.lightBackgroundGray,
        ),
        titleMedium: const TextStyle(
          fontFamily: 'CaviarDreams',
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: CupertinoColors.lightBackgroundGray,
        ),
        titleSmall: const TextStyle(
          fontFamily: 'CaviarDreams',
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: CupertinoColors.lightBackgroundGray,
        ),
        bodyLarge: const TextStyle(
            fontFamily: 'CaviarDreams',
            fontSize: 18,
            fontWeight: FontWeight.normal,
            color: CupertinoColors.inactiveGray),
        bodyMedium: const TextStyle(
            fontFamily: 'CaviarDreams',
            fontSize: 13,
            fontWeight: FontWeight.normal,
            color: CupertinoColors.inactiveGray),
        bodySmall: const TextStyle(
            fontFamily: 'CaviarDreams',
            fontSize: 11,
            fontWeight: FontWeight.normal,
            color: CupertinoColors.inactiveGray),
        headlineLarge: const TextStyle(
            color: Color.fromARGB(255, 161, 221, 250),
            fontFamily: 'CaviarDreams',
            fontSize: 18,
            fontWeight: FontWeight.normal),
        headlineMedium: const TextStyle(
            color: Color.fromARGB(255, 161, 221, 250),
            fontFamily: 'CaviarDreams',
            fontSize: 16,
            fontWeight: FontWeight.normal),
        headlineSmall: const TextStyle(
            color: Color.fromARGB(255, 161, 221, 250),
            fontFamily: 'CaviarDreams',
            fontSize: 14,
            fontWeight: FontWeight.normal),
      );
}
