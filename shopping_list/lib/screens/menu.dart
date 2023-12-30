// Import Flutter Material library untuk pengembangan antarmuka pengguna
import 'package:flutter/material.dart';

// Import beberapa file layar dan widget yang akan digunakan dalam aplikasi
import 'package:shopping_list/screens/list_product.dart';
import 'package:shopping_list/widgets/left_drawer.dart';
import 'package:shopping_list/screens/shoplist_form.dart';
import 'package:shopping_list/widgets/shop_card.dart';
import 'package:shopping_list/screens/item_list_page.dart';

// Kelas MyHomePage yang merupakan StatelessWidget untuk halaman utama aplikasi
class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  // Fungsi callback untuk penekanan tombol "Tambah Produk"
  void navigateToShopFormPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ShopFormPage(),
      ),
    );
  }

  // Fungsi callback untuk penekanan tombol "Lihat Produk"
  void navigateToProductPage(BuildContext context) {
    // Route menu ke halaman produk
    Navigator.push(
      context,
      // MaterialPageRoute(builder: (context) => ProductPage()),
      MaterialPageRoute(builder: (context) => ItemsListPage()),
    );
  }

  // Metode build untuk membangun antarmuka pengguna halaman utama
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Shopping List',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(), // Menambahkan drawer yang sudah dibuat
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Text(
                  'PBP Shop',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              GridView.count(
                primary: true,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                shrinkWrap: true,
                children: items.map((ShopItem item) {
                  return ShopCard(
                    item,
                    onItemTap: () {
                      if (item.name == "Lihat Web Produk") {
                        navigateToProductPage(context);
                      } else if (item.name == "Tambah Produk") {
                        navigateToShopFormPage(context);
                      }
                    },
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
