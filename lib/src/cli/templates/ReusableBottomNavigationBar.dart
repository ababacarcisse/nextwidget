import 'package:flutter/material.dart';

class ReusableBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;
  final bool isDarkMode;
  final List<BottomNavigationBarItem> items;

  const ReusableBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
    required this.items,
    this.isDarkMode = false,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      items: items,
      backgroundColor: isDarkMode ? Colors.black : Colors.white,
      selectedItemColor: isDarkMode ? Colors.white : Colors.black,
      unselectedItemColor: isDarkMode ? Colors.white54 : Colors.black54,
      showUnselectedLabels: true,
    );
  }
}