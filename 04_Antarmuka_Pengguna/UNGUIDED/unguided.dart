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
          'BMuseum ini menceritakan sejarah berdirinya Bank Rakyat Indonesia, salah satu bank tertua di Indonesia yang didirikan di Purwokerto, Banyumas.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Rekomendasi Wisata Banyumas"),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: wisataList.length,
        itemBuilder: (context, index) {
          final wisata = wisataList[index];
          return Center(
            child: Container(
              constraints:
                  BoxConstraints(maxWidth: 400), // Atur ukuran maksimal
              child: Card(
                elevation: 4,
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // Nama tempat wisata
                      Text(
                        wisata['name']!,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      // Gambar tempat wisata dengan loading indicator
                      ClipRRect(
                        borderRadius:
                            BorderRadius.circular(10.0), // Radius pada gambar
                        child: Image.network(
                          wisata['image']!,
                          height: 200,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          // loadingBuilder untuk menangani progress event
                          loadingBuilder: (BuildContext context, Widget child,
                              ImageChunkEvent? loadingProgress) {
                            if (loadingProgress == null) {
                              return child; // Jika gambar sudah dimuat, tampilkan gambarnya
                            } else {
                              return Center(
                                child: CircularProgressIndicator(
                                  value: loadingProgress.expectedTotalBytes !=
                                          null
                                      ? loadingProgress.cumulativeBytesLoaded /
                                          (loadingProgress.expectedTotalBytes ??
                                              1)
                                      : null, // Menampilkan loading berdasarkan progress
                                ),
                              );
                            }
                          },
                        ),
                      ),
                      SizedBox(height: 10),
                      // Deskripsi tempat wisata
                      Text(
                        wisata['description']!,
                        textAlign: TextAlign.justify,
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 10),
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
              ),
            ),
          );
        },
      ),
    );
  }
}
