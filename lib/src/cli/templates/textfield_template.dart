import 'package:flutter/material.dart';

class ReusableTextField extends StatelessWidget {
  final String placeholder;
  final bool isDarkMode;

  const ReusableTextField({
    super.key,
    required this.placeholder,
    this.isDarkMode = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: placeholder,
        filled: true,
        fillColor: isDarkMode ? Colors.black12 : Colors.white70,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      style: TextStyle(
        color: isDarkMode ? Colors.white : Colors.black,
      ),
    );
  }
}