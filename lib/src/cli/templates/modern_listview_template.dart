import 'package:flutter/material.dart';

class ModernListView extends StatelessWidget {
  final List<String> items;

  const ModernListView({
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Modern ListView'),
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(8.0),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Card(
            elevation: 4.0,
            margin: EdgeInsets.symmetric(vertical: 8.0),
            child: ListTile(
              contentPadding: EdgeInsets.all(16.0),
              leading: Icon(Icons.star, color: Colors.blueAccent),
              title: Text(
                item,
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              subtitle: Text('Subtitle for $item'),
              trailing: Icon(Icons.more_vert, color: Colors.grey),
              onTap: () => _onItemTap(context, item),
            ),
          );
        },
      ),
    );
  }

  void _onItemTap(BuildContext context, String item) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Item Selected'),
        content: Text('You selected: $item'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }
}
