import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../trip_live/scenario_placeholder_screen.dart';

class EmergencyAlertSentScreen extends StatelessWidget {
  const EmergencyAlertSentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScenarioPlaceholderScreen(
      title: 'Emergency Alert Sent',
      category: 'Emergency',
      summary: 'Confirmation screen after the system sends an emergency alert.',
      routePath: '/emergency/alert-sent',
      accentColor: AppColors.emergencyRed,
      heroIcon: Icons.notification_important,
      bullets: <String>[
        'Marks the moment the emergency alert is dispatched.',
        'Leads into contact calling and safety point support.',
        'Should remain visible until the user gets help or cancels.',
      ],
      actions: <NavigationAction>[
        NavigationAction(
          label: 'Call priority contact',
          route: '/emergency/priority-contact-auto-call',
          icon: Icons.call_outlined,
          isPrimary: true,
        ),
        NavigationAction(
          label: 'View nearby safe points',
          route: '/emergency/nearby-safe-points',
          icon: Icons.place_outlined,
        ),
      ],
      note: 'This screen is the first handoff into the emergency response sequence.',
    );
  }
}

class PriorityContactAutoCallScreen extends StatelessWidget {
  const PriorityContactAutoCallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScenarioPlaceholderScreen(
      title: 'Priority Contact Auto Call',
      category: 'Emergency',
      summary: 'Auto-dial stage for the designated priority contact after an alert is sent.',
      routePath: '/emergency/priority-contact-auto-call',
      accentColor: AppColors.cautionAmber,
      heroIcon: Icons.phone_in_talk_outlined,
      bullets: <String>[
        'Represents the automatic call to the primary emergency contact.',
        'Can redirect to safe points or hotline information.',
        'Keeps the emergency sequence moving after alert dispatch.',
      ],
      actions: <NavigationAction>[
        NavigationAction(
          label: 'Show nearby safe points',
          route: '/emergency/nearby-safe-points',
          icon: Icons.place_outlined,
          isPrimary: true,
        ),
        NavigationAction(
          label: 'Open hotline',
          route: '/emergency/hotline',
          icon: Icons.support_agent_outlined,
        ),
      ],
      note: 'This is a placeholder for the auto-call confirmation and tracking state.',
    );
  }
}

class NearbySafePointsScreen extends StatelessWidget {
  const NearbySafePointsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScenarioPlaceholderScreen(
      title: 'Nearby Safe Points',
      category: 'Emergency',
      summary: 'Map/list placeholder for safe public locations and support locations near the traveler.',
      routePath: '/emergency/nearby-safe-points',
      accentColor: AppColors.safeGreen,
      heroIcon: Icons.place,
      bullets: <String>[
        'Represents a short list of safe places nearby.',
        'Can be used after an alert or during a hotline call.',
        'Should highlight the fastest exit from the current area.',
      ],
      actions: <NavigationAction>[
        NavigationAction(
          label: 'Open emergency hotline',
          route: '/emergency/hotline',
          icon: Icons.support_agent_outlined,
          isPrimary: true,
        ),
        NavigationAction(
          label: 'Return to alert sent',
          route: '/emergency/alert-sent',
          icon: Icons.notification_important_outlined,
        ),
      ],
      note: 'This placeholder stands in for the emergency safe-point locator experience.',
    );
  }
}

class EmergencyHotlineScreen extends StatelessWidget {
  const EmergencyHotlineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScenarioPlaceholderScreen(
      title: 'Emergency Hotline',
      category: 'Emergency',
      summary: 'Hotline contact screen for immediate human support and next-step guidance.',
      routePath: '/emergency/hotline',
      accentColor: AppColors.trustNavy,
      heroIcon: Icons.support_agent,
      bullets: <String>[
        'Represents the direct hotline support experience.',
        'Can be paired with safe point suggestions.',
        'Brings the emergency journey back into an actionable state.',
      ],
      actions: <NavigationAction>[
        NavigationAction(
          label: 'Back to active trip',
          route: '/trip-live',
          icon: Icons.directions_walk_outlined,
          isPrimary: true,
        ),
        NavigationAction(
          label: 'View safe points',
          route: '/emergency/nearby-safe-points',
          icon: Icons.place_outlined,
        ),
      ],
      note: 'This screen models the support hotline handoff in the emergency flow.',
    );
  }
}
