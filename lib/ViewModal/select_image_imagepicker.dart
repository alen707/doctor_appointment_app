import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SelectImageImagepicker extends StatefulWidget {
  const SelectImageImagepicker({super.key});

  @override
  State<SelectImageImagepicker> createState() => _SelectImageImagepickerState();
}

class _SelectImageImagepickerState extends State<SelectImageImagepicker> {
      final ImagePicker _picker = ImagePicker();
File? _image;

Future<void> pickFromCamera() async {
  final XFile? pickedFile = await _picker.pickImage(
    source: ImageSource.camera,
    imageQuality: 80,
  );

  if (pickedFile != null) {
    setState(() {
      _image = File(pickedFile.path);
    });
  }
}
Future<void> pickFromGallery() async {
  final XFile? pickedFile = await _picker.pickImage(
    source: ImageSource.gallery,
    imageQuality: 80,
  );

  if (pickedFile != null) {
    setState(() {
      _image = File(pickedFile.path);
    });
  }
}
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _image == null
    ? const Text("No Image Selected")
    : Image.file(
        _image!,
        height: 200,
      ),
            ElevatedButton(
              onPressed: () {
                pickFromCamera();
              },
               child: Text("Cemara")
               ),
               ElevatedButton(
                onPressed: () {
                  pickFromGallery();
                },
                 child: Text("Gallery")
                 )
          ],
        ),
      ),
    );
  }
}