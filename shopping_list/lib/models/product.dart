// Import library dart:convert untuk mengakses fungsi JSON parsing
import 'dart:convert';

// Fungsi productFromJson digunakan untuk mengonversi JSON string menjadi list objek Product
List<Product> productFromJson(String str) =>
    List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

// Fungsi productToJson digunakan untuk mengonversi list objek Product menjadi JSON string
String productToJson(List<Product> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// Kelas Product merepresentasikan entitas produk dengan atribut model, pk, dan fields
class Product {
  String model;
  int pk;
  Fields fields;

  // Konstruktor untuk inisialisasi atribut pada kelas Product
  Product({
    required this.model,
    required this.pk,
    required this.fields,
  });

  // Metode factory Product.fromJson digunakan untuk membuat objek Product dari JSON map
  factory Product.fromJson(Map<String, dynamic> json) => Product(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
      );

  // Metode toJson digunakan untuk mengonversi objek Product menjadi JSON map
  Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
      };
}

// Kelas Fields merepresentasikan atribut tambahan dari produk, seperti nama, harga, dll.
class Fields {
  String name;
  DateTime dateAdded;
  int price;
  String description;
  int user;

  // Konstruktor untuk inisialisasi atribut pada kelas Fields
  Fields({
    required this.name,
    required this.dateAdded,
    required this.price,
    required this.description,
    required this.user,
  });

  // Metode factory Fields.fromJson digunakan untuk membuat objek Fields dari JSON map
  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        name: json["name"],
        dateAdded: DateTime.parse(json["date_added"]),
        price: json["price"],
        description: json["description"],
        user: json["user"],
      );

  // Metode toJson digunakan untuk mengonversi objek Fields menjadi JSON map
  Map<String, dynamic> toJson() => {
        "name": name,
        "date_added":
            "${dateAdded.year.toString().padLeft(4, '0')}-${dateAdded.month.toString().padLeft(2, '0')}-${dateAdded.day.toString().padLeft(2, '0')}",
        "price": price,
        "description": description,
        "user": user,
      };
}
