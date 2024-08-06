const String buttonTemplate = '''
import 'package:flutter/material.dart';

enum ButtonVariant {
  default_,
  destructive,
  outline,
  secondary,
  ghost,
  link,
}

enum ButtonSize {
  default_,
  sm,
  lg,
  icon,
}

class Button extends StatelessWidget {
  final Widget child;
  final VoidCallback? onPressed;
  final ButtonVariant variant;
  final ButtonSize size;
  final bool asChild;

  const Button({
    Key? key,
    required this.child,
    this.onPressed,
    this.variant = ButtonVariant.default_,
    this.size = ButtonSize.default_,
    this.asChild = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: _getButtonStyle(context),
      child: asChild ? child : _defaultChildWrapper(),
    );
  }

  Widget _defaultChildWrapper() {
    return Padding(
      padding: _getPadding(),
      child: DefaultTextStyle(
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        child: child,
      ),
    );
  }

  ButtonStyle _getButtonStyle(BuildContext context) {
    final theme = Theme.of(context);
    
    return ButtonStyle(
      backgroundColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.disabled)) {
          return theme.disabledColor;
        }
        switch (variant) {
          case ButtonVariant.default_:
            return theme.primaryColor;
          case ButtonVariant.destructive:
            return Colors.red;
          case ButtonVariant.outline:
            return Colors.transparent;
          case ButtonVariant.secondary:
            return theme.colorScheme.secondary;
          case ButtonVariant.ghost:
            return Colors.transparent;
          case ButtonVariant.link:
            return Colors.transparent;
        }
      }),
      foregroundColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.disabled)) {
          return theme.disabledColor;
        }
        switch (variant) {
          case ButtonVariant.default_:
          case ButtonVariant.destructive:
            return Colors.white;
          case ButtonVariant.outline:
          case ButtonVariant.secondary:
          case ButtonVariant.ghost:
          case ButtonVariant.link:
            return theme.textTheme.button?.color;
        }
      }),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),
      side: MaterialStateProperty.resolveWith((states) {
        if (variant == ButtonVariant.outline) {
          return BorderSide(color: theme.dividerColor);
        }
        return null;
      }),
      padding: MaterialStateProperty.all(EdgeInsets.zero),
      minimumSize: MaterialStateProperty.all(_getMinimumSize()),
    );
  }

  EdgeInsetsGeometry _getPadding() {
    switch (size) {
      case ButtonSize.default_:
        return EdgeInsets.symmetric(horizontal: 16, vertical: 8);
      case ButtonSize.sm:
        return EdgeInsets.symmetric(horizontal: 12, vertical: 4);
      case ButtonSize.lg:
        return EdgeInsets.symmetric(horizontal: 32, vertical: 12);
      case ButtonSize.icon:
        return EdgeInsets.all(10);
    }
  }

  Size _getMinimumSize() {
    switch (size) {
      case ButtonSize.default_:
        return Size(0, 40);
      case ButtonSize.sm:
        return Size(0, 36);
      case ButtonSize.lg:
        return Size(0, 44);
      case ButtonSize.icon:
        return Size(40, 40);
    }
  }
}
''';