import 'package:flutter/material.dart';

class ListviewScreen extends StatelessWidget {
  const ListviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Latihan List View'),
        backgroundColor: Colors.amber,
      ),
      body: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Container(
            height: 200,
            width: 200,
            color: Colors.red,
            child: Center(child: Text("Type A")),
          ),
          Container(
            height: 200,
            width: 200,
            color: const Color.fromARGB(255, 255, 154, 4),
            child: Center(child: Text("Type A")),
          ),
          Container(
            height: 200,
            width: 200,
            color: const Color.fromARGB(255, 252, 255, 81),
            child: Center(child: Text("Type A")),
          ),
          Container(
            height: 200,
            width: 200,
            color: const Color.fromARGB(255, 9, 255, 0),
            child: Center(child: Text("Type A")),
          ),
          Container(
            height: 200,
            width: 200,
            color: const Color.fromARGB(255, 98, 0, 255),
            child: Center(child: Text("Type A")),
          ),
          Container(
            height: 200,
            width: 200,
            color: const Color.fromARGB(255, 255, 0, 200),
            child: Center(child: Text("Type A")),
          ),
          Container(
            height: 200,
            width: 200,
            color: const Color.fromARGB(255, 144, 20, 160),
            child: Center(child: Text("Type A")),
          ),
        ],
      ),
    );
  }
}
