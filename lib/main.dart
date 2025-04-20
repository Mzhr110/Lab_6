import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pinterest',
      home: ResponsiveGridPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ResponsiveGridPage extends StatelessWidget {
  final List<String> imageUrls = List.generate(
    20,
    (index) => 'https://picsum.photos/seed/$index/300/300',
  );

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    int crossAxisCount = (screenWidth / 150).floor();

    return Scaffold(
      appBar: AppBar(title: Text('Pinterest')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: imageUrls.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(imageUrls[index], fit: BoxFit.cover),
            );
          },
        ),
      ),
    );
  }
}
