import 'package:flutter/material.dart';

class FlexibleExpandedScreen extends StatelessWidget {
  const FlexibleExpandedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flexible vs Expanded"),
        backgroundColor: Colors.amber,
      ),
      body: Column(
        children: [
          Text(
            "Flexible",
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Container(
                width: 50,
                height: 100,
                color: Colors.red,
              ),
              Flexible(
                child: Container(
                  height: 100,
                  color: Colors.amber,
                  child: Text(
                      "This is Flexible Widget, it takes up remaining space but can chrink if needed"),
                ),
              ),
              Icon(Icons.sentiment_satisfied_alt_rounded)
            ],
          ),
          SizedBox(
            height: 20,
          ),
          // Expanded Section
          Text(
            "Expanded",
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Container(
                width: 50,
                height: 100,
                color: Colors.red,
              ),
              Expanded(
                child: Container(
                  height: 100,
                  color: Colors.amber,
                  padding: EdgeInsets.all(8),
                  child: Center(
                    child: Text(
                      "This is Expanded Widget, it forces the widget to take up all the remaining space",
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              Icon(Icons.sentiment_very_satisfied_rounded)
            ],
          ),
        ],
      ),
    );
  }
}
