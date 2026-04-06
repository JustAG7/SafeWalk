import 'package:flutter/material.dart';

import '../../../shared/navigation/route_placeholder_screen.dart';

class CompanionModeMainScreen extends StatelessWidget {
  const CompanionModeMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const RoutePlaceholderScreen(
      title: 'Companion Mode Main',
      path: '/companion/main',
      description: 'Primary companion experience for live trip support and discreet assistance.',
    );
  }
}
