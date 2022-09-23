import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:motobox/providers/bike_data.dart';
import 'package:motobox/providers/my_bikes.dart';
import 'package:motobox/widgets/app_widgets/custom_date_picker.dart';
import 'package:provider/provider.dart';

class NewBikeForm extends StatefulWidget {
  const NewBikeForm({Key? key}) : super(key: key);

  @override
  State<NewBikeForm> createState() => _NewBikeFormState();
}

class _NewBikeFormState extends State<NewBikeForm> {
  final _formKey = GlobalKey<FormState>();
  final _dashFocusNode = FocusNode();
  var _bd = BikeData(
      id: '',
      isSelected: true,
      model: '',
      costs: 0.0,
      totalKmRidden: 0.0,
      riddenSincePurchased: 0.0,
      riddenWithLastRefill: 0.0,
      fuelConsumptions: []);
  var _initValues = {
    'isSelected': '',
    'model': '',
    'costs': '',
    'totalKmRidden': '',
    'riddenSincePurchased': '',
    'riddenWithLastRefill': '',
    'feulConsumptions': ''
  };
  var _isLoading = false;
  var _isInit = true;
  var _editing = false;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      final productId = ModalRoute.of(context)?.settings.arguments as String;
      if (productId != null) {
        _bd = Provider.of<MyBikes>(context, listen: false).findById(productId);
        _initValues = {
          'isSelected': _bd.isSelected.toString(),
          'model': _bd.model,
          'costs': _bd.costs.toString(),
          'totalKmRidden': _bd.totalKmRidden.toString(),
          'riddenSincePurchased': _bd.riddenSincePurchased.toString(),
          'riddenWithLastRefill': _bd.riddenWithLastRefill.toString(),
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
    if (_bd.id != null && _bd.id != '') {
      await Provider.of<MyBikes>(context, listen: false)
          .updateBike(_bd.id, _bd);
    } else {
      try {
        await Provider.of<MyBikes>(context, listen: false).addBike(_bd);
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
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        color: Theme.of(context).colorScheme.primary),
                    backgroundColor: Theme.of(context).colorScheme.background,
                    margin: const EdgeInsets.all(8),
                    // footer: Text(
                    //   'Switch to choose this bike as your favorite.',
                    //   style: Theme.of(context).textTheme.bodyMedium,
                    // ),
                    children: [
                      CupertinoFormRow(
                        prefix: Text(
                          'Bike model',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        child: CupertinoTextFormFieldRow(
                          style: Theme.of(context).textTheme.labelLarge,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          initialValue: _initValues['model'].toString(),
                          placeholder: 'Enter a bike model',
                          textInputAction: TextInputAction.next,
                          onFieldSubmitted: (_) {
                            FocusScope.of(context).requestFocus(_dashFocusNode);
                          },
                          onSaved: (value) {
                            _bd = BikeData(
                                //id: 'ongoing', // to set the id different of 'id' -> means _bd already exists
                                id: _bd.id,
                                isSelected: _bd.isSelected,
                                model: value!,
                                costs: _bd.costs,
                                totalKmRidden: _bd.totalKmRidden,
                                riddenSincePurchased: _bd.riddenSincePurchased,
                                riddenWithLastRefill: _bd.riddenWithLastRefill,
                                fuelConsumptions: _bd.fuelConsumptions);
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
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
                          initialValue: _initValues['totalKmRidden'].toString(),
                          placeholder: 'Enter Km on dashboard',
                          textInputAction: TextInputAction.next,
                          focusNode: _dashFocusNode,
                          onFieldSubmitted: (_) {
                            _saveForm();
                          },
                          onSaved: (value) {
                            _bd = BikeData(
                                //id: 'ongoing', // to set the id different of 'id' -> means _bd already exists
                                id: _bd.id,
                                isSelected: _bd.isSelected,
                                model: _bd.model,
                                costs: _bd.costs,
                                totalKmRidden: double.parse(value!),
                                riddenSincePurchased: _bd.riddenSincePurchased,
                                riddenWithLastRefill: _bd.riddenWithLastRefill,
                                fuelConsumptions: _bd.fuelConsumptions);
                          },
                          validator: (value) {
                            if (value?.isEmpty == true) {
                              return 'Please enter an amount';
                            }
                            if (double.tryParse(value!) == null) {
                              return 'Please enter valid km metrics';
                            }
                            return null;
                          },
                        ),
                      )
                    ]),
                Container(
                  padding: const EdgeInsets.only(left: 15, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Set as favorite'),
                      Transform.scale(
                        scale: .7,
                        child: CupertinoSwitch(
                            activeColor:
                                Theme.of(context).colorScheme.secondary,
                            value: _bd.isSelected,
                            onChanged: (bool? value) {
                              setState(() {
                                _bd.isSelected = value!;
                              });
                            }),
                      ),
                    ],
                  ),
                ),
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
