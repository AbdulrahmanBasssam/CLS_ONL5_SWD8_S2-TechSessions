import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart_provider.dart';
import 'cart_screen.dart';
import 'product.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  void initState() {
    Provider.of<CartProvider>(context, listen: false).initCart();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Products"),
        actions: [
          Consumer<CartProvider>(
            builder: (context, prov, _) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    IconButton(
                      icon: Icon(Icons.shopping_cart),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => CartScreen()),
                        );
                      },
                    ),
                    prov.cart.isNotEmpty
                        ? Positioned(
                            top: -1,
                            right: -1,
                            child: CircleAvatar(
                              radius: 11,
                              backgroundColor: Colors.red,
                              child: Text(
                                prov.cart.length.toString(),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          )
                        : Container(),
                  ],
                ),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(child: Text(items[index].id.toString())),
            title: Text(items[index].name),
            subtitle: Text(items[index].price.toString()),
            trailing: Consumer<CartProvider>(
              builder: (context, prov, _) {
                return prov.cart.map((e) => e.id).contains(items[index].id)
                    ? Padding(
                        padding: const EdgeInsetsDirectional.only(end: 25),
                        child: Icon(Icons.check, color: Colors.green),
                      )
                    : ElevatedButton(
                        onPressed: () {
                          prov.addToCart(items[index]);
                          ScaffoldMessenger.of(context).hideCurrentSnackBar();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                "${items[index].name} added to cart",
                              ),
                            ),
                          );
                        },
                        child: Text("ADD"),
                      );
              },
            ),
          );
        },
      ),
    );
  }
}
