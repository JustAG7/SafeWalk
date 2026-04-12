import 'package:flutter/material.dart';

class SetupContact {
  const SetupContact({
    required this.id,
    required this.name,
    required this.meta,
    required this.phone,
    required this.relationship,
    required this.avatarColor,
    this.initiallySelected = false,
    this.isOnline = true,
  });

  final String id;
  final String name;
  final String meta;
  final String phone;
  final String relationship;
  final Color avatarColor;
  final bool initiallySelected;
  final bool isOnline;

  String get initials {
    final parts = name.split(' ').where((part) => part.isNotEmpty).toList();
    if (parts.isEmpty) return '?';
    if (parts.length == 1) return parts.first.substring(0, 1).toUpperCase();
    return '${parts.first.substring(0, 1)}${parts.last.substring(0, 1)}'.toUpperCase();
  }
}
