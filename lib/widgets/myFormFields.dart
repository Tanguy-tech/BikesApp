import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';

class MyFomrFields extends StatefulWidget {
  const MyFomrFields({Key? key}) : super(key: key);

  @override
  State<MyFomrFields> createState() => _MyFomrFieldsState();
}

class _MyFomrFieldsState extends State<MyFomrFields> {
  File? image;

  Future pickImage(ImageSource src) async {
    try {
      final image = await ImagePicker().pickImage(source: src);
      if (image == null) return;

      final tmpImage = File(image.path);
      setState(() => this.image = tmpImage);
    } on PlatformException catch (e) {
      print("Failed to pick image..");
    }
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
