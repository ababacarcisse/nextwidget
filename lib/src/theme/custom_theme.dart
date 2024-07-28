import 'package:flutter/material.dart';

class CustomTheme {
  final Color background;
  final Color foreground;
  final Color card;
  final Color cardForeground;
  final Color primary;
  final Color primaryForeground;
  final Color secondary;
  final Color secondaryForeground;
  final Color accent;
  final Color accentForeground;
  final Color border;
  final Color input;
  final Color ring;
  final double radius;

  CustomTheme({
    required this.background,
    required this.foreground,
    required this.card,
    required this.cardForeground,
    required this.primary,
    required this.primaryForeground,
    required this.secondary,
    required this.secondaryForeground,
    required this.accent,
    required this.accentForeground,
    required this.border,
    required this.input,
    required this.ring,
    required this.radius,
  });

  CustomTheme copyWith({
    Color? background,
    Color? foreground,
    Color? card,
    Color? cardForeground,
    Color? primary,
    Color? primaryForeground,
    Color? secondary,
    Color? secondaryForeground,
    Color? accent,
    Color? accentForeground,
    Color? border,
    Color? input,
    Color? ring,
    double? radius,
  }) {
    return CustomTheme(
      background: background ?? this.background,
      foreground: foreground ?? this.foreground,
      card: card ?? this.card,
      cardForeground: cardForeground ?? this.cardForeground,
      primary: primary ?? this.primary,
      primaryForeground: primaryForeground ?? this.primaryForeground,
      secondary: secondary ?? this.secondary,
      secondaryForeground: secondaryForeground ?? this.secondaryForeground,
      accent: accent ?? this.accent,
      accentForeground: accentForeground ?? this.accentForeground,
      border: border ?? this.border,
      input: input ?? this.input,
      ring: ring ?? this.ring,
      radius: radius ?? this.radius,
    );
  }
}