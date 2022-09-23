import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/number_symbols_data.dart';
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
  // bikeData: BikeData(
  //     id: '',
  //     costs: 0,
  //     isSelected: false,
  //     model: '',
  //     riddenSincePurchased: 0,
  //     riddenWithLastRefill: 0,
  //     totalKmRidden: 0,
  //     fuelConsumptions: []));
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
        // await Provider.of<MyBikes>(context, listen: false).updateBike(
        //     _fc.bikeData.id,
        //     BikeData(
        //         id: _fc.bikeData.id,
        //         isSelected: _fc.bikeData.isSelected,
        //         model: _fc.bikeData.model,
        //         costs: _fc.bikeData.costs,
        //         totalKmRidden: _fc.dashKm,
        //         riddenSincePurchased: _fc.bikeData.riddenSincePurchased +
        //             (_fc.dashKm - _fc.bikeData.totalKmRidden),
        //         riddenWithLastRefill: _fc.dashKm - _fc.bikeData.totalKmRidden,
        //         fuelConsumptions: _fc.bikeData.fuelConsumptions));
      } catch (error) {
        await showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: const Text('An error occured..!'),
            content: Text(
              error.toString(),
              style: TextStyle(color: Colors.black),
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
                      CupertinoFormRow(
                        prefix: Text(
                          'Fuel type',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        child: CupertinoTextFormFieldRow(
                          style: Theme.of(context).textTheme.labelLarge,
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
                                kmRidden: _fc.kmRidden,
                                // bikeData: currentBike,
                                bikeId: _fc.bikeId);
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                        ),
                      ),
                      CustomDatePicker(
                          ctx: context,
                          selectedDate: selectedDate,
                          dateTime: _dateTime,
                          initValues: _initValues,
                          editing: _editing),
                      CupertinoFormRow(
                        prefix: Text(
                          'Price',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        child: CupertinoTextFormFieldRow(
                          style: Theme.of(context).textTheme.labelLarge,
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
                                kmRidden: _fc.kmRidden,
                                // bikeData: _fc.bikeData,
                                bikeId: _fc.bikeId);
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
                      ),
                      CupertinoFormRow(
                        prefix: Text(
                          'Volume',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        child: CupertinoTextFormFieldRow(
                          style: Theme.of(context).textTheme.labelLarge,
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
                                kmRidden: _fc.kmRidden,
                                // bikeData: _fc.bikeData,
                                bikeId: _fc.bikeId);
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
                      ),
                      CupertinoFormRow(
                        prefix: Text(
                          'KM',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        child: CupertinoTextFormFieldRow(
                          style: Theme.of(context).textTheme.labelLarge,
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
                                pricePerLitter: _fc.price / _fc.volume,
                                volume: _fc.volume,
                                dashKm: double.parse(value!),
                                kmRidden: _fc.kmRidden,
                                bikeId: _fc.bikeId);
                            // bikeData: BikeData(
                            //     id: _fc.bikeData.id,
                            //     isSelected: _fc.bikeData.isSelected,
                            //     model: _fc.bikeData.model,
                            //     costs: _fc.bikeData.costs + _fc.price,
                            //     totalKmRidden: _fc.bikeData.totalKmRidden +
                            //         _fc.kmRidden,
                            //     riddenSincePurchased:
                            //         _fc.bikeData.riddenSincePurchased +
                            //             _fc.kmRidden,
                            //     riddenWithLastRefill: _fc.kmRidden,
                            //     fuelConsumptions:
                            //         _fc.bikeData.fuelConsumptions));
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
                  margin: const EdgeInsets.all(8),
                  width: double.infinity,
                  child: CupertinoButton(
                      color: Theme.of(context).colorScheme.secondary,
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
