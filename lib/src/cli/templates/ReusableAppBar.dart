import 'package:flutter/material.dart';

class ReusableAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool isDarkMode;
  final List<Widget>? actions;

  const ReusableAppBar({
    super.key,
    required this.title,
    this.isDarkMode = false,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      backgroundColor: isDarkMode ? Colors.black : Colors.white,
      foregroundColor: isDarkMode ? Colors.white : Colors.black,
      actions: actions,
      elevation: 4.0,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}