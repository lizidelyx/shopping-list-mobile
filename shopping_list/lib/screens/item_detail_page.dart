// Import library Flutter Material untuk pengembangan antarmuka pengguna
import 'package:flutter/material.dart';

// Import halaman ItemsListPage untuk memungkinkan navigasi kembali ke daftar item
import 'package:shopping_list/screens/item_list_page.dart';

// Kelas ItemDetailPage adalah StatelessWidget yang menampilkan detail item
class ItemDetailPage extends StatelessWidget {
  // Properti final item untuk menyimpan data item yang akan ditampilkan
  final Item item;

  // Konstruktor untuk inisialisasi data item saat pembuatan instance
  const ItemDetailPage({required this.item});

  // Metode build untuk menampilkan antarmuka pengguna
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar menampilkan judul halaman
      appBar: AppBar(
        title: Text('Item Mobile Detail'),
      ),
      // Body menggunakan Padding dan Column untuk tata letak yang baik
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Menampilkan nama item dengan gaya tertentu
            Text(
              item.name,
              style: const TextStyle(
                color: Colors.indigo,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            // Spasi vertikal
            const SizedBox(height: 10),
            // Menampilkan harga item
            Text(
              'Price: ${item.price}',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
            // Spasi vertikal
            const SizedBox(height: 10),
            // Menampilkan deskripsi item
            Text(
              'Description: ${item.description}',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
