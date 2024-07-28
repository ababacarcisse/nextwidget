import 'package:flutter/material.dart';

class ReusableSnackBar {
  static void show(BuildContext context, String message, {bool isDarkMode = false, SnackBarAction? action}) {
    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: isDarkMode ? Colors.grey[900] : Colors.grey[300],
      action: action,
      behavior: SnackBarBehavior.floating,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}