import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../providers/invoice.dart';
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
  final _imageViewerFocusNode = FocusNode();

  File? image;

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

  Invoice inv = Invoice(
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

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Column(
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
                  return 'Please enter a valid title';
                }
                return null;
              },
              onSaved: (value) {
                inv = Invoice(
                    id: inv.id,
                    title: value!,
                    date: inv.date,
                    price: inv.price,
                    photo: inv.photo);
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
            padding: const EdgeInsets.all(5),
            margin: const EdgeInsets.all(10),
            child: TextFormField(
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value?.isEmpty == true) {
                  return 'Please enter a date..';
                }
                if (DateTime.tryParse(value!) == null) {
                  return 'Please enter a valide date';
                }
                return null;
              },
              onSaved: (value) {
                inv = Invoice(
                    id: inv.id,
                    title: inv.title,
                    date: DateTime.parse(value!),
                    price: inv.price,
                    photo: inv.photo);
              },
              decoration: const InputDecoration(
                hintText: "Date as (dd/mm/yy)",
                hintStyle: TextStyle(
                    color: Color.fromARGB(255, 34, 34, 34),
                    fontSize: 15,
                    fontWeight: FontWeight.w600),
              ),
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
                inv = Invoice(
                    id: inv.id,
                    title: inv.title,
                    date: inv.date,
                    price: double.parse(value!),
                    photo: inv.photo);
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
              inv = Invoice(
                  id: inv.id,
                  title: inv.title,
                  date: inv.date,
                  price: inv.price,
                  photo: inv.photo);
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
                    width: constraints.maxWidth,
                    height: 200,
                  )
                : Image.asset(
                    'placeHolder.png',
                    width: constraints.maxWidth,
                    height: 200,
                  ),
          ),
          Container(
            decoration: const BoxDecoration(
                color: Colors.green, shape: BoxShape.circle),
            child: IconButton(
              onPressed: () {
                // Validate returns true if the form is valid, or false otherwise.
                if (widget.formKey.currentState!.validate()) {
                  final isValid = widget.formKey.currentState?.validate();
                  if (isValid == false) {
                    return;
                  }
                  widget.formKey.currentState?.save();
                  print('New Invoice : ');
                  print(inv.title);
                  print(inv.price);
                  print(inv.date);
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );
                  Navigator.pushReplacementNamed(
                      context, MyGarageScreen.routeName);
                }
              },
              iconSize: 40,
              icon: const Icon(Icons.check),
            ),
          ),
        ],
      ),
    );
  }
}
