class Product {
  final int id;
  final String name;
  final double price;

  Product({required this.name, required this.id, required this.price});

  Product.fromMap(Map<String, dynamic> map)
    : id = map['id'],
      name = map['name'],
      price = map['price'];

  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name, 'price': price};
  }
}

final List<Product> items = [
  Product(id: 1, name: "Laptop", price: 850.0),
  Product(id: 2, name: "Smartphone", price: 650.0),
  Product(id: 3, name: "Wireless Headphones", price: 120.0),
  Product(id: 4, name: "Bluetooth Speaker", price: 75.0),
  Product(id: 5, name: "Smart Watch", price: 199.0),
  Product(id: 6, name: "Keyboard", price: 45.0),
  Product(id: 7, name: "Wireless Mouse", price: 30.0),
  Product(id: 8, name: "USB-C Cable", price: 15.0),
  Product(id: 9, name: "Power Bank", price: 55.0),
  Product(id: 10, name: "Phone Stand", price: 25.0),
  Product(id: 11, name: "Tablet", price: 420.0),
  Product(id: 12, name: "Monitor", price: 280.0),
  Product(id: 13, name: "Webcam", price: 90.0),
  Product(id: 14, name: "Gaming Controller", price: 70.0),
  Product(id: 15, name: "External SSD", price: 150.0),
  Product(id: 16, name: "USB Flash Drive", price: 20.0),
  Product(id: 17, name: "Laptop Backpack", price: 60.0),
  Product(id: 18, name: "Wireless Charger", price: 35.0),
  Product(id: 19, name: "Desk Lamp", price: 40.0),
  Product(id: 20, name: "HDMI Cable", price: 18.0),
];
