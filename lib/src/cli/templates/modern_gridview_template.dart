import 'package:flutter/material.dart';

class ModernGridView extends StatelessWidget {
  final List<String> items;

  const ModernGridView({
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Modern GridView'),
        backgroundColor: Colors.teal,
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(8.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Card(
            elevation: 6.0,
            child: GridTile(
              footer: Container(
                color: Colors.black54,
                child: ListTile(
                  title: Text(
                    item,
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              child: Icon(Icons.image, size: 80.0, color: Colors.blueAccent),
            ),
          );
        },
      ),
    );
  }
}
