// Import Flutter Material library untuk pengembangan antarmuka pengguna
import 'package:flutter/material.dart';

// Import paket pbp_django_auth untuk integrasi dengan autentikasi Django
import 'package:pbp_django_auth/pbp_django_auth.dart';

// Import provider untuk manajemen state
import 'package:provider/provider.dart';

// Import beberapa file layar yang akan digunakan dalam aplikasi
import 'package:shopping_list/screens/item_list_page.dart';
import 'package:shopping_list/screens/list_product.dart';
import 'package:shopping_list/screens/login.dart';
import 'package:shopping_list/screens/shoplist_form.dart';

// Kelas yang merepresentasikan item-item dalam menu aplikasi
class ShopItem {
  final String name; // Nama item
  final IconData icon; // Ikona yang terkait dengan item

  ShopItem(this.name, this.icon);
}

// Daftar item yang akan ditampilkan dalam menu
final List<ShopItem> items = [
  ShopItem("Lihat Produk", Icons.checklist),
  ShopItem("Tambah Produk", Icons.add_shopping_cart),
  ShopItem("Logout", Icons.logout),
];

// Widget yang merepresentasikan tampilan kartu untuk setiap item dalam menu
class ShopCard extends StatelessWidget {
  final ShopItem item; // Item yang terkait dengan kartu
  final VoidCallback onItemTap; // Fungsi yang akan dipanggil saat kartu ditekan

  ShopCard(this.item, {Key? key, required this.onItemTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final request = context.watch<
        CookieRequest>(); // Mendapatkan instance dari CookieRequest menggunakan Provider
    return Material(
      color: Colors.indigo, // Warna latar belakang kartu
      child: InkWell(
        onTap: () async {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text(
                    "Kamu telah menekan tombol ${item.name}!"))); // Menampilkan snackbar saat kartu ditekan

          // Navigasi ke halaman yang sesuai berdasarkan item yang dipilih
          if (item.name == "Lihat Produk") {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ProductPage()));
          } else if (item.name == "Logout") {
            // Melakukan proses logout dan menanggapi hasilnya
            final response = await request.logout(
                "https://alizza-deli21-tutorial.pbp.cs.ui.ac.id/auth/logout/");
            String message = response["message"];

            // Jika logout berhasil, tunjukkan pesan sukses dan navigasikan ke halaman login
            if (response['status']) {
              String uname = response["username"];
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("$message Sampai jumpa, $uname."),
              ));
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            } else {
              // Jika logout gagal, tunjukkan pesan gagal
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("$message"),
              ));
            }
          }
          onItemTap(); // Panggil fungsi yang ditentukan saat item ditekan
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
