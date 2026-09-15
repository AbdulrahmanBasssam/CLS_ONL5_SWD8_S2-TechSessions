import 'package:flutter/material.dart';
import 'cart_db.dart';
import 'product.dart';

class CartProvider extends ChangeNotifier {
  List<Product> cart = [];

  Future<void> initCart() async {
    cart = await CartDb().getCartItems();
    notifyListeners();
  }

  Future<void> addToCart(Product product) async {
    cart.add(product);
    notifyListeners();
    await CartDb().addProduct(product);
  }

  Future<void> removeFromCart(Product product) async {
    cart.remove(product);
    notifyListeners();
    await CartDb().deleteProduct(product.id);
  }

  Future<void> clearCart() async {
    cart.clear();
    notifyListeners();
    await CartDb().clearCart();
  }

  double get totalPrice {
    double total = 0;
    for (var product in cart) {
      total += product.price;
    }
    return total;
  }
}
