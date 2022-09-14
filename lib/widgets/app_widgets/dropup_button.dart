// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:cool_dropdown/cool_dropdown.dart';
import '../../screens/fuel_consumptions_screens/fuel_consumption_form_screen.dart';
import '../../screens/invoices_screens/invoice_form_screen.dart';

class DropUpButton extends StatefulWidget {
  BuildContext ctx;
  DropUpButton(this.ctx, {Key? key}) : super(key: key);

  @override
  State<DropUpButton> createState() => _DropUpButtonState();
}

List dropdownItemList = [
  {
    'label': 'Invoice',
    'value': InvoiceFormScreen.routeName
  }, // label is required and unique
  {'label': 'Refill', 'value': FuelConsrumptionFormScreen.routeName},
];

void addItem(BuildContext ctx, String route) {
  Navigator.of(ctx).pushNamed(route);
}

class _DropUpButtonState extends State<DropUpButton> {
  @override
  Widget build(BuildContext context) {
    return CoolDropdown(
      isAnimation: false,
      dropdownList: dropdownItemList,
      onChange: (selectedItem) => addItem(context, selectedItem['value']),
      defaultValue: dropdownItemList[0],
      dropdownItemMainAxis: MainAxisAlignment.center,
      dropdownPadding: EdgeInsets.zero,
      dropdownWidth: 100,
      dropdownHeight: 120,
      selectedItemTS:
          TextStyle(color: Theme.of(context).colorScheme.primary, fontSize: 20),
      selectedItemBD: const BoxDecoration(color: Colors.transparent),
      unselectedItemTS: TextStyle(
          color: Theme.of(context).colorScheme.secondary, fontSize: 20),
      isResultIconLabel: false,
      resultIcon: const Icon(Icons.add, color: Colors.white, size: 30),
      resultAlign: Alignment.center,
      resultMainAxis: MainAxisAlignment.center,
      resultHeight: 50,
      resultWidth: 50,
      resultBD: BoxDecoration(
          color: Colors.purpleAccent.shade400,
          borderRadius: BorderRadius.circular(50)),
      isTriangle: true,

      // placeholder: 'insert...',
    );
  }
}
