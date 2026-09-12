import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider/cart_db.dart';
import 'provider/cart_provider.dart';
import 'provider/products_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CartDb().initDatabase();
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MyInitialApp(),
    ),
  );
}

class MyInitialApp extends StatelessWidget {
  const MyInitialApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProductsScreen(),
    );
  }
}
