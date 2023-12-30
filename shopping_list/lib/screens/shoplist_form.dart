// Import Flutter Material library untuk pengembangan antarmuka pengguna
import 'package:flutter/material.dart';

// Import beberapa file layar dan widget yang akan digunakan dalam aplikasi
import 'package:shopping_list/screens/item_list_page.dart';
import 'package:shopping_list/screens/shoplist_form.dart';
import 'package:shopping_list/widgets/left_drawer.dart';

// Kelas ShopFormPage yang merupakan StatefulWidget untuk menangani form penambahan item
class ShopFormPage extends StatefulWidget {
  const ShopFormPage({Key? key});

  @override
  State<ShopFormPage> createState() => _ShopFormPageState();
}

// Kelas _ShopFormPageState yang merupakan State dari ShopFormPage
class _ShopFormPageState extends State<ShopFormPage> {
  final _formKey = GlobalKey<FormState>(); // GlobalKey untuk validasi form
  String _name = ""; // Variabel penyimpan nama item
  int _price = 0; // Variabel penyimpan harga item
  String _description = ""; // Variabel penyimpan deskripsi item

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Form Tambah Item',
          ),
        ),
      ),
      drawer: const LeftDrawer(), // Menambahkan drawer yang sudah dibuat
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Nama Item",
                    labelText: "Nama Item",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _name = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Nama tidak boleh kosong!";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Price",
                    labelText: "Price",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    final parsedValue = int.tryParse(value ?? "");
                    if (parsedValue != null && parsedValue >= 0) {
                      setState(() {
                        _price = parsedValue;
                      });
                    }
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Price tidak boleh kosong!";
                    }

                    final parsedValue = int.tryParse(value);
                    if (parsedValue == null) {
                      return "Price harus berupa angka!";
                    }

                    if (parsedValue < 0) {
                      return "Price harus >= 0!";
                    }

                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Description",
                    labelText: "Description",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _description = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Description tidak boleh kosong!";
                    }
                    return null;
                  },
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.indigo),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Simpan data ke ItemRepository
                        itemRepository.items.add(
                          Item(_name, _price, _description),
                        );

                        // Reset inputan pengguna
                        _formKey.currentState!.reset();

                        // Tampilkan dialog "Item berhasil tersimpan"
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Item berhasil tersimpan'),
                              content: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Nama: $_name'),
                                    Text('Price: $_price'),
                                    Text('Deskripsi: $_description'),
                                    // Tambahkan value lainnya jika ada
                                  ],
                                ),
                              ),
                              actions: [
                                TextButton(
                                  child: const Text('OK'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                    child: const Text(
                      "Save",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
