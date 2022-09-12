import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:motobox/providers/fuel_consumptions.dart';
import 'package:motobox/providers/invoices.dart';
import 'package:motobox/widgets/fuel_refill_form.dart';
import 'package:motobox/widgets/invoice_form.dart';
import 'package:provider/provider.dart';

const List<String> types = <String>['Fuel refill', 'Invoice'];

class AddItemForm extends StatefulWidget {
  const AddItemForm({Key? key}) : super(key: key);

  @override
  State<AddItemForm> createState() => _AddItemFormState();
}

class _AddItemFormState extends State<AddItemForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();
  String dropdownValue = types.first;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Theme.of(context).backgroundColor),
                padding: const EdgeInsets.all(5),
                margin: const EdgeInsets.all(10),
                child: DropdownButton<String>(
                  dropdownColor: Theme.of(context).canvasColor,
                  iconSize: 20,
                  isExpanded: true,
                  value: dropdownValue,
                  icon: const Icon(Icons.arrow_downward,
                      color: Color.fromARGB(255, 34, 34, 34)),
                  onChanged: (String? value) {
                    // This is called when the user selects an item.
                    setState(() {
                      dropdownValue = value!;
                    });
                  },
                  items: types.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value,
                          style: const TextStyle(
                              color: Color.fromARGB(255, 34, 34, 34),
                              fontSize: 15)),
                    );
                  }).toList(),
                ),
              ),
              if (dropdownValue == types.first)
                ChangeNotifierProvider(
                    create: (_) => FuelConsumptions(),
                    builder: (context, child) => FuelRefillForm(_formKey)),
              if (dropdownValue == types.last)
                ChangeNotifierProvider(
                    create: (_) => Invoices(),
                    builder: (context, child) => InvoiceForm(_formKey)),
            ],
          ),
        ));
  }
}
