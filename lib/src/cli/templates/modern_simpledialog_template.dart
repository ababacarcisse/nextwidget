import 'package:flutter/material.dart';

class ModernSimpleDialog extends StatelessWidget {
  final List<String> options;

  const ModernSimpleDialog({
    required this.options,
  });

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Text('Select an option', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
      children: options.map((option) {
        return SimpleDialogOption(
          onPressed: () {
            Navigator.of(context).pop(option);
          },
          child: Text(option),
        );
      }).toList(),
    );
  }
}
