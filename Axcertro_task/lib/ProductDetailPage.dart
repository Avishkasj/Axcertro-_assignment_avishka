import 'package:flutter/material.dart';

import 'models/product.dart';


class ProductDetailPage extends StatelessWidget {
  final Product product;

  ProductDetailPage({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Image.network(product.images[0], width: 200, height: 200)),
            SizedBox(height: 20),
            Text(product.name, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text(product.price, style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
            Text(product.description, style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
