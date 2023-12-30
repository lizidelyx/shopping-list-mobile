// Import Flutter Material library untuk pengembangan antarmuka pengguna
import 'package:flutter/material.dart';

// Import beberapa file layar yang akan digunakan dalam aplikasi
import 'package:shopping_list/screens/item_list_page.dart';
import 'package:shopping_list/screens/list_product.dart';
import 'package:shopping_list/screens/menu.dart';
import 'package:shopping_list/screens/shoplist_form.dart'; // Impor ShopFormPage

// Kelas LeftDrawer yang merupakan widget untuk menampilkan drawer sebelah kiri pada aplikasi
class LeftDrawer extends StatelessWidget {
  const LeftDrawer({Key? key});

  // Metode build yang mengembalikan tampilan Drawer
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          // Bagian header dari Drawer dengan informasi tentang aplikasi
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.indigo,
            ),
            child: Column(
              children: [
                Text(
                  'Shopping List',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(10)),
                Text(
                  "Catat seluruh keperluan belanjamu di sini!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          // ListTile untuk navigasi ke halaman utama aplikasi
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Halaman Utama'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => MyHomePage(),
                ),
              );
            },
          ),
          // ListTile untuk navigasi ke halaman daftar produk web
          ListTile(
            leading: const Icon(Icons.shopping_basket),
            title: const Text('Daftar Produk Web'),
            onTap: () {
              // Route menu ke halaman produk
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProductPage()),
              );
            },
          ),
          // ListTile untuk navigasi ke halaman daftar produk mobile
          ListTile(
            leading: const Icon(Icons.shopping_basket),
            title: const Text('Daftar Produk Mobile'),
            onTap: () {
              // Route menu ke halaman produk
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ItemsListPage()),
              );
            },
          ),
          // ListTile untuk navigasi ke halaman tambah produk
          ListTile(
            leading: const Icon(Icons.add_shopping_cart),
            title: const Text('Tambah Produk'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ShopFormPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
