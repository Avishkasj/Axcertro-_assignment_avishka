import 'package:flutter/material.dart';
import 'ProductDetailPage.dart';
import 'models/product.dart';


class HomePage extends StatelessWidget {
  final List<Product> products;

  HomePage({required this.products});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gadgets'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailPage(product: products[index]),
                ),
              );
            },
            child: Card(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Image.network(products[index].images[0], width: 100, height: 100),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(products[index].name, style: TextStyle(fontSize: 18)),
                        Text(products[index].price, style: TextStyle(fontSize: 16)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
