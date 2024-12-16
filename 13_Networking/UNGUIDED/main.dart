import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Model untuk Catatan
class Note {
  final String title;
  final String description;

  Note({
    required this.title,
    required this.description,
  });
}

/// Controller untuk mengelola catatan
class NoteController extends GetxController {
  var notes = <Note>[].obs; // Daftar catatan sebagai list observable

  // Fungsi menambah catatan
  void addNote(String title, String description) {
    notes.add(Note(title: title, description: description));
  }

  // Fungsi menghapus catatan
  void deleteNote(int index) {
    notes.removeAt(index);
  }
}

/// Halaman Utama - Menampilkan daftar catatan
class HomePage extends StatelessWidget {
  final NoteController controller = Get.put(NoteController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Catatan Sederhana"),
      ),
      body: Obx(() {
        return controller.notes.isEmpty
            ? Center(child: Text("Belum ada catatan. Tambahkan sekarang!"))
            : ListView.builder(
                itemCount: controller.notes.length,
                itemBuilder: (context, index) {
                  final note = controller.notes[index];
                  return ListTile(
                    title: Text(note.title,
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text(note.description),
                    trailing: IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        controller.deleteNote(index);
                      },
                    ),
                  );
                },
              );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigasi ke halaman tambah catatan
          Get.to(AddNotePage());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

/// Halaman Tambah Catatan Baru
class AddNotePage extends StatelessWidget {
  final NoteController controller = Get.find();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tambah Catatan"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                labelText: "Judul",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(
                labelText: "Deskripsi",
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                if (titleController.text.isNotEmpty &&
                    descriptionController.text.isNotEmpty) {
                  // Menyimpan catatan ke controller
                  controller.addNote(
                    titleController.text,
                    descriptionController.text,
                  );
                  // Kembali ke halaman utama
                  Get.back();
                } else {
                  Get.snackbar("Input Tidak Lengkap",
                      "Judul dan deskripsi harus diisi!");
                }
              },
              child: Text("Simpan Catatan"),
            ),
          ],
        ),
      ),
    );
  }
}

/// Fungsi Main - Menjalankan aplikasi dengan GetMaterialApp
void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
    getPages: [
      GetPage(name: '/', page: () => HomePage()),
      GetPage(name: '/add', page: () => AddNotePage()),
    ],
  ));
}
