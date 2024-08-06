const String statefulWidgetTemplate = '''
import 'package:flutter/material.dart';

class {{componentName}} extends StatefulWidget {
  const {{componentName}}({Key? key}) : super(key: key);

  @override
  _{{componentName}}State createState() => _{{componentName}}State();
}

class _{{componentName}}State extends State<{{componentName}}> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // TODO: Implement {{componentName}}
    );
  }
}
''';
