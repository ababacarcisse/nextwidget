import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import '../custom_theme.dart';
 

class ThemeCustomizer extends StatefulWidget {
  final CustomTheme initialTheme;
  final ValueChanged<CustomTheme> onThemeChanged;

  const ThemeCustomizer({
    super.key,
    required this.initialTheme,
    required this.onThemeChanged,
  });

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
        const Spacer(),
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

class ColorPickerDialog extends StatelessWidget {
  final Color currentColor;

  const ColorPickerDialog({super.key, required this.currentColor});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Pick a color'),
      content: SingleChildScrollView(
        child: ColorPicker(
          pickerColor: currentColor,
          onColorChanged: (color) {
            Navigator.of(context).pop(color);
          },
        ),
      ),
    );
  }
}