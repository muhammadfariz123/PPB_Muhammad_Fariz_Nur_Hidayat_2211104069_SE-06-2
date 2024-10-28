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

  // Controller untuk mengontrol input form
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  // List halaman yang akan ditampilkan sesuai index
  static const List<Widget> _pages = <Widget>[
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

  // Fungsi untuk menangani tombol submit
  void _submitForm() {
    String nama = _namaController.text;
    String email = _emailController.text;

    // Menampilkan dialog konfirmasi
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Konfirmasi'),
          content: Text('Nama: $nama\nEmail: $email'),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aplikasi Navigasi Bawah'),
      ),
      body: _selectedIndex == 0
          ? Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextField(
                    controller: _namaController,
                    decoration: InputDecoration(
                      labelText: 'Masukkan Nama',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: 'Masukkan Email',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: _submitForm,
                    child: Text('Submit'),
                  ),
                ],
              ),
            )
          : _pages[_selectedIndex - 1], // Halaman lain (Wisata dan Profil)
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
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
        selectedItemColor: Colors.orange, // Warna saat item dipilih
        onTap: _onItemTapped, // Menjalankan fungsi ketika item dipilih
      ),
    );
  }
}
