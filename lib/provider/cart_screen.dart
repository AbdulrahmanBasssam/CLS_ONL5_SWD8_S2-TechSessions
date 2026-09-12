import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart_provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context, cartProvider, child) {
        return Scaffold(
          appBar: AppBar(title: Text("Cart")),
          body: ListView.builder(
            itemCount: cartProvider.cart.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(
                  child: Text(cartProvider.cart[index].id.toString()),
                ),
                title: Text(cartProvider.cart[index].name),
                subtitle: Text(cartProvider.cart[index].price.toString()),
                trailing: IconButton(
                  onPressed: () {
                    cartProvider.removeFromCart(cartProvider.cart[index]);
                  },
                  icon: Icon(Icons.delete, color: Colors.red),
                ),
              );
            },
          ),
          bottomNavigationBar: BottomAppBar(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Total: ${cartProvider.totalPrice.toString()}",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                ElevatedButton(
                  onPressed: () {
                    cartProvider.clearCart();
                  },
                  child: Text("Clear Cart"),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
