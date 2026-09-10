import 'package:flutter/material.dart';

class GalleryScreen extends StatelessWidget {
  GalleryScreen({super.key});
  final List<String> images = List.generate(
    100,
    (index) => 'https://picsum.photos/id/${index + 100}/300/200',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Gallery')),
      body: GridView.builder(
        padding: EdgeInsets.all(8.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
          childAspectRatio: 2 / 3,
        ),
        itemBuilder: (context, index) {
          return Card(
            child: InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return Dialog(
                      child: Image.network(
                        images[index],
                        errorBuilder: (context, error, stackTrace) =>
                            Image.asset(
                              'assets/images/dawn.jpg',
                              fit: BoxFit.cover,
                            ),
                      ),
                    );
                  },
                );
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  images[index],
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      Image.asset('assets/images/dawn.jpg', fit: BoxFit.cover),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
