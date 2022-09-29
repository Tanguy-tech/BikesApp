import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:motobox/widgets/bike_widgets/bike_data_container.dart';

class MyBikeScreen extends StatefulWidget {
  static const routeName = '/my_bike';
  const MyBikeScreen({Key? key}) : super(key: key);

  @override
  State<MyBikeScreen> createState() => _MyBikeScreenState();
}

class _MyBikeScreenState extends State<MyBikeScreen> {
  File? _imageFile;

  Future _pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      File? img = File(image.path);
      img = await _cropImage(img);
      // File? img = File(image);
      setState(() {
        _imageFile = img;
        Navigator.of(context).pop();
      });
    } on PlatformException catch (e) {
      print(e);
      Navigator.of(context).pop();
    }
  }

  Future<File?> _cropImage(File imageFile) async {
    CroppedFile? cropedImage =
        await ImageCropper().cropImage(sourcePath: imageFile.path);
    if (cropedImage == null) return null;
    return File(cropedImage.path);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return LayoutBuilder(builder: ((context, constraints) {
          return Column(
            children: const [
              BikeMainInfo(),
              SizedBox(height: 20),
              Text(
                'HEY THIS IS MY BIKE SCREEN!\nhere wil go the follow up of all maintenance and everything the bike i chose the display if i have more than one',
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Text('HERE GOES THE CHAIN MAINTENANCE DATA'),
              SizedBox(height: 20),
              Text('HERE GOES THE OIL MAINTENANCE DATA'),
              SizedBox(height: 20),
              Text('HERE GOES THE FILTERS MAINTENANCE DATA'),
              SizedBox(height: 20),
              Text('HERE GOES OTHERS MAINTENANCE DATA'),
              SizedBox(height: 20),
              SizedBox(height: 20),
              // FloatingActionButton(onPressed: () {
              //   _pickImage(ImageSource.gallery);
              // }),
              // const SizedBox(height: 20),
              // Container(
              //   child: _imageFile == null
              //       ? const Text('NO IMAGES YET')
              //       : Image.file(_imageFile!),
              // ),
            ],
          );
        }));
        // return const Center(
        //   child: Text(
        //     'HEY THIS IS MY BIKE SCREEN!\nhere wil go the follow up of all maintenance and everything the bike i chose the display if i have more than one',
        //     textAlign: TextAlign.center,
        //   ),
        // );
      },
    );
  }
}
