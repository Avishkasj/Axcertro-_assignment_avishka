import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'ProductDetailPage.dart';
import 'Provider/Product_state.dart';
import '../models/product.dart';

import 'ShoppingCartPage.dart';
import 'Provider/ShoppingCart_state.dart';

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

    // Filtered products based on search query
    List<Product> filteredProducts = products.where((product) {
      if (_searchController.text.isEmpty) {
        return true; // Show all products if search query is empty
      } else {
        return product.name.toLowerCase().contains(_searchController.text.toLowerCase());
      }
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Gadgets'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              // Navigate to the ShoppingCartPage
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ShoppingCartPage()),
              );
            },
          ),
        ],
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
          Visibility(
            visible: filteredProducts.isNotEmpty, // Show GridView only if there are matching search results
            child: Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Two cards in one row
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                ),
                itemCount: filteredProducts.length,
                itemBuilder: (context, index) {
                  final product = filteredProducts[index];
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(
                            product.images.isNotEmpty ? product.images[0] : '',
                            width: double.infinity,
                            height: 130.0,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Icon(Icons.image); // Display an icon if image fails to load
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  product.name,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(product.price),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Visibility(
            visible: filteredProducts.isEmpty, // Show message if there are no matching search results
            child: Text('No matching products found.'),
          ),
        ],
      ),
    );
  }
}
