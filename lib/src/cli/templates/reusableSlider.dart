import 'package:flutter/material.dart';

class ReusableSlider extends StatelessWidget {
  final double value;
  final ValueChanged<double> onChanged;
  final bool isDarkMode;
  final double min;
  final double max;

  const ReusableSlider({
    super.key,
    required this.value,
    required this.onChanged,
    this.isDarkMode = false,
    this.min = 0.0,
    this.max = 100.0,
  });

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: value,
      onChanged: onChanged,
      min: min,
      max: max,
      activeColor: isDarkMode ? Colors.white : Colors.black,
      inactiveColor: isDarkMode ? Colors.white24 : Colors.black12,
    );
  }
}