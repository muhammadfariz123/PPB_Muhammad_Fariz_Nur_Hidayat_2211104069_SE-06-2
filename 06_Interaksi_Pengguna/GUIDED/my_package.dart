import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

class MyPackage extends StatefulWidget {
  const MyPackage({super.key});

  @override
  State<MyPackage> createState() => _MyPackageState();
}

class _MyPackageState extends State<MyPackage> {
  String? selectedValue; // Pindahkan selectedValue ke dalam state

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Belajar Package",
          // style: GoogleFonts.sriracha(),
        ),
        backgroundColor: Colors.amber,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              obscureText: true,
              obscuringCharacter: "*",
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.person),
                hintText: "Masukkan username",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 18,
            ),
            TextField(
              obscureText: true,
              obscuringCharacter: "*",
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.lock),
                hintText: "Masukkan password",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text(
                "Ini adalah Elevated Button",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                'Ini adalah Text Button',
                style: TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            DropdownButton<String>(
              dropdownColor: Colors.amber,
              focusColor: Colors.green,
              isExpanded: true,
              value: selectedValue,
              items: <String>['opsi1', 'opsi 2', 'opsi3']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedValue = newValue;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
