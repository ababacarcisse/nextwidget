import 'package:flutter/material.dart';

class ReusableAlertDialog extends StatelessWidget {
  final String title;
  final String content;
  final VoidCallback onConfirm;
  final bool isDarkMode;

  const ReusableAlertDialog({
    super.key,
    required this.title,
    required this.content,
    required this.onConfirm,
    this.isDarkMode = false,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: isDarkMode ? Colors.black : Colors.white,
      title: Text(
        title,
        style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
      ),
      content: Text(
        content,
        style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(
            'Cancel',
            style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
          ),
        ),
        TextButton(
          onPressed: onConfirm,
          child: Text(
            'Confirm',
            style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
          ),
        ),
      ],
    );
  }
}