// ignore_for_file: use_build_context_synchronously
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:motobox/providers/bike_data.dart';
import 'package:motobox/providers/my_bikes.dart';
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
      kmRidden: 0.0,
      bikeId: '');
  var _bikeData = BikeData(
      id: '',
      costs: 0,
      isSelected: false,
      model: '',
      riddenSincePurchased: 0,
      riddenWithLastRefill: 0,
      totalKmRidden: 0);
  var _initValues = {
    'fuelType': '',
    'date': DateTime,
    'price': '',
    'pricePerLitter': '',
    'volume': '',
    'dashKm': '',
    // 'kmRidden': '',
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
          // 'kmRidden': _fc.kmRidden.toString(),
        };
        _editing = true;
      }
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  Future<void> _addFcAndUpdateBike(
      BuildContext context, FuelConsumption fc, BikeData currentBike) async {
    await Provider.of<FuelConsumptions>(context, listen: false)
        .addFuelConsumption(fc);
    await Provider.of<MyBikes>(context, listen: false)
        .updateBike(fc.bikeId, currentBike);
  }

  Future<void> _updateFcAndBike(
      BuildContext context, FuelConsumption fc, BikeData currentBike) async {
    await Provider.of<FuelConsumptions>(context, listen: false)
        .updateFuelConsumption(_fc.id, _fc);
    await Provider.of<MyBikes>(context, listen: false)
        .updateBike(fc.bikeId, currentBike);
  }

  Future<void> _showAlertDialog(Object error) async {
    await showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('An error occured..!'),
        content: Text(
          error.toString(),
          style: const TextStyle(color: Colors.black),
        ),
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
      _updateFcAndBike(context, _fc, _bikeData);
    } else {
      try {
        _addFcAndUpdateBike(context, _fc, _bikeData);
      } catch (error) {
        _showAlertDialog(error);
      }
    }
    setState(() {
      _isLoading = false;
    });
    Navigator.of(context).pop(); // esapce form
    Navigator.of(context).pop(); // escape dropup menu
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
    var tmp;
    BikeData currentBike = Provider.of<MyBikes>(context)
        .bikes
        .firstWhere((element) => element.isSelected == true);
    return _isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Form(
            key: _formKey,
            child: ListView(
              children: [
                CupertinoFormSection.insetGrouped(
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        color: Theme.of(context).colorScheme.primary),
                    backgroundColor: Theme.of(context).colorScheme.background,
                    margin: const EdgeInsets.all(8),
                    footer: Text(
                      'Create or edit a consumption. Price in €, Volume in L.',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    children: [
                      MyCupertinoFormRow(
                        isText: true,
                        _fc,
                        _bikeData,
                        (value) {
                          _fc = FuelConsumption(
                              //id: 'ongoing', // to set the id different of 'id' -> means _fc already exists
                              id: _fc.id,
                              fuelType: value!,
                              date: _fc.date,
                              price: _fc.price,
                              pricePerLitter: _fc.pricePerLitter,
                              volume: _fc.volume,
                              dashKm: _fc.dashKm,
                              kmRidden: _fc.kmRidden,
                              bikeId: _fc.bikeId);
                        },
                        fieldName: 'Fuel Type',
                        focusNode: _dateFocusNode,
                        initialValue: _initValues['fuelType'].toString(),
                        placeHolder: 'Enter fuel type used',
                        validatorText: 'Enter a valid text',
                        currentBike: currentBike,
                        trigger: (_) {
                          FocusScope.of(context).requestFocus(_dateFocusNode);
                        },
                      ),
                      CustomDatePicker(
                          ctx: context,
                          selectedDate: selectedDate,
                          dateTime: _dateTime,
                          initValues: _initValues,
                          editing: _editing),
                      MyCupertinoFormRow(
                        isText: false,
                        _fc,
                        _bikeData,
                        (value) {
                          _fc = FuelConsumption(
                              //id: 'ongoing', // to set the id different of 'id' -> means _fc already exists
                              id: _fc.id,
                              fuelType: _fc.fuelType,
                              date: _fc.date,
                              price: double.parse(value!),
                              pricePerLitter: _fc.pricePerLitter,
                              volume: _fc.volume,
                              dashKm: _fc.dashKm,
                              kmRidden: _fc.kmRidden,
                              bikeId: _fc.bikeId);
                        },
                        fieldName: 'Price',
                        focusNode: _priceFocusNode,
                        initialValue: _initValues['price'].toString(),
                        placeHolder: 'Enter the price',
                        validatorText: 'Enter a valid price',
                        currentBike: currentBike,
                        trigger: (_) {
                          FocusScope.of(context).requestFocus(_volumeFocusNode);
                        },
                      ),
                      MyCupertinoFormRow(
                        isText: false,
                        _fc,
                        _bikeData,
                        (value) {
                          _fc = FuelConsumption(
                              //id: 'ongoing', // to set the id different of 'id' -> means _fc already exists
                              id: _fc.id,
                              fuelType: _fc.fuelType,
                              date: _fc.date,
                              price: _fc.price,
                              pricePerLitter: _fc.pricePerLitter,
                              volume: double.parse(value!),
                              dashKm: _fc.dashKm,
                              kmRidden: _fc.kmRidden,
                              bikeId: _fc.bikeId);
                        },
                        fieldName: 'Volume',
                        focusNode: _volumeFocusNode,
                        initialValue: _initValues['volume'].toString(),
                        placeHolder: 'Enter the volume',
                        validatorText: 'Enter a valid amount',
                        currentBike: currentBike,
                        trigger: (_) {
                          FocusScope.of(context).requestFocus(_dashFocusNode);
                        },
                      ),
                      MyCupertinoFormRow(
                        isText: false,
                        _fc,
                        _bikeData,
                        (value) {
                          _fc = FuelConsumption(
                              //id: 'ongoing', // to set the id different of 'id' -> means _fc already exists
                              id: _fc.id,
                              fuelType: _fc.fuelType,
                              date: _fc.date,
                              price: _fc.price,
                              pricePerLitter: _fc.price / _fc.volume,
                              volume: _fc.volume,
                              dashKm: double.parse(value!),
                              kmRidden: double.parse(value) -
                                  currentBike.totalKmRidden,
                              bikeId: currentBike.id);
                          _bikeData = BikeData(
                              id: currentBike.id,
                              isSelected: currentBike.isSelected,
                              model: currentBike.model,
                              costs: currentBike.costs + _fc.price,
                              riddenWithLastRefill:
                                  _fc.dashKm - currentBike.totalKmRidden,
                              totalKmRidden: _fc.dashKm,
                              riddenSincePurchased:
                                  currentBike.riddenSincePurchased +
                                      _fc.kmRidden);
                        },
                        currentBike: currentBike,
                        fieldName: 'KM',
                        focusNode: _dashFocusNode,
                        initialValue: _initValues['dashKm'].toString(),
                        placeHolder: 'Enter dashboard km',
                        validatorText: 'Please enter a valid Km metric',
                        trigger: (_) {
                          _saveForm();
                        },
                      )
                    ]),
                Container(
                  margin: const EdgeInsets.all(8),
                  width: double.infinity,
                  child: CupertinoButton(
                      color: Theme.of(context).colorScheme.tertiary,
                      onPressed: _saveForm,
                      child: Text('Submit',
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.primary))),
                )
              ],
            ),
          );
  }
}

