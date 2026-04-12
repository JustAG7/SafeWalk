import 'package:flutter/material.dart';

class EntryTokens {
  EntryTokens._();

  static const Color backgroundLight = Color(0xFFF9F9FF);
  static const Color backgroundDark = Color(0xFF071E36);
  static const Color primary = Color(0xFF002444);
  static const Color primaryAlt = Color(0xFF1B3A5C);
  static const Color heading = Color(0xFF002444);
  static const Color text = Color(0xFF43474E);
  static const Color muted = Color(0xFF73777F);
  static const Color subtle = Color(0xFF5C6778);
  static const Color line = Color(0xFFE2E8F0);
  static const Color fieldBorder = Color(0xFFE5EAF5);
  static const Color focus = Color(0xFF0058BE);
  static const Color success = Color(0xFF4EDEA3);
  static const Color successDark = Color(0xFF002A1A);
  static const Color danger = Color(0xFFBA1A1A);
  static const Color sky = Color(0xFF2F8CFF);
  static const Color skyDark = Color(0xFF123E8F);

  static const LinearGradient darkBackground = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF072442), Color(0xFF0C2F55), Color(0xFF0A2340)],
  );

  static const LinearGradient lightBackground = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFFF5F7FF), Color(0xFFF9F9FF), Color(0xFFF2F6FF)],
  );

  static const LinearGradient primaryButton = LinearGradient(
    colors: [Color(0xFF002444), Color(0xFF1B3A5C)],
  );

  static const LinearGradient brandMark = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF2F8CFF), Color(0xFF123E8F)],
  );

  static const List<BoxShadow> surfaceShadow = [
    BoxShadow(
      color: Color(0x12002444),
      blurRadius: 32,
      offset: Offset(0, 18),
    ),
  ];

  static const List<BoxShadow> glassShadow = [
    BoxShadow(
      color: Color(0x14000000),
      blurRadius: 30,
      offset: Offset(0, 16),
    ),
  ];

  static const List<BoxShadow> buttonShadow = [
    BoxShadow(
      color: Color(0x22002444),
      blurRadius: 24,
      offset: Offset(0, 12),
    ),
  ];
}
