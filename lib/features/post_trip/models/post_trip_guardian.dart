import 'package:flutter/material.dart';

class PostTripGuardian {
  const PostTripGuardian({
    required this.id,
    required this.name,
    required this.subtitle,
    required this.avatarColor,
    this.isDelivered = true,
  });

  final String id;
  final String name;
  final String subtitle;
  final Color avatarColor;
  final bool isDelivered;
}
