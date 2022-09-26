// ignore_for_file: prefer_final_fields

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:motobox/widgets/app_widgets/custom_date_picker.dart';
import 'package:provider/provider.dart';
import '../../../providers/invoice.dart';
import '../../../providers/invoices.dart';

class InvoiceForm extends StatefulWidget {
  const InvoiceForm({Key? key}) : super(key: key);

  @override
  State<InvoiceForm> createState() => _InvoiceFormState();
}

class _InvoiceFormState extends State<InvoiceForm> {
  final _formKey = GlobalKey<FormState>();
  final _dateFocusNode = FocusNode();
  final _priceFocusNode = FocusNode();
  DateTime selectedDate = DateTime.now();
  DateTime _dateTime = DateTime.now();
  var _inv = Invoice(
      id: '',
      date: DateTime.now(),
      price: 0.0,
      //photo: Image.asset('placeHolder.png'),
      title: 'default');
  var _initValues = {
    'title': '',
    'date': DateTime,
    'price': '',
    'pricePerLitter': '',
  };
  var _isLoading = false;
  var _isInit = true;
  var _editing = false;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      final productId = ModalRoute.of(context)?.settings.arguments as String;
      if (productId != null) {
        _inv =
            Provider.of<Invoices>(context, listen: false).findById(productId);
        _initValues = {
          'title': _inv.title,
          'date': _inv.date,
          'price': _inv.price.toString(),
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
    if (_inv.id != null && _inv.id != '') {
      await Provider.of<Invoices>(context, listen: false)
          .updateInvoice(_inv.id, _inv);
    } else {
      try {
        await Provider.of<Invoices>(context, listen: false).addInvoice(_inv);
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
    //_docFocusNode.dispose();
    //_imageViewerFocusNode.dispose();
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
            child: Padding(
              padding: const EdgeInsets.all(8.0),
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
                        'Create or edit an invoice. Price in €.',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      children: [
                        CupertinoFormRow(
                          prefix: Text(
                            'Title',
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                          child: CupertinoTextFormFieldRow(
                            cursorColor:
                                Theme.of(context).colorScheme.secondary,
                            style: Theme.of(context).textTheme.labelLarge,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            initialValue: _initValues['title'].toString(),
                            placeholder: 'Enter a title / invoice content',
                            placeholderStyle:
                                Theme.of(context).textTheme.headlineMedium,
                            textInputAction: TextInputAction.next,
                            onFieldSubmitted: (_) {
                              FocusScope.of(context)
                                  .requestFocus(_dateFocusNode);
                            },
                            onSaved: (value) {
                              _inv = Invoice(
                                //id: 'ongoing', // to set the id different of 'id' -> means _inv already exists
                                id: _inv.id,
                                title: value!,
                                date: _inv.date,
                                price: _inv.price,
                              );
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
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                          child: CupertinoTextFormFieldRow(
                            cursorColor:
                                Theme.of(context).colorScheme.secondary,
                            style: Theme.of(context).textTheme.labelLarge,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            initialValue: _initValues['price'].toString(),
                            placeholder: 'Enter price',
                            placeholderStyle:
                                Theme.of(context).textTheme.headlineMedium,
                            textInputAction: TextInputAction.next,
                            focusNode: _priceFocusNode,
                            onFieldSubmitted: (_) {
                              _saveForm();
                            },
                            onSaved: (value) {
                              _inv = Invoice(
                                //id: 'ongoing', // to set the id different of 'id' -> means _inv already exists
                                id: _inv.id,
                                title: _inv.title,
                                date: _inv.date,
                                price: double.parse(value!),
                              );
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
            ),
          );
  }
}
