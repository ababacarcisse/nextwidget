import 'package:flutter/material.dart';
 
import '../custom_theme.dart';

class ThemedApp extends StatelessWidget {
  final CustomTheme theme;
  final Widget child;

  const ThemedApp({
    Key? key,
    required this.theme,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        primaryColor: theme.primary,
        cardColor: theme.card,
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: theme.foreground),
          bodyMedium: TextStyle(color: theme.foreground),
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(theme.radius),
          ),
        ), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: theme.accent).copyWith(surface: theme.background),
      ),
      child: child,
    );
  }
}