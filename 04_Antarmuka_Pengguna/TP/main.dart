import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WisataPage(),
    );
  }
}


class WisataPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Rekomendasi Wisata"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // Nama Tempat Wisata
            Text(
              "Pantai Kukup",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            // Gambar dari internet
            Image.network(
              'https://1.bp.blogspot.com/-P9MMEYxN-fU/WerU5riB23I/AAAAAAAADO4/m_wVmj-K2oA6DyigUcHxEMpqZQIYmDvjgCLcBGAs/s1600/Pantai%2BKukup%2BGunungkidul%2B%2540Ant%2BPhotograph.jpg',
              height: 200,
              width: 300,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16),
            // Deskripsi tempat wisata
            Text(
              "Pantai Kukup adalah salah satu pantai yang terletak di kawasan Gunungkidul, Yogyakarta. "
              "Pantai ini terkenal dengan pasir putihnya yang indah dan air laut yang jernih. "
              "Dikenal juga dengan keindahan karangnya dan pulau kecil yang bisa diakses melalui jembatan, "
              "Pantai Kukup menjadi destinasi favorit bagi wisatawan lokal maupun mancanegara.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            // Tombol Kunjungi Sekarang
            ElevatedButton(
              onPressed: () {
                // Aksi yang diinginkan ketika tombol diklik
              },
              child: Text("Kunjungi Sekarang"),
            ),
          ],
        ),
      ),
    );
  }
}