class MyCupertinoFormRow extends StatelessWidget {
  MyCupertinoFormRow(this.fc, this.bikeData, this.onSaved,
      {required this.isText,
      required this.fieldName,
      required this.focusNode,
      required this.initialValue,
      required this.placeHolder,
      required this.validatorText,
      required this.currentBike,
      required this.trigger});

  final bool isText;
  final String fieldName;
  final FocusNode focusNode;
  final String initialValue;
  final String placeHolder;
  final Function(String)? trigger;
  final Function(String?)? onSaved;
  FuelConsumption fc;
  BikeData bikeData;
  final String validatorText;
  final BikeData currentBike;

  @override
  Widget build(BuildContext context) {
    return CupertinoFormRow(
      prefix: Text(
        fieldName,
        style: Theme.of(context).textTheme.labelLarge,
      ),
      child: CupertinoTextFormFieldRow(
        cursorColor: Theme.of(context).colorScheme.secondary,
        style: Theme.of(context).textTheme.labelLarge,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        initialValue: initialValue,
        placeholder: placeHolder,
        placeholderStyle: Theme.of(context).textTheme.headlineMedium,
        textInputAction: TextInputAction.next,
        focusNode: focusNode,
        onFieldSubmitted: trigger,
        onSaved: onSaved,
        validator: (value) {
          if (value?.isEmpty == true) {
            return 'Please enter an amount';
          }
          if (!isText) {
            if (double.tryParse(value!) == null) {
              return validatorText;
            }
            return null;
          }
        },
      ),
    );
  }
}
