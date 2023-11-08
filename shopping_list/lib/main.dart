import 'package:flutter/material.dart';
import 'package:shopping_list/menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.indigo),
        // Tambahkan warna yang sesuai dengan kebutuhan Anda, misalnya primarySwatch.
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}
