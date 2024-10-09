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
      'name': 'Pantai Parangtritis',
      'image':
          'http://1.bp.blogspot.com/-XnZULPz43-k/VDJGODtMOII/AAAAAAAAANc/oLS7TDS5JSo/s1600/Keindahan%2BPantai%2BParangtritis%2BYogyakarta.png',
      'description':
          'Pantai yang sangat populer di Yogyakarta dengan pemandangan sunset yang memukau dan legenda Nyi Roro Kidul.'
    },
    {
      'name': 'Candi Prambanan',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQrvbNwxsD3ivZ4gSdnZWEM7gntlDmGlJUOA&s',
      'description':
          'Candi Hindu terbesar di Indonesia, Prambanan merupakan salah satu Situs Warisan Dunia UNESCO yang menakjubkan.'
    },
    {
      'name': 'Gunung Merapi',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQjvShndwU7117D5zPTu2W2gglY0nrSJHIoHA&s',
      'description':
          'Gunung Merapi merupakan gunung berapi paling aktif di Indonesia, menawarkan pendakian dan wisata lava tour.'
    },
    {
      'name': 'Taman Sari',
      'image':
          'https://atourin.obs.ap-southeast-3.myhuaweicloud.com/images/destination/yogyakarta/taman-sari-profile1646084669.png?x-image-process=image/resize,p_100,limit_1/imageslim',
      'description':
          'Bekas taman kerajaan ini menawarkan pemandangan arsitektur yang unik dan sejarah yang menarik di Yogyakarta.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Rekomendasi Wisata Yogyakarta"),
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
