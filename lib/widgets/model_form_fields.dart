import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/models/models.dart';

class ModelFormFields extends StatefulWidget {
  const ModelFormFields({Key? key}) : super(key: key);

  @override
  State<ModelFormFields> createState() => _ModelFormFieldsState();
}

class _ModelFormFieldsState extends State<ModelFormFields> {
  File? image;
  //final _keyForm = GlobalKey<FormState>();

  Future pickImage(ImageSource src) async {
    final image = await ImagePicker().pickImage(source: src);
    if (image == null) return;

    final tmpImage = File(image.path);
    setState(() => this.image = tmpImage);
  }

  // saveNewModel() {
  //   Image photo = Image.asset('placeHolder.png');
  //   Image brandLogo = Image.asset('placeHolder.png');
  //   Model newModel = Model(
  //       id: DateTime.now().toString(),
  //       brand: newBrand,
  //       brandLogo: brandLogo,
  //       name: newName,
  //       hp: newHp,
  //       manufacturedDate: newManufacturedDate,
  //       infos: newInfo,
  //       photo: photo);
  //   BRAND_CATEGORIES.add(Category(
  //       id: newId, title: newBrand, logo: brandLogo, models: [newModel]));
  // }

  late Category _newBrand;
  late Model _newModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  icon: Icon(Icons.branding_watermark),
                  hintText: 'Enter the brand',
                ),
                // The validator receives the text that the user has entered.
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                onSaved: (newBrand) => _newBrand.title = newBrand!,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  icon: Icon(Icons.branding_watermark),
                  hintText: 'Enter the model name',
                ),
                // The validator receives the text that the user has entered.
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                onSaved: (newName) => _newModel.name = newName!,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  icon: Icon(Icons.branding_watermark),
                  hintText: 'Horse power',
                ),
                // The validator receives the text that the user has entered.
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                onSaved: (newHp) => _newModel.hp = newHp!,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  icon: Icon(Icons.branding_watermark),
                  hintText: 'Realesed date',
                ),
                // The validator receives the text that the user has entered.
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                onSaved: (newManufacturedDate) =>
                    _newModel.manufacturedDate = newManufacturedDate!,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  icon: Icon(Icons.branding_watermark),
                  hintText: 'infos',
                ),
                // The validator receives the text that the user has entered.
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                onSaved: (newInfo) => _newModel.infos = newInfo!,
              ),
            ],
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
