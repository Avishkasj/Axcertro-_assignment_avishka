import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Welcome.dart';
import 'HomePage.dart';
import 'Provider/Product_state.dart';
import 'Provider/ShoppingCart_state.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductNotifier()..loadProducts(context)),
        ChangeNotifierProvider(create: (_) => ShoppingCart()),

      ],
      child: MaterialApp(
        title: 'E-Commerce App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: welcome(),
      ),
    );
  }
}
