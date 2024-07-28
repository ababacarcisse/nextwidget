import 'package:flutter/material.dart';

class ReusableFloatingActionButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final bool isDarkMode;

  const ReusableFloatingActionButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.isDarkMode = false,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      backgroundColor: isDarkMode ? Colors.black : Colors.white,
      foregroundColor: isDarkMode ? Colors.white : Colors.black,
      child: Icon(icon),
    );
  }
}