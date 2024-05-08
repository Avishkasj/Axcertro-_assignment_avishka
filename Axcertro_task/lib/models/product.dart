// models/product.dart

class Product {
  final int id;
  final String name;
  final String handler;
  final String description;
  final String category;
  final String price;
  final List<String> images;

  Product({
    required this.id,
    required this.name,
    required this.handler,
    required this.description,
    required this.category,
    required this.price,
    required this.images,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      handler: json['handler'],
      description: json['description'],
      category: json['category'],
      price: json['price'],
      images: List<String>.from(json['images']),
    );
  }
}
