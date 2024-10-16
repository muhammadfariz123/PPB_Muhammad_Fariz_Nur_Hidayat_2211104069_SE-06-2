import 'package:flutter/material.dart';
import 'package:pertemuan5/jenis_list_view.dart';
import 'package:pertemuan5/flexible_expanded.dart';
import 'package:pertemuan5/custom.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: JenisListView(),
      //home: FlexibleExpandedScreen(),
      home: Custom(),
    );
  }
}
