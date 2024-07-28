import 'package:flutter/material.dart';

class ModernCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;

  const ModernCheckbox({
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Checkbox(
            value: value,
            onChanged: onChanged,
            activeColor: Colors.blueAccent,
            checkColor: Colors.white,
          ),
          SizedBox(width: 8.0),
          Text(
            'Check me!',
            style: TextStyle(fontSize: 16.0, color: Colors.black87),
          ),
        ],
      ),
    );
  }
}
