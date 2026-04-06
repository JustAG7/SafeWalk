import 'package:flutter/material.dart';

class RouteSafetyCard extends StatelessWidget {
  const RouteSafetyCard({
    super.key,
    required this.title,
    this.summary,
    this.items = const <String>[],
    this.action,
    this.accentColor,
  });

  final String title;
  final String? summary;
  final List<String> items;
  final Widget? action;
  final Color? accentColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = accentColor ?? theme.colorScheme.primary;

    return Card(
      child: Container(
        decoration: BoxDecoration(
          border: Border(left: BorderSide(color: color, width: 4)),
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.shield_outlined, color: color),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(title, style: theme.textTheme.titleMedium),
                ),
                if (action != null) action!,
              ],
            ),
            if (summary != null) ...[
              const SizedBox(height: 8),
              Text(summary!, style: theme.textTheme.bodyMedium),
            ],
            if (items.isNotEmpty) ...[
              const SizedBox(height: 12),
              ...items.map(
                (item) => Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('-', style: theme.textTheme.bodyMedium),
                      const SizedBox(width: 8),
                      Expanded(child: Text(item)),
                    ],
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
