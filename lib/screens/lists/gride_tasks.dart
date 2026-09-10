// 🔹 Part 1: ListView of Categories
import 'package:flutter/material.dart';

class CategoryListScreen extends StatelessWidget {
  final List<Map<String, String>> categories = [
    {'title': 'Electronics', 'desc': 'Phones, laptops, gadgets'},
    {'title': 'Fashion', 'desc': 'Clothes, shoes, accessories'},
    {'title': 'Home Decor', 'desc': 'Furniture, plants, lighting'},
    {'title': 'Books', 'desc': 'Novels, education, more'},
    {'title': 'Books', 'desc': 'Novels, education, more'},
    {'title': 'Books', 'desc': 'Novels, education, more'},
    {'title': 'Books', 'desc': 'Novels, education, more'},
    {'title': 'Books', 'desc': 'Novels, education, more'},
    {'title': 'Books', 'desc': 'Novels, education, more'},
    {'title': 'Books', 'desc': 'Novels, education, more'},
    {'title': 'Books', 'desc': 'Novels, education, more'},
  ];

  CategoryListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Categories')),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return GestureDetector(
            onTap: () => print('Tapped: ${category['title']}'),
            child: Card(
              margin: EdgeInsets.all(10),
              child: ListTile(
                leading: Icon(Icons.category, color: Colors.blue),
                title: Text(category['title']!),
                subtitle: Text(category['desc']!),
                trailing: TextButton(
                  child: Text('See All'),
                  onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('See all in ${category['title']}')),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

// 🔹 Part 2: GridView of Products
class ProductGridScreen extends StatefulWidget {
  const ProductGridScreen({super.key});

  @override
  _ProductGridScreenState createState() => _ProductGridScreenState();
}

class _ProductGridScreenState extends State<ProductGridScreen> {
  List<Map<String, dynamic>> products = [
    {
      'title': 'Phone',
      'price': 299,
      'fav': false,
      'image':
          'https://platform.theverge.com/wp-content/uploads/sites/2/chorus/uploads/chorus_asset/file/25626687/DSC08433.jpg?quality=90&strip=all&crop=16.675%2C0%2C66.65%2C100&w=2400',
    },
    {
      'title': 'Shoes',
      'price': 79,
      'fav': false,
      'image':
          'https://www.skechers.com/dw/image/v2/BDCN_PRD/on/demandware.static/-/Library-Sites-SkechersSharedLibrary/default/dwc8f87821/images/2024-Images/Q2/SKX62403%20Shop%20by%20Style%20Grid%20Environmental%20Shots%20Spring-Summer%202024_Womens_750x664-Slip-ins%20149937GYMT.jpg?sw=356',
    },
    {
      'title': 'Lamp',
      'price': 45,
      'fav': false,
      'image':
          'https://cdn.britannica.com/88/212888-050-6795342C/study-lamp-electrical-cord.jpg',
    },
    {
      'title': 'Book',
      'price': 20,
      'fav': false,
      'image':
          'https://www.shutterstock.com/image-photo/book-open-pages-close-up-600nw-2562942291.jpg',
    },
    {
      'title': 'Watch',
      'price': 149,
      'fav': false,
      'image':
          'https://www.shutterstock.com/image-photo/book-open-pages-close-up-600nw-2562942291.jpg',
    },
    {
      'title': 'Bag',
      'price': 59,
      'fav': false,
      'image':
          'https://www.shutterstock.com/image-photo/book-open-pages-close-up-600nw-2562942291.jpg',
    },
  ];

  void toggleFavorite(int index) {
    setState(() {
      products[index]['fav'] = !products[index]['fav'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Products')),
      body: GridView.builder(
        padding: EdgeInsets.all(12),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 3 / 4,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return GestureDetector(
            onTap: () => print('Tapped: ${product['title']}'),
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      product['image'],
                      height: 150,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Text(
                    product['title'],
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Text('\$${product['price']}', style: TextStyle(fontSize: 14)),
                  IconButton(
                    icon: Icon(
                      product['fav'] ? Icons.favorite : Icons.favorite_border,
                      color: product['fav'] ? Colors.red : Colors.grey,
                    ),
                    onPressed: () => toggleFavorite(index),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
