// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cool_dropdown/cool_dropdown.dart';
import '../../screens/fuel_consumptions_screens/fuel_consumption_form_screen.dart';
import '../../screens/invoices_screens/invoice_form_screen.dart';

class DropUpButton extends StatelessWidget {
  BuildContext ctx;
  DropUpButton(this.ctx, {Key? key}) : super(key: key);

//   @override
//   State<DropUpButton> createState() => _DropUpButtonState();
// }

// List dropdownItemList = [
//   {
//     'label': 'Invoice',
//     'value': InvoiceFormScreen.routeName
//   }, // label is required and unique
//   {'label': 'Refill', 'value': FuelConsrumptionFormScreen.routeName},
// ];

// void addItem(BuildContext ctx, String route) {
//   Navigator.of(ctx).pushNamed(route);
// }

// class _DropUpButtonState extends State<DropUpButton> {
  @override
  Widget build(BuildContext context) {
    return
        // CoolDropdown(
        //   isAnimation: false,
        //   dropdownList: dropdownItemList,
        //   onChange: (selectedItem) => addItem(context, selectedItem['value']),
        //   defaultValue: dropdownItemList[0],
        //   dropdownItemMainAxis: MainAxisAlignment.center,
        //   dropdownPadding: EdgeInsets.zero,
        //   dropdownWidth: 100,
        //   dropdownHeight: 120,
        //   selectedItemTS:
        //       TextStyle(color: Theme.of(context).colorScheme.primary, fontSize: 20),
        //   selectedItemBD: const BoxDecoration(color: Colors.transparent),
        //   unselectedItemTS: TextStyle(
        //       color: Theme.of(context).colorScheme.secondary, fontSize: 20),
        //   isResultIconLabel: false,
        //   resultIcon: const Icon(Icons.add, color: Colors.white, size: 30),
        //   resultAlign: Alignment.center,
        //   resultMainAxis: MainAxisAlignment.center,
        //   resultHeight: 50,
        //   resultWidth: 50,
        //   resultBD: BoxDecoration(
        //       color: Colors.purpleAccent.shade400,
        //       borderRadius: BorderRadius.circular(50)),
        //   isTriangle: true,
        //   // placeholder: 'insert...',
        // );
        Container(
      // decoration: BoxDecoration(
      //     borderRadius: BorderRadius.circular(30),
      //     gradient: LinearGradient(
      //       colors: [
      //         Colors.indigoAccent.shade700,
      //         Colors.tealAccent.shade700,
      //       ],
      //       begin: Alignment.topCenter,
      //       end: Alignment.bottomCenter,
      //     )),
      width: 100,
      height: 40,
      child: CupertinoButton(
        color: Theme.of(context).colorScheme.secondary,
        padding: const EdgeInsets.all(0),
        borderRadius: BorderRadius.circular(30.0),
        onPressed: () => showCupertinoModalPopup(
          context: context,
          builder: (BuildContext ctx) => CupertinoActionSheet(
            title: const Text('What are you adding?'),
            message: const Text('Choose what item type you want to add'),
            actions: <CupertinoActionSheetAction>[
              CupertinoActionSheetAction(
                /// This parameter indicates the action would be a default
                /// defualt behavior, turns the action's text to bold text.
                isDefaultAction: false,
                onPressed: () {
                  Navigator.of(ctx)
                      .pushNamed(FuelConsrumptionFormScreen.routeName);
                },
                child: const Text('Add a Refill'),
              ),
              CupertinoActionSheetAction(
                /// This parameter indicates the action would be a default
                /// defualt behavior, turns the action's text to bold text.
                isDefaultAction: false,
                onPressed: () {
                  Navigator.of(ctx).pushNamed(InvoiceFormScreen.routeName);
                },
                child: const Text('Add an Invoice'),
              ),
            ],
          ),
        ),
        child: Icon(CupertinoIcons.add,
            color: Theme.of(context).colorScheme.primary),
      ),
    );
  }
}
