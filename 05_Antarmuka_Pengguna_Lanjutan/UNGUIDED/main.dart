import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WisataPage(),
      theme: ThemeData(
        primarySwatch: Colors.blue, // Warna tema utama
      ),
    );
  }
}

class WisataPage extends StatelessWidget {
  // Data tempat wisata dalam bentuk list
  final List<Map<String, String>> wisataList = [
    {
      'name': 'Baturraden',
      'image':
          'https://tse4.mm.bing.net/th?id=OIP.kSexhdSW9T8AJO5HNepezwHaE7&pid=Api&P=0&h=220',
      'description':
          'Baturaden adalah sebuah kawasan wisata alam di lereng Gunung Slamet yang terkenal dengan pemandangan yang indah dan udara yang sejuk.'
    },
    {
      'name': 'Curug Cipendok',
      'image':
          'https://tse4.mm.bing.net/th?id=OIP.qDFTvQ0Biunjnb_SHMsCpwHaEK&pid=Api&P=0&h=220',
      'description':
          'Curug Cipendok adalah air terjun yang tinggi dengan suasana alam yang masih sangat asri, cocok untuk wisata alam.'
    },
    {
      'name': 'Telaga Sunyi',
      'image':
          'https://tse1.mm.bing.net/th?id=OIP.J6AOfNzshoXykODOrQpgfAHaE7&pid=Api&P=0&h=220',
      'description':
          'Telaga Sunyi adalah telaga yang berada di kawasan Baturaden, memiliki air yang sangat jernih dan suasana tenang yang menyejukkan.'
    },
    {
      'name': 'Museum Bank Rakyat Indonesia',
      'image':
          'https://tse3.mm.bing.net/th?id=OIP.taBwI29ieFCmWRBzgCE-_QHaEm&pid=Api&P=0&h=220',
      'description':
          'Museum ini menceritakan sejarah berdirinya Bank Rakyat Indonesia, salah satu bank tertua di Indonesia yang didirikan di Purwokerto, Banyumas.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey[200], // Background lebih terang
        child: CustomScrollView(
          slivers: <Widget>[
            // SliverAppBar dengan efek collapse
            SliverAppBar(
              expandedHeight: 250.0,
              floating: false,
              pinned: true, // Membuat judul tetap terlihat saat di-scroll
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text(
                  "Wisata Banyumas",
                  style: TextStyle(
                    color: Colors.white, // Warna teks kontras
                    fontSize: 20.0,
                    shadows: [
                      Shadow(
                        blurRadius: 10.0,
                        color: Colors.black, // Bayangan untuk teks
                        offset: Offset(1.0, 1.0),
                      ),
                    ],
                  ),
                ),
                background: Image.network(
                  'https://tse1.mm.bing.net/th?id=OIP.4P-C4qqXYoUeFyJPaKaEtwHaE7&pid=Api&P=0&h=220',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // SliverList untuk menampilkan list tempat wisata
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final wisata = wisataList[index];
                  return Center(
                    child: Container(
                      margin: const EdgeInsets.all(16.0),
                      child: Card(
                        elevation: 4,
                        color:
                            Colors.white, // Warna background kartu lebih terang
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Center(
                              // Mengatur gambar agar berada di tengah
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Image.network(
                                  wisata['image']!,
                                  height: 150, // Ukuran gambar yang lebih kecil
                                  width: 300, // Lebar gambar yang diatur
                                  fit: BoxFit.cover,
                                  loadingBuilder: (BuildContext context,
                                      Widget child, ImageChunkEvent? progress) {
                                    if (progress == null) {
                                      return child;
                                    } else {
                                      return Center(
                                        child: CircularProgressIndicator(
                                          value: progress.expectedTotalBytes !=
                                                  null
                                              ? progress.cumulativeBytesLoaded /
                                                  (progress
                                                          .expectedTotalBytes ??
                                                      1)
                                              : null,
                                        ),
                                      );
                                    }
                                  },
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    wisata['name']!,
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: Colors
                                          .black, // Warna teks judul lebih kontras
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    wisata['description']!,
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors
                                          .black87, // Warna teks deskripsi
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Center(
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(),
                                      onPressed: () {
                                        // Aksi ketika tombol diklik
                                      },
                                      child: Text("Kunjungi Sekarang"),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                childCount: wisataList.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
