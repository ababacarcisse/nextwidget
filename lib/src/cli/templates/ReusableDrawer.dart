import 'package:flutter/material.dart';

class ReusableDrawer extends StatelessWidget {
  final bool isDarkMode;
  final List<Widget> items;

  const ReusableDrawer({
    super.key,
    this.isDarkMode = false,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: isDarkMode ? Colors.black : Colors.blue,
            ),
            child: Text(
              'Header',
              style: TextStyle(
                color: isDarkMode ? Colors.white : Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ...items,
        ],
      ),
    );
  }
}