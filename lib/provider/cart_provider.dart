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

  void removeFromCart(Product product) {
    cart.remove(product);
    notifyListeners();
    // Remove from local storage
  }

  void clearCart() {
    cart.clear();
    notifyListeners();
    // Clear local storage
  }

  double get totalPrice {
    double total = 0;
    for (var product in cart) {
      total += product.price;
    }
    return total;
  }
}
