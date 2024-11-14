import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerScreen extends StatefulWidget {
  final ImageSourceType type;

  const ImagePickerScreen(this.type);

  @override
  State<ImagePickerScreen> createState() => _ImagePickerScreenState(this.type);
}

enum ImageSourceType { camera, gallery } // Define enum for image source types

class _ImagePickerScreenState extends State<ImagePickerScreen> {
  File? image;
  late ImagePicker imagePicker;
  final ImageSourceType type;

  _ImagePickerScreenState(this.type) {
    imagePicker = ImagePicker(); // Initialize the ImagePicker
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(type == ImageSourceType.camera
            ? "Image from Camera"
            : "Image from Gallery"),
      ),
      body: Column(
        children: [
          SizedBox(height: 50),
          Center(
            child: GestureDetector(
              onTap: () async {
                // Choose image source (camera/gallery)
                final pickedFile = await imagePicker.pickImage(
                  source: type == ImageSourceType.camera
                      ? ImageSource.camera
                      : ImageSource.gallery,
                );

                if (pickedFile != null) {
                  setState(() {
                    image = File(pickedFile.path); // Update the image state
                  });
                }
              },
              child: Container(
                width: 100,
                height: 100,
                color: Colors.blue,
                child: Center(
                  child: Text(
                    'Pick Image',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          image != null
              ? Image.file(
                  image!,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                )
              : Container(), // Display the image if available
        ],
      ),
    );
  }
}
