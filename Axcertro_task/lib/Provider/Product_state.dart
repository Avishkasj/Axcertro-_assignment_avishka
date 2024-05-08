import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/product.dart';

class ProductNotifier extends ChangeNotifier {
  List<Product> _products = [];

  List<Product> get products => _products;

  Future<void> loadProducts(BuildContext context) async {
    try {
      // Fetch data from GitHub URL
      final response = await http.get(Uri.parse('https://gist.githubusercontent.com/lathindu1/bf8e7a29e1b04153af43cb2b0d18b02a/raw/e58f5ea61ee448a70e87be707bdaec51437620c6/products.json'));

      if (response.statusCode == 200) {
        // Decode JSON data
        List<dynamic> jsonList = json.decode(response.body);
        // Convert JSON data to list of products
        _products = jsonList.map((json) => Product.fromJson(json)).toList();
        // Notify listeners that data has been loaded
        notifyListeners();
      } else {
        throw Exception('Failed to load products');
      }
    } catch (error) {
      // Handle error if data fetching fails
      print('Error loading products: $error');
    }
  }
}
