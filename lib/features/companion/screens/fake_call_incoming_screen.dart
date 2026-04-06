import 'package:flutter/material.dart';

import '../../../shared/navigation/route_placeholder_screen.dart';

class FakeCallIncomingScreen extends StatelessWidget {
  const FakeCallIncomingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const RoutePlaceholderScreen(
      title: 'Fake Call Incoming',
      path: '/companion/fake-call/incoming',
      description: 'Incoming fake call prompt used to create a safe exit from uncomfortable situations.',
    );
  }
}
