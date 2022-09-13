import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:motobox/widgets/save_form_button.dart';
import 'package:provider/provider.dart';

import '../providers/fuel_consumption.dart';
import '../providers/fuel_consumptions.dart';

class FuelConsumptionForm extends StatefulWidget {
  const FuelConsumptionForm({Key? key}) : super(key: key);

  @override
  State<FuelConsumptionForm> createState() => _FuelConsumptionFormState();
}

class _FuelConsumptionFormState extends State<FuelConsumptionForm> {
  final _formKey = GlobalKey<FormState>();

  final _dateFocusNode = FocusNode();
  final _priceFocusNode = FocusNode();
  final _volumeFocusNode = FocusNode();
  final _dashFocusNode = FocusNode();

  DateTime selectedDate = DateTime.now();

  DateTime _dateTime = DateTime.now();

  var _fc = FuelConsumption(
      id: 'id',
      fuelType: 'fuelType',
      date: DateTime.now(),
      price: 0.0,
      pricePerLitter: 0.0,
      volume: 0.0,
      dashKm: 0.0);

  void _saveForm() {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    _formKey.currentState!.save();
    //print('TYPE : _fc.fuelType - PRICE : ${_fc.price} - VOL : ${_fc.volume}');
    Provider.of<FuelConsumptions>(context, listen: false)
        .addFuelConsumption(_fc);
    Navigator.of(context).pop();
    // If the form is valid, display a snackbar. In the real world,
    // you'd often call a server or save the information in a database.
    // ScaffoldMessenger.of(context).showSnackBar(
    //   const SnackBar(content: Text('Processing Data')),
    // );
  }

  @override
  void dispose() {
    _dateFocusNode.dispose();
    _priceFocusNode.dispose();
    _volumeFocusNode.dispose();
    _dashFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Theme.of(context).backgroundColor),
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
                onSaved: (value) {
                  _fc = FuelConsumption(
                      id: _fc.id,
                      fuelType: value!,
                      date: _fc.date,
                      price: _fc.price,
                      pricePerLitter: _fc.pricePerLitter,
                      volume: _fc.volume,
                      dashKm: _fc.dashKm);
                },
                decoration: InputDecoration(
                  hintText: "Fuel type",
                  hintStyle: TextStyle(
                      color: Theme.of(context).textTheme.labelSmall?.color,
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                ),
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_dateFocusNode);
                },
              ),
            ),
            //Platform.isIOS ?
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Theme.of(context).backgroundColor),
              child: CupertinoButton(
                borderRadius: BorderRadius.circular(15),
                color: Theme.of(context).backgroundColor,
                // focusNode: _dateFocusNode,
                // style: const ButtonStyle(alignment: Alignment.centerLeft),
                onPressed: () {
                  showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime.now())
                      .then((date) {
                    setState(() {
                      _dateTime = date!;
                    });
                  });
                },
                child: Text(
                  _dateTime == null
                      ? 'Select a date'
                      : 'Select a date :   ${DateFormat('dd - MM - yy').format(_dateTime)}',
                  style: TextStyle(
                      color: Theme.of(context).textTheme.labelSmall?.color,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
            //],
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Theme.of(context).backgroundColor),
              padding: const EdgeInsets.all(5),
              margin: const EdgeInsets.all(10),
              child: TextFormField(
                // The validator receives the text that the user has entered.
                validator: (value) {
                  if (value?.isEmpty == true) {
                    return 'Please enter some text';
                  }
                  if (double.tryParse(value!) == null) {
                    return 'Please enter a valid price';
                  }
                  return null;
                },
                onSaved: (value) {
                  _fc = FuelConsumption(
                      id: _fc.id,
                      fuelType: _fc.fuelType,
                      date: _fc.date,
                      price: double.parse(value!),
                      pricePerLitter: _fc.pricePerLitter,
                      volume: _fc.volume,
                      dashKm: _fc.dashKm);
                },
                decoration: InputDecoration(
                    hintText: "Price",
                    hintStyle: TextStyle(
                        color: Theme.of(context).textTheme.labelSmall?.color,
                        fontSize: 15,
                        fontWeight: FontWeight.w600)),
                textInputAction: TextInputAction.next,
                keyboardType: const TextInputType.numberWithOptions(
                    signed: true, decimal: true),
                focusNode: _priceFocusNode,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_volumeFocusNode);
                },
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Theme.of(context).backgroundColor),
              padding: const EdgeInsets.all(5),
              margin: const EdgeInsets.all(10),
              child: TextFormField(
                // The validator receives the text that the user has entered.
                validator: (value) {
                  if (value?.isEmpty == true) {
                    return 'Please enter some text';
                  }
                  if (double.tryParse(value!) == null) {
                    return 'Please enter a valid volume amount';
                  }
                  return null;
                },
                onSaved: (value) {
                  _fc = FuelConsumption(
                      id: _fc.id,
                      fuelType: _fc.fuelType,
                      date: _fc.date,
                      price: _fc.price,
                      pricePerLitter: _fc.pricePerLitter,
                      volume: double.parse(value!),
                      dashKm: _fc.dashKm);
                },
                decoration: InputDecoration(
                    hintText: "Volume",
                    hintStyle: TextStyle(
                        color: Theme.of(context).textTheme.labelSmall?.color,
                        fontSize: 15,
                        fontWeight: FontWeight.w600)),
                textInputAction: TextInputAction.next,
                keyboardType: const TextInputType.numberWithOptions(
                    signed: true, decimal: true),
                focusNode: _volumeFocusNode,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_dashFocusNode);
                },
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Theme.of(context).backgroundColor),
              padding: const EdgeInsets.all(5),
              margin: const EdgeInsets.all(10),
              child: TextFormField(
                // The validator receives the text that the user has entered.
                validator: (value) {
                  if (value?.isEmpty == true) {
                    return 'Please enter some text';
                  }
                  if (double.tryParse(value!) == null) {
                    return 'Please enter a valid KM metric';
                  }
                  return null;
                },
                onSaved: (value) {
                  _fc = FuelConsumption(
                      id: _fc.id,
                      fuelType: _fc.fuelType,
                      date: _fc.date,
                      price: _fc.price,
                      pricePerLitter: _fc.pricePerLitter,
                      volume: _fc.volume,
                      dashKm: double.parse(value!));
                },
                decoration: InputDecoration(
                    hintText: "Dashboard km",
                    hintStyle: TextStyle(
                        color: Theme.of(context).textTheme.labelSmall?.color,
                        fontSize: 15,
                        fontWeight: FontWeight.w600)),
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  _saveForm();
                },
                keyboardType: const TextInputType.numberWithOptions(
                    signed: true, decimal: true),
                focusNode: _dashFocusNode,
              ),
            ),
            SaveFormButton(_saveForm)
          ],
        ),
      ),
    );
  }
}
