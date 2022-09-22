import 'package:flutter/material.dart';
import 'package:motobox/providers/theme_provider.dart';
import 'package:motobox/widgets/bike_widgets/model_item.dart';
import 'package:provider/provider.dart';
import '../models/models.dart';

class BrandDetailsScreen extends StatelessWidget {
  static const routeName = '/brands';
  const BrandDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context)?.settings.arguments as List<Model>;
    bool isEmpty = false;
    if (routeArgs.isEmpty) {
      isEmpty = true;
    }
    final theme = Provider.of<AppTheme>(context);

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: LayoutBuilder(
          builder: ((context, constraints) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("${routeArgs[0].brand} "),
                SizedBox(
                  height: 40,
                  child: routeArgs[0].brandLogo,
                ),
              ],
            );
          }),
        ),
        actions: [
          Switch(
              onChanged: (value) => theme.toogleTheme(context), value: theme.sw)
        ],
      ),
      body: isEmpty
          ? Container(
              padding: const EdgeInsets.all(10),
              //child: const AddModel(),
            )
          : ListView(
              children: routeArgs
                  .map((modelData) => ModelItem(
                        id: modelData.id,
                        brand: modelData.brand,
                        name: modelData.name,
                        hp: modelData.hp,
                        manufacturedDate: modelData.manufacturedDate,
                        photo: modelData.photo,
                        brandLogo: modelData.brandLogo,
                        infos: modelData.infos,
                      ))
                  .toList(),
            ),
    );
  }
}
