# Documentation de la CLI NextWidget

## Introduction

La CLI NextWidget permet aux développeurs de générer des composants réutilisables et de gérer les thèmes dans leurs projets Flutter. Cette documentation explique comment utiliser la CLI pour créer des composants et des thèmes, et comment personnaliser ces thèmes.

## Installation

Pour installer la CLI NextWidget, ajoutez le package à votre projet Flutter :

```yaml
dependencies:
  nextwidget:
    path: ../

Ensuite, exécutez la commande suivante pour activer la CLI :
dart pub global activate --source path .

Utilisation de la CLI
Commande create
La commande create permet de créer des composants réutilisables. Utilisez l'option --type pour spécifier le type de composant à créer.
Exemple d'utilisation
Pour créer un bouton réutilisable :
flutter pub run nextwidget:cli create --type button

Commande theme

La commande theme permet d'ajouter ou de personnaliser des composants de thème. Utilisez l'option --add pour ajouter des composants de thème, et l'option --customize pour personnaliser les composants existants.
Ajouter tous les composants de thème
Pour ajouter tous les composants de thème à votre projet :
flutter pub run nextwidget:cli theme --add all
Personnaliser les composants de thème existants
Pour personnaliser les composants de thème existants :
flutter pub run nextwidget:cli theme --customize
Structure des Fichiers
Lorsque vous ajoutez des composants ou des thèmes, les fichiers sont organisés de la manière suivante :
lib/
├── components/
│   └── button.dart
├── theme/
│   ├── custom_theme.dart
│   ├── widgets/
│   │   ├── theme_customizer.dart
│   │   └── themed_app.dart


Exemple d'Utilisation
Thème Personnalisé
Voici un exemple de code pour utiliser un thème personnalisé dans votre application Flutter.
Fichier lib/theme/custom_theme.dart
dart
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


Fichier lib/theme/widgets/theme_customizer.dart
dart
import 'package:flutter/material.dart';
import 'package:your_package_name/src/theme/custom_theme.dart';
import 'package:your_package_name/src/theme/widgets/color_picker_dialog.dart';

class ThemeCustomizer extends StatefulWidget {
  final CustomTheme initialTheme;
  final ValueChanged<CustomTheme> onThemeChanged;

  const ThemeCustomizer({
    Key? key,
    required this.initialTheme,
    required this.onThemeChanged,
  }) : super(key: key);

  @override
  _ThemeCustomizerState createState() => _ThemeCustomizerState();
}

class _ThemeCustomizerState extends State<ThemeCustomizer> {
  late CustomTheme _currentTheme;

  @override
  void initState() {
    super.initState();
    _currentTheme = widget.initialTheme;
  }

  void _updateTheme(CustomTheme newTheme) {
    setState(() {
      _currentTheme = newTheme;
    });
    widget.onThemeChanged(newTheme);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildColorPicker('Background', _currentTheme.background, (color) {
          _updateTheme(_currentTheme.copyWith(background: color));
        }),
        _buildColorPicker('Foreground', _currentTheme.foreground, (color) {
          _updateTheme(_currentTheme.copyWith(foreground: color));
        }),
        // Ajoutez plus de color pickers pour les autres variables de thème
      ],
    );
  }

  Widget _buildColorPicker(String label, Color currentColor, ValueChanged<Color> onColorChanged) {
    return Row(
      children: [
        Text(label),
        Spacer(),
        GestureDetector(
          onTap: () async {
            Color? pickedColor = await showDialog(
              context: context,
              builder: (context) => ColorPickerDialog(currentColor: currentColor),
            );
            if (pickedColor != null) {
              onColorChanged(pickedColor);
            }
          },
          child: Container(
            width: 24,
            height: 24,
            color: currentColor,
          ),
        ),
      ],
    );
  }
}

Fichier lib/theme/widgets/themed_app.dart
dart
import 'package:flutter/material.dart';
import 'package:your_package_name/src/theme/custom_theme.dart';

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
        accentColor: theme.accent,
        backgroundColor: theme.background,
        cardColor: theme.card,
        textTheme: TextTheme(
          bodyText1: TextStyle(color: theme.foreground),
          bodyText2: TextStyle(color: theme.foreground),
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(theme.radius),
          ),
        ),
      ),
      child: child,
    );
  }
}

Exemple d'Utilisation dans lib/main.dart
dart
import 'package:flutter/material.dart';
import 'package:your_package_name/src/theme/custom_theme.dart';
import 'package:your_package_name/src/theme/widgets/theme_customizer.dart';
import 'package:your_package_name/src/theme/widgets/themed_app.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  CustomTheme _currentTheme = CustomTheme(
    background: Colors.white,
    foreground: Colors.black,
    card: Colors.grey[200]!,
    cardForeground: Colors.black,
    primary: Colors.blue,
    primaryForeground: Colors.white,
    secondary: Colors.green,
    secondaryForeground: Colors.white,
    accent: Colors.pink,
    accentForeground: Colors.white,
    border: Colors.grey,
    input: Colors.grey[300]!,
    ring: Colors.blueAccent,
    radius: 8.0,
  );

  @override
  Widget build(BuildContext context) {
    return ThemedApp(
      theme: _currentTheme,
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text('Custom Theme Example'),
          ),
          body: Column(
            children: [
              ThemeCustomizer(
                initialTheme: _currentTheme,
                onThemeChanged: (newTheme) {
                  setState(() {
                    _currentTheme = newTheme;
                  });
                },
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text('This is a card with custom theme.'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}