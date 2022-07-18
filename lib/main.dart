import 'package:flutter/material.dart';
import 'package:meals_app/screens/brand_screen.dart';
import 'package:meals_app/screens/category_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyMeals',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSwatch().copyWith(secondary: Colors.amberAccent),
        canvasColor: const Color.fromARGB(255, 202, 202, 202),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
            bodyLarge: const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
            bodyMedium: const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
            titleLarge: const TextStyle(fontFamily: 'Raleway', fontSize: 25),
            titleMedium: const TextStyle(
                fontFamily: 'Raleway',
                fontSize: 20,
                fontWeight: FontWeight.bold),
            titleSmall: const TextStyle(fontFamily: 'Raleway', fontSize: 15)),
      ),
      home: CategoryScreen(key: key),
      routes: {
        BrandScreen.routeName: (ctx) => const BrandScreen(),
      },
    );
  }
}
