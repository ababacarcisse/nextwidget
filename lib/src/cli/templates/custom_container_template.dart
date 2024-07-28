import 'package:flutter/material.dart';

class ReusableContainer extends StatelessWidget {
  final Widget child;
  final bool isDarkMode;
  final double padding;
  final double borderRadius;

  const ReusableContainer({
    super.key,
    required this.child,
    this.isDarkMode = false,
    this.padding = 16.0,
    this.borderRadius = 8.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: isDarkMode ? Colors.black12 : Colors.white,
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: [
          BoxShadow(
            color: isDarkMode ? Colors.white24 : Colors.black12,
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: child,
    );
  }
}