import 'dart:io';

import 'package:flutter/material.dart';
import '../data/brand_data.dart';
import '../models/category.dart';
import 'package:image_picker/image_picker.dart';

import '../models/models.dart';

class BrandFormFields extends StatefulWidget {
  const BrandFormFields({Key? key}) : super(key: key);

  @override
  State<BrandFormFields> createState() => _BrandFormFieldsState();
}

class _BrandFormFieldsState extends State<BrandFormFields> {
  File? image;
  late Category newBrand;

  Future pickImage(ImageSource src) async {
    final image = await ImagePicker().pickImage(source: src);
    if (image == null) return;

    final tmpImage = File(image.path);
    setState(() => this.image = tmpImage);
  }

  saveNewBrand(String id, String title, Color color) {
    List<Model> models = [];
    Image logo = Image.asset('placeHolder.png');
    Category newBRand =
        Category(id: id, title: title, logo: logo, models: models);
    brandCategories.add(newBRand);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          child: TextFormField(
            decoration: const InputDecoration(
              border: InputBorder.none,
              icon: Icon(Icons.branding_watermark),
              hintText: 'Name of the brand',
            ),
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            onFieldSubmitted: (String? value) =>
                saveNewBrand(DateTime.now().toString(), value!, Colors.purple),
          ),
        ),
        (image == null)
            ? Container(
                width: 200,
                height: 200,
                color: Theme.of(context).canvasColor,
              )
            : Image.file(image!),
        Container(
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton.icon(
                icon: const Icon(Icons.image_search),
                label: const Text("Gallery"),
                onPressed: () => pickImage(ImageSource.gallery),
              ),
              ElevatedButton.icon(
                icon: const Icon(Icons.camera),
                label: const Text("Camera"),
                onPressed: () => pickImage(ImageSource.camera),
              ),
            ],
          ),
        )
      ],
    );
  }
}
