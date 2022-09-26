import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:motobox/screens/fuel_consumptions_screens/fuel_consumption_form_screen.dart';
import 'package:motobox/screens/invoices_screens/invoice_form_screen.dart';

class MyBottomAppBar extends StatelessWidget {
  final int index;
  final void Function(int)? selectedPage;
  final List<Map<String, Object>> pages;
  const MyBottomAppBar(this.index, this.selectedPage, this.pages, {Key? key})
      : super(key: key);

  void openFormMenu(BuildContext context) {
    showCupertinoModalPopup(
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
              Navigator.of(ctx).pushNamed(FuelConsrumptionFormScreen.routeName);
            },
            child: Text(
              'Add a Refill',
              style: TextStyle(
                  color: CupertinoColors.systemGrey6.darkHighContrastColor),
            ),
          ),
          CupertinoActionSheetAction(
            /// This parameter indicates the action would be a default
            /// defualt behavior, turns the action's text to bold text.
            isDefaultAction: false,
            onPressed: () {
              Navigator.of(ctx).pushNamed(InvoiceFormScreen.routeName);
            },
            child: Text(
              'Add an Invoice',
              style: TextStyle(
                  color: CupertinoColors.systemGrey6.darkHighContrastColor),
            ),
          ),
        ],
      ),
    );
  }

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
          // onTap: (int idx) {
          //   if (idx == 2) {
          //     selectedPage!(idx - 1);
          //   } else {
          //     selectedPage!(idx);
          //   }
          // },
          onTap: (int idx) => selectedPage!(idx),
          items: [
            BottomNavigationBarItem(
                backgroundColor:
                    Theme.of(context).bottomNavigationBarTheme.backgroundColor,
                icon: const Icon(Icons.motorcycle),
                label: pages[0]["title"] as String),
            // BottomNavigationBarItem(icon: DropUpButton(context), label: ''),
            BottomNavigationBarItem(
                backgroundColor:
                    Theme.of(context).bottomNavigationBarTheme.backgroundColor,
                icon: const Icon(Icons.content_copy),
                label: pages[1]["title"] as String)
          ]),
    );
    // return ConvexAppBar(
    //     cornerRadius: 0,
    //     curveSize: 180,
    //     color: Theme.of(context).bottomNavigationBarTheme.unselectedItemColor,
    //     activeColor:
    //         Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
    //     style: TabStyle.fixedCircle,
    //     initialActiveIndex: 2,
    //     height: 50,
    //     backgroundColor:
    //         Theme.of(context).bottomNavigationBarTheme.backgroundColor,
    //     items: [
    //       const TabItem(icon: Icons.motorcycle, title: 'Garage'),
    //       TabItem(
    //         icon: Padding(
    //           padding: const EdgeInsets.all(8.0),
    //           child: CupertinoButton(
    //               color: Theme.of(context).colorScheme.tertiary,
    //               padding: const EdgeInsets.all(0),
    //               borderRadius: BorderRadius.circular(40.0),
    //               child: const Icon(CupertinoIcons.add),
    //               onPressed: () => openFormMenu(context)),
    //         ),
    //       ),
    //       const TabItem(icon: Icons.sell, title: 'Expenses')
    //     ],
    //     onTap: (int idx) {
    //       if (idx == 0) {
    //         selectedPage!(0);
    //       } else if (idx == 2) {
    //         selectedPage!(1);
    //       }
    // });
  }
}
