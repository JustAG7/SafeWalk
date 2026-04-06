import 'package:flutter/material.dart';

import '../../../shared/navigation/route_placeholder_screen.dart';

class ActiveFakeCallScreen extends StatelessWidget {
  const ActiveFakeCallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const RoutePlaceholderScreen(
      title: 'Active Fake Call',
      path: '/companion/fake-call/active',
      description: 'In-call status screen with scripted audio cues and quick end-call controls.',
    );
  }
}
