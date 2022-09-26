import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:motobox/providers/theme_provider.dart';
import 'package:motobox/screens/fuel_consumptions_screens/fuel_consumption_form_screen.dart';
import 'package:motobox/widgets/fuel_consumptions_widgets/fuel_consumption_list.dart';
import 'package:provider/provider.dart';
import '../../../widgets/app_widgets/main_drawer.dart';

class FuelConsumptionScreen extends StatelessWidget {
  const FuelConsumptionScreen({Key? key}) : super(key: key);

  static const routeName = "/fuelconsumptionScreen";

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<AppTheme>(context);
    return Scaffold(
      backgroundColor: theme.myTheme.colorScheme.background,
      drawer: const MainDrawer(),
      endDrawerEnableOpenDragGesture: true,
      appBar: CupertinoNavigationBar(
        border: const Border(bottom: BorderSide(color: Colors.transparent)),
        // backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        backgroundColor: Colors.transparent,
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
        middle: Text("My consumptions",
            style: TextStyle(
                color: Theme.of(context).appBarTheme.foregroundColor)),
        trailing: CupertinoButton(
          padding: const EdgeInsets.all(0),
          onPressed: () {
            Navigator.of(context)
                .pushNamed(FuelConsrumptionFormScreen.routeName);
          },
          child: Icon(CupertinoIcons.add,
              color: Theme.of(context).appBarTheme.foregroundColor),
        ),
      ),
      body: const FuelConsumptionList(isPreview: false),
    );
  }
}
