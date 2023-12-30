// Import library Flutter Material untuk pengembangan antarmuka pengguna
import 'package:flutter/material.dart';

// Import halaman ItemDetailPage untuk menampilkan detail item
import 'package:shopping_list/screens/item_detail_page.dart';

// Kelas Item merepresentasikan struktur data untuk item
class Item {
  final String name;
  final int price;
  final String description;

  // Konstruktor untuk inisialisasi data item
  Item(this.name, this.price, this.description);
}

// Kelas ItemRepository menyimpan daftar item dan menggunakan pola Singleton
class ItemRepository {
  List<Item> items = [];

  // Instance dari ItemRepository
  static final ItemRepository _instance = ItemRepository._internal();

  // Konstruktor factory untuk mendapatkan instance ItemRepository
  factory ItemRepository() {
    return _instance;
  }

  // Konstruktor private untuk implementasi Singleton
  ItemRepository._internal();
}

// Instance dari ItemRepository
final itemRepository = ItemRepository();

// Kelas ItemsListPage adalah StatelessWidget untuk menampilkan daftar item
class ItemsListPage extends StatelessWidget {
  // Konstruktor untuk ItemsListPage
  const ItemsListPage({Key? key});

  // Metode build untuk menampilkan antarmuka pengguna
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar menampilkan judul halaman
      appBar: AppBar(
        title: const Text('Items Mobile Detail'),
      ),
      // Body menggunakan ListView.builder untuk menampilkan daftar item
      body: ListView.builder(
        itemCount: itemRepository.items.length,
        itemBuilder: (context, index) {
          final item = itemRepository.items[index];
          return ListTile(
            // Judul menampilkan nama item dengan gaya tertentu
            title: Text(
              item.name,
              style: const TextStyle(
                color: Colors.indigo,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            // Tambahkan onTap untuk menavigasi ke halaman detail item
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ItemDetailPage(item: item),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
