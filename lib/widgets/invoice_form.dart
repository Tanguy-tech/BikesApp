import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../providers/invoice.dart';
import '../providers/invoices.dart';

class InvoiceForm extends StatefulWidget {
  const InvoiceForm({Key? key}) : super(key: key);

  @override
  State<InvoiceForm> createState() => _InvoiceFormState();
}

class _InvoiceFormState extends State<InvoiceForm> {
  final _formKey = GlobalKey<FormState>();

  final _dateFocusNode = FocusNode();
  final _priceFocusNode = FocusNode();
  final _docFocusNode = FocusNode();
  final _imageViewerFocusNode = FocusNode();

  File? image;

  DateTime selectedDate = DateTime.now();

  DateTime _dateTime = DateTime.now();

  Future pickImage(ImageSource src) async {
    try {
      final image = await ImagePicker().pickImage(source: src);
      if (image == null) return;
      File tmpImage = File(image.path);
      tmpImage = await tmpImage.copy(tmpImage.path);
      setState(() {
        this.image = tmpImage;
      });
    } on Exception catch (e) {
      print('Failed to pick Image form gallery...');
    }
  }

  var _inv = Invoice(
      id: 'id',
      date: DateTime.now(),
      price: 0.0,
      photo: Image.asset('placeHolder.png'),
      title: 'default');

  @override
  void dispose() {
    _dateFocusNode.dispose();
    _priceFocusNode.dispose();
    _docFocusNode.dispose();
    _imageViewerFocusNode.dispose();
    super.dispose();
  }

  void _saveForm() {
    final form = _formKey.currentState;
    final isValid = form!.validate();
    if (!isValid) {
      return;
    }
    form.save();
    Provider.of<Invoices>(context, listen: false).addInvoice(_inv);
    Navigator.of(context).pop();
    // If the form is valid, display a snackbar. In the real world,
    // you'd often call a server or save the information in a database.
    // ScaffoldMessenger.of(context).showSnackBar(
    //    const SnackBar(content: Text('Processing Data')),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(children: [
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
                  return 'Please enter a valid title';
                }
                return null;
              },
              onSaved: (value) {
                _inv = Invoice(
                    id: _inv.id,
                    title: value!,
                    date: _inv.date,
                    price: _inv.price,
                    photo: _inv.photo);
              },
              decoration: const InputDecoration(
                hintText: "Title",
                hintStyle: TextStyle(
                    color: Color.fromARGB(255, 34, 34, 34),
                    fontSize: 15,
                    fontWeight: FontWeight.w600),
              ),
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (_) {
                FocusScope.of(context).requestFocus(_dateFocusNode);
              },
            ),
          ),
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
                style: const TextStyle(
                    color: Color.fromARGB(255, 34, 34, 34),
                    fontWeight: FontWeight.w500),
              ),
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
                  return 'Please enter a price..';
                }
                if (double.tryParse(value!) == null) {
                  return 'Please enter a valide price';
                }
                return null;
              },
              onSaved: (value) {
                _inv = Invoice(
                    id: _inv.id,
                    title: _inv.title,
                    date: _inv.date,
                    price: double.parse(value!),
                    photo: _inv.photo);
              },
              decoration: const InputDecoration(
                hintText: "Price",
                hintStyle: TextStyle(
                    color: Color.fromARGB(255, 34, 34, 34),
                    fontSize: 15,
                    fontWeight: FontWeight.w600),
              ),
              textInputAction: TextInputAction.next,
              keyboardType: const TextInputType.numberWithOptions(
                  signed: true, decimal: true),
              focusNode: _priceFocusNode,
              // onFieldSubmitted: (_) {
              //   FocusScope.of(context).requestFocus(_imageViewerFocusNode);
              // },
            ),
          ),
          FormField(
            builder: (field) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 10, right: 10),
                  child: ElevatedButton(
                      onPressed: () => pickImage(ImageSource.gallery),
                      child: const Text('Pick from gallery')),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 10, right: 10),
                  child: ElevatedButton(
                      onPressed: () => pickImage(ImageSource.camera),
                      child: const Text('Pick from camera')),
                ),
              ],
            ),
            onSaved: (value) {
              _inv = Invoice(
                  id: _inv.id,
                  title: _inv.title,
                  date: _inv.date,
                  price: _inv.price,
                  photo: _inv.photo);
            },
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Theme.of(context).backgroundColor),
            padding: const EdgeInsets.all(5),
            margin: const EdgeInsets.all(10),
            child: image != null
                ? Image.file(
                    image!,
                    //  width: constraints.maxWidth,
                    height: 200,
                  )
                : Image.asset(
                    'placeHolder.png',
                    // width: constraints.maxWidth,
                    height: 200,
                  ),
          ),
          Container(
            decoration: const BoxDecoration(
                color: Colors.green, shape: BoxShape.circle),
            child: IconButton(
              onPressed: () {
                _saveForm();
              },
              iconSize: 40,
              icon: const Icon(Icons.check),
            ),
          ),
        ]),
      ),
    );
  }
}
