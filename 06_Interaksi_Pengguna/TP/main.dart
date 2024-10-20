import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Menyimpan index halaman yang aktif (Home = 0, Wisata = 1, Profil = 2)
  int _selectedIndex = 0;

  // List halaman yang akan ditampilkan sesuai index
  static const List<Widget> _pages = <Widget>[
    Center(
        child: Text('Ini adalah halaman Home', style: TextStyle(fontSize: 24))),
    Center(
        child:
            Text('Ini adalah halaman Wisata', style: TextStyle(fontSize: 24))),
    Center(
        child:
            Text('Ini adalah halaman Profil', style: TextStyle(fontSize: 24))),
  ];

  // Fungsi yang dijalankan saat item navigasi dipilih
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bottom Navigation App'),
      ),
      body: _pages[_selectedIndex], // Menampilkan halaman sesuai dengan index
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.place),
            label: 'Wisata',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
        currentIndex: _selectedIndex, // Index item yang dipilih
        selectedItemColor: Colors.blue, // Warna saat item dipilih
        onTap: _onItemTapped, // Menjalankan fungsi ketika item dipilih
      ),
    );
  }
}
