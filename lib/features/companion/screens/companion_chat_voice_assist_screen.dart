import 'package:flutter/material.dart';

import '../../../shared/navigation/route_placeholder_screen.dart';

class CompanionChatVoiceAssistScreen extends StatelessWidget {
  const CompanionChatVoiceAssistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const RoutePlaceholderScreen(
      title: 'Companion Chat / Voice Assist',
      path: '/companion/chat-voice',
      description: 'Text and voice assistance surface for guided support during a live trip.',
    );
  }
}
