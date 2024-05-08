import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'ProductDetailPage.dart';
import 'Provider/Product_state.dart';
import '../models/product.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final productNotifier = Provider.of<ProductNotifier>(context);
    List<Product> products = productNotifier.products;

    return Scaffold(
      appBar: AppBar(
        title: Text('Gadgets'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search Products',
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (value) {
                setState(() {}); // Trigger a rebuild to filter products
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                // Filter products based on search query
                if (_searchController.text.isNotEmpty &&
                    !product.name.toLowerCase().contains(_searchController.text.toLowerCase())) {
                  return Container(); // Hide products that don't match the search query
                }
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
          ),
        ],
      ),
    );
  }
}
