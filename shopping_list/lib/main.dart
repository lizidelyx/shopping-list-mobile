// Import Flutter Material library untuk pengembangan antarmuka pengguna
import 'package:flutter/material.dart';

// Import paket pbp_django_auth untuk integrasi dengan autentikasi Django
import 'package:pbp_django_auth/pbp_django_auth.dart';

// Import provider untuk manajemen state
import 'package:provider/provider.dart';

// Import file login.dart yang berisi tata letak halaman login
import 'package:shopping_list/screens/login.dart';

// Fungsi main yang akan dijalankan pertama kali saat aplikasi dimulai
void main() {
  // Menjalankan aplikasi Flutter dengan widget MyApp sebagai root
  runApp(const MyApp());
}

// Kelas utama yang mewakili aplikasi Flutter
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // Metode build yang mengembalikan tata letak antarmuka pengguna aplikasi
  @override
  Widget build(BuildContext context) {
    return Provider(
      // Membuat instance dari CookieRequest menggunakan Provider untuk manajemen state
      create: (_) {
        CookieRequest request = CookieRequest();
        return request;
      },
      child: MaterialApp(
        // Konfigurasi dasar aplikasi Flutter
        title: 'Flutter App',
        theme: ThemeData(
          // Mengatur skema warna aplikasi berdasarkan warna induk indigo
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
          // Mengaktifkan penggunaan Material3 untuk desain Material
          useMaterial3: true,
        ),
        // Menentukan widget LoginApp sebagai halaman utama aplikasi
        home: const LoginApp(),
      ),
    );
  }
}
