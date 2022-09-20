import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:motobox/widgets/app_widgets/custom_date_picker.dart';
import 'package:provider/provider.dart';
import '../../providers/fuel_consumption.dart';
import '../../providers/fuel_consumptions.dart';

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
      id: '',
      fuelType: 'fuelType',
      date: DateTime.now(),
      price: 0.0,
      pricePerLitter: 0.0,
      volume: 0.0,
      dashKm: 0.0,
      kmRidden: 0.0);
  var _initValues = {
    'fuelType': '',
    'date': DateTime,
    'price': '',
    'pricePerLitter': '',
    'volume': '',
    'dashKm': '',
    'kmRidden': '',
  };
  var _isLoading = false;
  var _isInit = true;
  var _editing = false;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      final productId = ModalRoute.of(context)?.settings.arguments as String;
      if (productId != null) {
        _fc = Provider.of<FuelConsumptions>(context, listen: false)
            .findById(productId);
        _initValues = {
          'fuelType': _fc.fuelType,
          'date': _fc.date,
          'price': _fc.price.toString(),
          'pricePerLitter': _fc.pricePerLitter.toString(),
          'volume': _fc.volume.toString(),
          'dashKm': _fc.dashKm.toString(),
          'kmRidden': _fc.kmRidden.toString(),
        };
        _editing = true;
      }
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  Future<void> _saveForm() async {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    _formKey.currentState!.save();
    setState(() {
      _isLoading = true;
    });
    if (_fc.id != null && _fc.id != '') {
      await Provider.of<FuelConsumptions>(context, listen: false)
          .updateFuelConsumption(_fc.id, _fc);
    } else {
      try {
        await Provider.of<FuelConsumptions>(context, listen: false)
            .addFuelConsumption(_fc);
      } catch (error) {
        await showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: const Text('An error occured..!'),
            content: const Text('Something went wrong...'),
            actions: <Widget>[
              FloatingActionButton(
                child: const Text('ok'),
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
              )
            ],
          ),
        );
      }
    }
    setState(() {
      _isLoading = false;
    });
    Navigator.of(context).pop();
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
    return _isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Form(
            key: _formKey,
            child: ListView(
              children: [
                CupertinoFormSection.insetGrouped(
                    backgroundColor: Theme.of(context).canvasColor,
                    margin: const EdgeInsets.all(8),
                    children: [
                      CupertinoFormRow(
                        prefix: const Text('Fuel type'),
                        child: CupertinoTextFormFieldRow(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          initialValue: _initValues['fuelType'].toString(),
                          placeholder: 'Enter fuel type used',
                          textInputAction: TextInputAction.next,
                          onFieldSubmitted: (_) {
                            FocusScope.of(context).requestFocus(_dateFocusNode);
                          },
                          onSaved: (value) {
                            _fc = FuelConsumption(
                                //id: 'ongoing', // to set the id different of 'id' -> means _fc already exists
                                id: _fc.id,
                                fuelType: value!,
                                date: _fc.date,
                                price: _fc.price,
                                pricePerLitter: _fc.pricePerLitter,
                                volume: _fc.volume,
                                dashKm: _fc.dashKm,
                                kmRidden: _fc.kmRidden);
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                        ),
                      ),
                    ]),
                CupertinoFormSection.insetGrouped(
                    backgroundColor: Theme.of(context).canvasColor,
                    margin: const EdgeInsets.all(8),
                    children: [
                      CustomDatePicker(
                          ctx: context,
                          selectedDate: selectedDate,
                          dateTime: _dateTime,
                          initValues: _initValues,
                          editing: _editing)
                    ]),
                CupertinoFormSection.insetGrouped(
                    backgroundColor: Theme.of(context).canvasColor,
                    margin: const EdgeInsets.all(8),
                    children: [
                      CupertinoFormRow(
                        prefix: const Text('Price'),
                        child: CupertinoTextFormFieldRow(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          initialValue: _initValues['price'].toString(),
                          placeholder: 'Enter price',
                          textInputAction: TextInputAction.next,
                          focusNode: _priceFocusNode,
                          onFieldSubmitted: (_) {
                            FocusScope.of(context)
                                .requestFocus(_volumeFocusNode);
                          },
                          onSaved: (value) {
                            _fc = FuelConsumption(
                                //id: 'ongoing', // to set the id different of 'id' -> means _fc already exists
                                id: _fc.id,
                                fuelType: _fc.fuelType,
                                date: _fc.date,
                                price: double.parse(value!),
                                pricePerLitter: _fc.pricePerLitter,
                                volume: _fc.volume,
                                dashKm: _fc.dashKm,
                                kmRidden: _fc.kmRidden);
                          },
                          validator: (value) {
                            if (value?.isEmpty == true) {
                              return 'Please enter an amount';
                            }
                            if (double.tryParse(value!) == null) {
                              return 'Please enter a valid price';
                            }
                            return null;
                          },
                        ),
                      )
                    ]),
                CupertinoFormSection.insetGrouped(
                    backgroundColor: Theme.of(context).canvasColor,
                    margin: const EdgeInsets.all(8),
                    children: [
                      CupertinoFormRow(
                        prefix: const Text('Volume'),
                        child: CupertinoTextFormFieldRow(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          initialValue: _initValues['volume'].toString(),
                          placeholder: 'Enter volume',
                          textInputAction: TextInputAction.next,
                          onFieldSubmitted: (_) {
                            FocusScope.of(context).requestFocus(_dashFocusNode);
                          },
                          onSaved: (value) {
                            _fc = FuelConsumption(
                                //id: 'ongoing', // to set the id different of 'id' -> means _fc already exists
                                id: _fc.id,
                                fuelType: _fc.fuelType,
                                date: _fc.date,
                                price: _fc.price,
                                pricePerLitter: _fc.pricePerLitter,
                                volume: double.parse(value!),
                                dashKm: _fc.dashKm,
                                kmRidden: _fc.kmRidden);
                          },
                          validator: (value) {
                            if (value?.isEmpty == true) {
                              return 'Please enter an amount';
                            }
                            if (double.tryParse(value!) == null) {
                              return 'Please enter a valid volume amount';
                            }
                            return null;
                          },
                        ),
                      )
                    ]),
                CupertinoFormSection.insetGrouped(
                    backgroundColor: Theme.of(context).canvasColor,
                    margin: const EdgeInsets.all(8),
                    children: [
                      CupertinoFormRow(
                        prefix: const Text('KM'),
                        child: CupertinoTextFormFieldRow(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          initialValue: _initValues['dashKm'].toString(),
                          placeholder: 'Enter dashboard km',
                          textInputAction: TextInputAction.next,
                          onFieldSubmitted: (_) {
                            _saveForm();
                          },
                          onSaved: (value) {
                            _fc = FuelConsumption(
                                //id: 'ongoing', // to set the id different of 'id' -> means _fc already exists
                                id: _fc.id,
                                fuelType: _fc.fuelType,
                                date: _fc.date,
                                price: _fc.price,
                                pricePerLitter: _fc.pricePerLitter,
                                volume: _fc.volume,
                                dashKm: double.parse(value!),
                                kmRidden: _fc.kmRidden);
                          },
                          validator: (value) {
                            if (value?.isEmpty == true) {
                              return 'Please enter an amount';
                            }
                            if (double.tryParse(value!) == null) {
                              return 'Please enter a valid KM metric';
                            }
                            return null;
                          },
                        ),
                      )
                    ]),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  width: double.infinity,
                  child: CupertinoButton.filled(
                      onPressed: _saveForm, child: const Text('Submit')),
                )
              ],
            ),
          );
  }
}
