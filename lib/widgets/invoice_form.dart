import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meals_app/models/invoices.dart';

import '../screens/garage_screen.dart';

class InvoiceForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  const InvoiceForm(this.formKey, {Key? key}) : super(key: key);

  @override
  State<InvoiceForm> createState() => _InvoiceFormState();
}

class _InvoiceFormState extends State<InvoiceForm> {
  final _dateFocusNode = FocusNode();
  final _priceFocusNode = FocusNode();
  final _docFocusNode = FocusNode();

  File? image;

  Future pickImage(ImageSource src) async {
    try {
      final image = await ImagePicker().pickImage(source: src);
      if (image == null) return;
      final tmpImage = File(image.path);
      setState(() {
        this.image = tmpImage;
      });
    } on Exception catch (e) {
      print('Failed to pick Image form gallery...');
    }
  }

  Invoices fc = Invoices(
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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Column(
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
                fc.title = value!;
              },
              decoration: const InputDecoration(hintText: "Title"),
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (_) {
                FocusScope.of(context).requestFocus(_dateFocusNode);
              },
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
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.datetime,
              focusNode: _dateFocusNode,
              onFieldSubmitted: (_) {
                FocusScope.of(context).requestFocus(_priceFocusNode);
              },
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
              textInputAction: TextInputAction.next,
              keyboardType: const TextInputType.numberWithOptions(
                  signed: true, decimal: true),
              focusNode: _priceFocusNode,
              onFieldSubmitted: (_) {
                FocusScope.of(context).requestFocus(_dateFocusNode);
              },
            ),
          ),
          Row(
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
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15), color: Colors.pink),
            padding: const EdgeInsets.all(5),
            margin: const EdgeInsets.all(10),
            child: image != null
                ? Image.file(
                    image!,
                    width: constraints.maxWidth,
                    height: 200,
                  )
                : Image.asset(
                    'placeHolder.png',
                    width: constraints.maxWidth,
                    height: 200,
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
                Navigator.pushReplacementNamed(
                    context, MyGarageScreen.routeName);
              }
            },
            child: const Text('Add Invoice'),
          ),
        ],
      ),
    );
  }
}
