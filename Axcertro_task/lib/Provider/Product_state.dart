import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';


import '../models/product.dart';

class ProductNotifier extends ChangeNotifier {
  List<Product> _products = [];

  List<Product> get products => _products;

  void loadProducts(BuildContext context) async {
    try {
      String jsonString = await rootBundle.loadString('lib/assets/data.json');
      List<dynamic> jsonList = json.decode(jsonString);
      _products = jsonList.map((json) => Product.fromJson(json)).toList();
      notifyListeners();
    } catch (error) {
      print('Error loading products: $error');
    }
  }
}
