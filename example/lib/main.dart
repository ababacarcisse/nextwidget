import 'package:flutter/material.dart';
import 'package:nextwidget/nextwidget.dart';
import 'components/button.dart';

void main() {
  runApp(
    MyApp(),
  );
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NextWidget"),
      ),
      body: Column(
        children: [
          CustomButton(label: "Button 0", onPressed: () {}),
          CustomButton(label: "Button 1", onPressed: () {}),
          CustomButton(label: "Button 2", onPressed: () {}),
          CustomButton(label: "Button 3", onPressed: () {}),
        ],
      ) ,
    );
  }
}
