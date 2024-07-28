import 'package:flutter/material.dart';

class ReusableImage extends StatelessWidget {
  final String imageUrl;
  final double borderRadius;
  final bool isDarkMode;

  const ReusableImage({
    super.key,
    required this.imageUrl,
    this.borderRadius = 8.0,
    this.isDarkMode = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: [
          BoxShadow(
            color: isDarkMode ? Colors.black26 : Colors.grey[300]!,
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}