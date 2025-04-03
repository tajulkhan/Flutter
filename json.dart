// Use fromJson() & toJson() for Efficient Data Parsing
import 'dart:convert';

class Product {
  final String name;
  final double price;

  Product({required this.name, required this.price});

  // Convert JSON to Dart Object
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      name: json["name"],
      price: (json["price"] as num).toDouble(),
    );
  }

  // Convert Dart Object to JSON
  Map<String, dynamic> toJson() {
    return {"name": name, "price": price};
  }
}

// Usage
void main() {
  String jsonString = '{"name": "Laptop", "price": 1200}';
  Map<String, dynamic> jsonMap = json.decode(jsonString);

  // Convert JSON to Dart Object
  Product product = Product.fromJson(jsonMap);
  print(product.name); // Output: Laptop

  // Convert Dart Object to JSON
  String jsonOutput = json.encode(product.toJson());
  print(jsonOutput); // Output: {"name":"Laptop","price":1200}
}

