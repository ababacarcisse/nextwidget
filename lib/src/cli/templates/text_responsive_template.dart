import 'package:flutter/material.dart';

class ResponsiveText extends StatelessWidget {
  final String text;
  final double? fontSize;

  const ResponsiveText({
    required this.text,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize ?? MediaQuery.of(context).textScaleFactor * 16.0,
      ),
    );
  }
}
