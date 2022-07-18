import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:meals_app/screens/myGarage_screen.dart';
import 'package:meals_app/widgets/add_brand_form.dart';

class NavBarMenu extends StatelessWidget {
  const NavBarMenu({Key? key}) : super(key: key);

  void _goToGarage(BuildContext context) {
    Navigator.of(context).pushNamed(MyGarageScreen.routeName);
  }

  void _addBrand(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        content: AddBrandForm(key: key),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      IconButton(
        icon: const Icon(Icons.add),
        iconSize: 30,
        onPressed: () => _addBrand(context),
      ),
      const SizedBox(width: 10),
      IconButton(
        icon: const Icon(Icons.motorcycle),
        iconSize: 30,
        onPressed: () => _goToGarage(context),
      )
    ]);
  }
}
