import 'package:flutter/material.dart';
import 'package:pertemuan_6/my_tabbar.dart'; // Pastikan file ini ada
import 'package:pertemuan_6/my_package.dart'; // Pastikan file ini ada

class MyNavbar extends StatefulWidget {
  const MyNavbar({super.key});

  @override
  State<MyNavbar> createState() => _MyNavbarState();
}

class _MyNavbarState extends State<MyNavbar> {
  int _selectedIndex = 0;

  // Daftar halaman yang akan ditampilkan pada masing-masing tab
  final List<Widget> _pages = [
    const MyTabbar(), // Ganti dengan layar sesuai
    MyPackage(), // Ganti dengan layar sesuai
    MyPackage(), // Ganti dengan layar sesuai, contoh lainnya
  ];

  void _onTappedItem(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bottom Navigation Bar'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_max_rounded),
            label: 'My TabBar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home_max_rounded),
            label: 'My Package 1',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home_max_rounded),
            label: 'My Package 2',
          ),
        ],
        selectedItemColor: Colors.amber,
        currentIndex: _selectedIndex,
        onTap: _onTappedItem,
        selectedFontSize: 20,
      ),
    );
  }
}
