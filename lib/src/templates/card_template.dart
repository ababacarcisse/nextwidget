const String cardTemplate = '''
import 'package:flutter/material.dart';

class Card extends StatelessWidget {
  final Widget? header;
  final Widget content;
  final Widget? footer;
  final EdgeInsetsGeometry padding;
  final BorderRadius? borderRadius;

  const Card({
    Key? key,
    this.header,
    required this.content,
    this.footer,
    this.padding = const EdgeInsets.all(16.0),
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: borderRadius ?? BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (header != null)
            Padding(
              padding: padding,
              child: header!,
            ),
          Padding(
            padding: padding,
            child: content,
          ),
          if (footer != null)
            Padding(
              padding: padding,
              child: footer!,
            ),
        ],
      ),
    );
  }
}

// Usage example:
// Card(
//   header: Text('Card Header'),
//   content: Text('This is the main content of the card.'),
//   footer: Text('Card Footer'),
// )
''';