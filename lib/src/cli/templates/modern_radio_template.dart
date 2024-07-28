import 'package:flutter/material.dart';

class ModernRadio extends StatelessWidget {
  final String groupValue;
  final String value;
  final ValueChanged<String?> onChanged;

  const ModernRadio({
    required this.groupValue,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Radio<String>(
            value: value,
            groupValue: groupValue,
            onChanged: onChanged,
            activeColor: Colors.blueAccent,
          ),
          SizedBox(width: 8.0),
          Text(
            'Option $value',
            style: TextStyle(fontSize: 16.0, color: Colors.black87),
          ),
        ],
      ),
    );
  }
}
