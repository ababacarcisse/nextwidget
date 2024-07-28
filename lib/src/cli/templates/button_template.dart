import 'package:flutter/material.dart';

class ReusableButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final bool isDarkMode;

  const ReusableButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.isDarkMode = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(
          isDarkMode ? Colors.black : Colors.white,
        ),
        foregroundColor: WidgetStateProperty.all(
          isDarkMode ? Colors.white : Colors.black,
        ),
        overlayColor: WidgetStateProperty.all(
          isDarkMode ? Colors.white24 : Colors.black12,
        ),
        elevation: WidgetStateProperty.all(5),
      ),
      onPressed: onPressed,
      child: Text(label),
    );
  }
}