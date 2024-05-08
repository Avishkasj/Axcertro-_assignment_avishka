import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'ProductDetailPage.dart';
import 'Provider/Product_state.dart';


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productNotifier = Provider.of<ProductNotifier>(context);
    final products = productNotifier.products;

    return Scaffold(
      appBar: AppBar(
        title: Text('Gadgets'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailPage(product: product),
                ),
              );
            },
            child: Card(
              child: ListTile(
                leading: Image.network(
                  product.images.isNotEmpty ? product.images[0] : '',
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Icon(Icons.image); // Display an icon if image fails to load
                  },
                ),
                title: Text(product.name),
                subtitle: Text(product.price),
              ),
            ),
          );
        },
      ),
    );
  }
}
