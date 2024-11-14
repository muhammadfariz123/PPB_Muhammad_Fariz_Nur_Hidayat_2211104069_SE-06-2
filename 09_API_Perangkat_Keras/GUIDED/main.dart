import 'package:flutter/material.dart';
import 'package:pert9/camera_screen.dart';
import 'package:pert9/image_picker_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Guided_09',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ImagePickerScreen(ImageSourceType.gallery),
      //MyCameraScreen(),
    );
  }
}
