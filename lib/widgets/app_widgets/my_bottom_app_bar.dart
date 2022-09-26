import 'package:flutter/material.dart';
import 'package:motobox/widgets/app_widgets/dropup_button.dart';

class MyBottomAppBar extends StatelessWidget {
  final int index;
  final void Function(int)? selectedPage;
  final List<Map<String, Object>> pages;
  const MyBottomAppBar(this.index, this.selectedPage, this.pages, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      notchMargin: 5,
      color: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
      shape: const AutomaticNotchedShape(
          RoundedRectangleBorder(), StadiumBorder(side: BorderSide())),
      elevation: 0,
      child: BottomNavigationBar(
          backgroundColor: Theme.of(context)
              .bottomNavigationBarTheme
              .backgroundColor
              ?.withAlpha(0),
          elevation: 0,
          selectedItemColor:
              Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
          unselectedItemColor:
              Theme.of(context).bottomNavigationBarTheme.unselectedItemColor,
          currentIndex: index,
          //type: BottomNavigationBarType.shifting,
          onTap: selectedPage,
          items: [
            BottomNavigationBarItem(
                backgroundColor:
                    Theme.of(context).bottomNavigationBarTheme.backgroundColor,
                icon: const Icon(Icons.motorcycle),
                label: pages[0]["title"] as String),
            BottomNavigationBarItem(
                backgroundColor:
                    Theme.of(context).bottomNavigationBarTheme.backgroundColor,
                icon: const Icon(Icons.sell),
                label: pages[1]["title"] as String)
          ]),
    );
  }
}
