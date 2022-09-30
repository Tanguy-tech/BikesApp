import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
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

  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('users').snapshots();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return LayoutBuilder(builder: ((context, constraints) {
          return Column(
            children: [
              const BikeMainInfo(),
              const SizedBox(height: 20),
              // FloatingActionButton(onPressed: () {
              //   _pickImage(ImageSource.gallery);
              // }),
              // const SizedBox(height: 20),
              // Container(
              //   child: _imageFile == null
              //       ? const Text('NO IMAGES YET')
              //       : Image.file(_imageFile!),
              // ),
              StreamBuilder<QuerySnapshot>(
                stream: _usersStream,
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return const Text('Something went wrong');
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Text("Loading");
                  }

                  return ListView(
                    children: snapshot.data!.docs
                        .map((DocumentSnapshot document) {
                          Map<String, dynamic> data =
                              document.data()! as Map<String, dynamic>;
                          return ListTile(
                            title: Text(data['name']),
                            subtitle: Text(data['last_name']),
                          );
                        })
                        .toList()
                        .cast(),
                  );
                },
              ),
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
