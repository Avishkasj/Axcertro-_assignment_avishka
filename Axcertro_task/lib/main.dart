import 'dart:convert';
import 'package:flutter/material.dart';

import 'HomePage.dart';
import 'models/product.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Commerce App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FutureBuilder<List<Product>>(
        future: loadProducts(context), // Pass context here
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }
          return HomePage(products: snapshot.data!); // Pass products to HomePage
        },
      ),
    );
  }
}

Future<List<Product>> loadProducts(BuildContext context) async {
  String jsonString = await DefaultAssetBundle.of(context).loadString('lib/assets/data.json');
  List<dynamic> jsonList = json.decode(jsonString);
  List<Product> products = jsonList.map((json) => Product.fromJson(json)).toList();
  return products;
}
