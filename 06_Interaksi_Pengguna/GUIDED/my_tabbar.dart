import 'package:flutter/material.dart';
import 'package:pertemuan_6/my_package.dart';

class MyTabbar extends StatefulWidget {
  const MyTabbar({super.key});

  @override
  State<MyTabbar> createState() => _MyTabbarState();
}

class _MyTabbarState extends State<MyTabbar> {
  int _selectedIndex = 0;

  void _onTappedItem(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Widget> _pages = <Widget>[
    MyTabbar(),
    MyPackage(),
    MyPackage(),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("menu data"),
          bottom: TabBar(tabs: [
            Tab(
              icon: Icon(Icons.food_bank),
              text: "Menu",
            ),
            Tab(
              icon: Icon(Icons.calendar_month),
              text: "Menu",
            ),
            Tab(
              icon: Icon(Icons.history),
              text: "Menu",
            ),
          ]),
          backgroundColor: Colors.yellow,
        ),
        body: const TabBarView(children: [
          Center(
            child: Text("Ini konten Menu"),
          ),
          Center(
            child: Text("Ini konten Calender"),
          ),
          Center(
            child: Text("Ini konten History"),
          ),
        ]),
      ),
    );
  }
}
