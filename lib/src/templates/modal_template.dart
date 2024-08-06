const String modalTemplate = '''
import 'package:flutter/material.dart';

class Modal extends StatelessWidget {
  final Widget title;
  final Widget content;
  final List<Widget> actions;
  final VoidCallback onClose;

  const Modal({
    Key? key,
    required this.title,
    required this.content,
    required this.actions,
    required this.onClose,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                title,
                IconButton(
                  icon: Icon(Icons.close),
                  onPressed: onClose,
                ),
              ],
            ),
            SizedBox(height: 16.0),
            content,
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: actions,
            ),
          ],
        ),
      ),
    );
  }
}

// Usage example:
// showDialog(
//   context: context,
//   builder: (context) => Modal(
//     title: Text('Confirmation'),
//     content: Text('Are you sure you want to proceed?'),
//     actions: [
//       TextButton(
//         onPressed: () => Navigator.of(context).pop(),
//         child: Text('Cancel'),
//       ),
//       ElevatedButton(
//         onPressed: () {
//           // Perform action
//           Navigator.of(context).pop();
//         },
//         child: Text('Confirm'),
//       ),
//     ],
//     onClose: () => Navigator.of(context).pop(),
//   ),
// );
''';