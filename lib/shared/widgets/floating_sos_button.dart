import 'package:flutter/material.dart';

class FloatingSOSButton extends StatelessWidget {
  const FloatingSOSButton({
    super.key,
    required this.onPressed,
    this.label = 'SOS',
    this.icon = Icons.emergency,
    this.backgroundColor,
    this.foregroundColor,
  });

  final VoidCallback? onPressed;
  final String label;
  final IconData icon;
  final Color? backgroundColor;
  final Color? foregroundColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return FloatingActionButton.extended(
      onPressed: onPressed,
      backgroundColor: backgroundColor ?? theme.colorScheme.error,
      foregroundColor: foregroundColor ?? theme.colorScheme.onError,
      icon: Icon(icon),
      label: Text(label),
    );
  }
}
