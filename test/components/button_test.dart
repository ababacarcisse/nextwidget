import 'package:flutter_test/flutter_test.dart';
import 'package:nextwidget/src/components/button.dart';
import 'package:flutter/material.dart';

void main() {
  testWidgets('ReusableButton displays label and responds to tap', (WidgetTester tester) async {
    bool pressed = false;

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: ReusableButton(
          label: 'Press me',
          onPressed: () {
            pressed = true;
          },
        ),
      ),
    ));

    expect(find.text('Press me'), findsOneWidget);
    await tester.tap(find.byType(ReusableButton));
    expect(pressed, isTrue);
  });
}