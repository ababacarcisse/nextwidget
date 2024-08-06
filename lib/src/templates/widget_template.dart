const String widgetTemplate = '''
import 'package:flutter/material.dart';

class {{componentName}} extends StatelessWidget {
  const {{componentName}}({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // TODO: Implement {{componentName}}
    );
  }
}
''';
