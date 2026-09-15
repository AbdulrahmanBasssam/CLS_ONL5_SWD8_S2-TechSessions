import 'product.dart';
import 'package:sqflite/sqflite.dart';

class CartDb {
  static late Database database;
  final tableName = 'Cart';

  Future<void> initDatabase() async {
    var databaseDirectoryPath = await getDatabasesPath();
    String filePath = '$databaseDirectoryPath/cart.db';
    database = await openDatabase(
      filePath,
      version: 1,
      onCreate: (db, version) {
        db.execute(
          'CREATE TABLE $tableName(id INTEGER PRIMARY KEY, name TEXT, price REAL)',
        );
      },
    );
  }

  Future<void> addProduct(Product product) async {
    await database.insert(tableName, product.toMap());
  }

  Future<void> updateProduct(Product product) async {
    await database.update(
      tableName,
      product.toMap(),
      where: 'id = ?',
      whereArgs: [product.id],
    );
  }

  Future<List<Product>> getCartItems() async {
    final List<Map<String, dynamic>> maps = await database.query(tableName);
    List<Product> products = [];
    for (var map in maps) {
      products.add(Product.fromMap(map));
    }
    return products;
  }

  Future<void> deleteProduct(int id) async {
    await database.delete(tableName, where: 'id = ?', whereArgs: [id]);
  }

  Future<void> clearCart() async {
    await database.delete(tableName);
  }
}
