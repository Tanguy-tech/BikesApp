import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:motobox/providers/my_bikes.dart';
import 'package:motobox/screens/my_bike/new_bike_form_screen.dart';
import 'package:motobox/widgets/bike_widgets/my_bikes_list.dart';

import '../widgets/app_widgets/main_drawer.dart';

class MyProfileScreen extends StatelessWidget {
  static const routeName = '/my_profile';
  const MyProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      drawer: const MainDrawer(),
      endDrawerEnableOpenDragGesture: true,
      appBar: CupertinoNavigationBar(
        border: const Border(bottom: BorderSide(color: Colors.transparent)),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
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
        middle: Text("My profile",
            style: TextStyle(
                color: Theme.of(context).appBarTheme.foregroundColor)),
        trailing: CupertinoButton(
          padding: const EdgeInsets.all(0),
          onPressed: () {
            Navigator.of(context).pushNamed(NewBikeFormScreen.routeName);
          },
          child: Icon(CupertinoIcons.add,
              color: Theme.of(context).appBarTheme.foregroundColor),
        ),
      ),
      body: const MyBikesList(),
    );
  }
}
