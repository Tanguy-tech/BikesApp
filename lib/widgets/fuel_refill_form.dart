import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:meals_app/models/fuel_consumption.dart';
import 'package:meals_app/screens/garage_screen.dart';

class FuelRefillForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  const FuelRefillForm(this.formKey, {Key? key}) : super(key: key);

  @override
  State<FuelRefillForm> createState() => _FuelRefillFormState();
}

class _FuelRefillFormState extends State<FuelRefillForm> {
  FuelConsumption fc = FuelConsumption(
      id: 'id',
      fuelType: 'fuelType',
      date: DateTime.now(),
      price: 0.0,
      pricePerLitter: 0.0,
      volume: 0.0,
      dashKm: 0.0);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15), color: Colors.pink),
          padding: const EdgeInsets.all(5),
          margin: const EdgeInsets.all(10),
          child: TextFormField(
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            onSaved: (String? value) {
              fc.fuelType = value!;
            },
            decoration: const InputDecoration(hintText: "Fuel type"),
          ),
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15), color: Colors.pink),
          padding: const EdgeInsets.all(5),
          margin: const EdgeInsets.all(10),
          child: TextFormField(
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            onSaved: (String? value) {
              fc.date = value! as DateTime;
            },
            decoration: const InputDecoration(hintText: "Date"),
          ),
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15), color: Colors.pink),
          padding: const EdgeInsets.all(5),
          margin: const EdgeInsets.all(10),
          child: TextFormField(
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            onSaved: (String? value) {
              fc.price = value! as double;
            },
            decoration: const InputDecoration(hintText: "Price"),
          ),
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15), color: Colors.pink),
          padding: const EdgeInsets.all(5),
          margin: const EdgeInsets.all(10),
          child: TextFormField(
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            onSaved: (String? value) {
              fc.volume = value! as double;
            },
            decoration: const InputDecoration(hintText: "Volume"),
          ),
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15), color: Colors.pink),
          padding: const EdgeInsets.all(5),
          margin: const EdgeInsets.all(10),
          child: TextFormField(
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            onSaved: (String? value) {
              fc.dashKm = value! as double;
            },
            decoration: const InputDecoration(hintText: "Dashboard km"),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            // Validate returns true if the form is valid, or false otherwise.
            if (widget.formKey.currentState!.validate()) {
              widget.formKey.currentState?.save();
              // If the form is valid, display a snackbar. In the real world,
              // you'd often call a server or save the information in a database.
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Processing Data')),
              );
              Navigator.pushReplacementNamed(context, MyGarageScreen.routeName);
            }
          },
          child: const Text('Add Refill'),
        ),
      ],
    );
  }
}
