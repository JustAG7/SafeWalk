import 'package:flutter/material.dart';

class ContactTile extends StatelessWidget {
  const ContactTile({
    super.key,
    required this.title,
    this.subtitle,
    this.leading,
    this.trailing,
    this.onTap,
    this.isDense = false,
  });

  final String title;
  final String? subtitle;
  final Widget? leading;
  final Widget? trailing;
  final VoidCallback? onTap;
  final bool isDense;

  @override
  Widget build(BuildContext context) {
    final content = ListTile(
      dense: isDense,
      leading: leading ??
          CircleAvatar(
            child: Text(
              title.trim().isNotEmpty
                  ? title.trim().substring(0, 1).toUpperCase()
                  : '?',
            ),
          ),
      title: Text(title),
      subtitle: subtitle == null ? null : Text(subtitle!),
      trailing: trailing,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
    );

    if (onTap == null) {
      return Card(child: content);
    }

    return Card(
      child: InkWell(
        onTap: onTap,
        child: content,
      ),
    );
  }
}
