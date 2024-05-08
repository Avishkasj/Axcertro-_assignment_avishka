import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Provider/ShoppingCart_state.dart';
import '../models/product.dart';

class ShoppingCartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ShoppingCart shoppingCart = Provider.of<ShoppingCart>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'),
      ),
      body: ListView.builder(
        itemCount: shoppingCart.items.length,
        itemBuilder: (context, index) {
          final Product product = shoppingCart.items[index];
          return ListTile(
            title: Text(product.name),
            subtitle: Text(product.price),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                shoppingCart.removeFromCart(product);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${product.name} removed from cart'),
                    duration: Duration(seconds: 2),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
