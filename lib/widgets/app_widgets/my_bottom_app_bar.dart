import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/theme_provider.dart';

class MyBottomAppBar extends StatelessWidget {
  final int index;
  final void Function(int)? selectedPage;
  final List<Map<String, Object>> pages;
  const MyBottomAppBar(this.index, this.selectedPage, this.pages, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<AppTheme>(context);
    return BottomAppBar(
      notchMargin: 5,
      color: theme.myTheme.bottomNavigationBarTheme.backgroundColor,
      shape: const AutomaticNotchedShape(
          RoundedRectangleBorder(), StadiumBorder(side: BorderSide())),
      elevation: 0,
      child: BottomNavigationBar(
          backgroundColor: theme
              .myTheme.bottomNavigationBarTheme.backgroundColor
              ?.withAlpha(0),
          elevation: 0,
          selectedItemColor:
              theme.myTheme.bottomNavigationBarTheme.selectedItemColor,
          unselectedItemColor:
              theme.myTheme.bottomNavigationBarTheme.unselectedItemColor,
          currentIndex: index,
          //type: BottomNavigationBarType.shifting,
          onTap: selectedPage,
          items: [
            BottomNavigationBarItem(
                backgroundColor: theme.myTheme.appBarTheme.backgroundColor,
                icon: const Icon(Icons.border_all_rounded),
                label: pages[0]["title"] as String),
            BottomNavigationBarItem(
                backgroundColor: theme.myTheme.appBarTheme.backgroundColor,
                icon: const Icon(Icons.favorite),
                label: pages[1]["title"] as String)
          ]),
    );
  }
}
