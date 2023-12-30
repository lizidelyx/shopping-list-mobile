// Import Flutter Material library untuk pengembangan antarmuka pengguna
import 'package:flutter/material.dart';

// Import paket http untuk melakukan HTTP requests
import 'package:http/http.dart' as http;

// Import library dart:convert untuk mengonversi JSON
import 'dart:convert';

// Import model Product yang digunakan untuk merepresentasikan data produk
import 'package:shopping_list/models/product.dart';

// Import widget LeftDrawer untuk digunakan sebagai drawer pada halaman produk
import 'package:shopping_list/widgets/left_drawer.dart';

// Kelas ProductPage adalah StatefulWidget untuk menampilkan daftar produk
class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

// Kelas _ProductPageState merupakan State dari ProductPage
class _ProductPageState extends State<ProductPage> {
  // Fungsi asynchronous untuk mengambil data produk dari API
  Future<List<Product>> fetchProduct() async {
    // Tentukan URL endpoint API
    var url = Uri.parse('https://alizza-deli21-tutorial.pbp.cs.ui.ac.id/json/');

    // Kirim HTTP GET request ke API dengan header JSON
    var response = await http.get(
      url,
      headers: {"Content-Type": "application/json"},
    );

    // Decode data JSON dari respons
    var data = jsonDecode(utf8.decode(response.bodyBytes));

    // Inisialisasi list untuk menyimpan objek Product
    List<Product> listProduct = [];

    // Looping melalui data JSON dan konversi ke objek Product
    for (var d in data) {
      if (d != null) {
        listProduct.add(Product.fromJson(d));
      }
    }
    return listProduct;
  }

  // Metode build untuk menampilkan antarmuka pengguna
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Items Web Detail'),
      ),
      drawer: const LeftDrawer(),
      body: FutureBuilder(
        // FutureBuilder untuk menangani data yang belum selesai diambil
        future: fetchProduct(),
        builder: (context, AsyncSnapshot<List<Product>> snapshot) {
          // Cek apakah sedang dalam proses pengambilan data
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          // Cek apakah data tidak ada atau kosong
          else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text(
                "Tidak ada data produk.",
                style: TextStyle(color: Color(0xff59A5D8), fontSize: 20),
              ),
            );
          }
          // Jika data sudah ada, tampilkan ListView dengan produk
          else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (_, index) => GestureDetector(
                onTap: () {
                  // Navigate to the item detail page when tapped
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ProductDetailPage(product: snapshot.data![index]),
                    ),
                  );
                },
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${snapshot.data![index].fields.name}",
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue, // Set the text color to blue
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}

// Kelas ProductDetailPage adalah StatelessWidget untuk menampilkan detail produk
class ProductDetailPage extends StatelessWidget {
  final Product product;

  // Konstruktor untuk menerima objek Product sebagai parameter
  const ProductDetailPage({required this.product});

  // Metode build untuk menampilkan detail produk
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Item Web Detail'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product.fields.name,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Price: ${product.fields.price}',
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Description: ${product.fields.description}',
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
