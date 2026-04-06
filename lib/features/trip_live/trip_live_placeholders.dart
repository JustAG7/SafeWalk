import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/constants/app_colors.dart';
import '../../shared/widgets/page_scaffold.dart';
import 'scenario_placeholder_screen.dart';

class ActiveTripMainScreen extends StatelessWidget {
  const ActiveTripMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScenarioPlaceholderScreen(
      title: 'Active Trip Main',
      category: 'Trip live',
      summary: 'Entry point for the live trip experience and on-route safety controls.',
      routePath: '/trip-live',
      accentColor: AppColors.trustNavy,
      heroIcon: Icons.directions_walk_outlined,
      bullets: <String>[
        'Shows the current trip state and safety status.',
        'Launches live navigation or contact tracking.',
        'Keeps SOS access visible during the trip.',
      ],
      actions: <NavigationAction>[
        NavigationAction(
          label: 'Open live navigation',
          route: '/trip-live/navigation',
          icon: Icons.navigation_outlined,
          isPrimary: true,
        ),
        NavigationAction(
          label: 'View contact tracking',
          route: '/trip-live/contact-tracking',
          icon: Icons.people_outline,
        ),
      ],
      note: 'The live trip entry point should sit above the rest of the flow.',
    );
  }
}

class LiveNavigationScreen extends StatelessWidget {
  const LiveNavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScenarioPlaceholderScreen(
      title: 'Live Navigation',
      category: 'Trip live',
      summary: 'Navigation view with route guidance, arrival context, and live trip monitoring.',
      routePath: '/trip-live/navigation',
      accentColor: AppColors.skyBlue,
      heroIcon: Icons.navigation,
      bullets: <String>[
        'Represents turn-by-turn route guidance.',
        'Surfaces timing and trip progress context.',
        'Keeps a fast path back to the main trip screen.',
      ],
      actions: <NavigationAction>[
        NavigationAction(
          label: 'Continue to contact tracking',
          route: '/trip-live/contact-tracking',
          icon: Icons.people_outline,
          isPrimary: true,
        ),
        NavigationAction(
          label: 'Back to active trip',
          route: '/trip-live',
          icon: Icons.arrow_back,
        ),
      ],
      note: 'This route is part of the live trip sequence from the active trip shell.',
    );
  }
}

class LiveContactTrackingScreen extends StatelessWidget {
  const LiveContactTrackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScenarioPlaceholderScreen(
      title: 'Live Contact Tracking',
      category: 'Trip live',
      summary: 'Tracks who can see the trip and how contact visibility is managed during travel.',
      routePath: '/trip-live/contact-tracking',
      accentColor: AppColors.safeGreen,
      heroIcon: Icons.contact_emergency_outlined,
      bullets: <String>[
        'Represents shared trip visibility and watcher updates.',
        'Acts as a bridge to check-in prompts and help flows.',
        'Keeps the safety state visible while the trip runs.',
      ],
      actions: <NavigationAction>[
        NavigationAction(
          label: 'Open check-in prompt',
          route: '/trip-live/check-in',
          icon: Icons.fact_check_outlined,
          isPrimary: true,
        ),
        NavigationAction(
          label: 'Review live navigation',
          route: '/trip-live/navigation',
          icon: Icons.navigation_outlined,
        ),
      ],
      note: 'This screen is a placeholder for live contact visibility and monitoring.',
    );
  }
}

class CheckInPromptScreen extends StatelessWidget {
  const CheckInPromptScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScenarioPlaceholderScreen(
      title: 'Check-in Prompt',
      category: 'Trip live',
      summary: 'Prompt that asks the traveler to confirm status before escalation is needed.',
      routePath: '/trip-live/check-in',
      accentColor: AppColors.cautionAmber,
      heroIcon: Icons.quiz_outlined,
      bullets: <String>[
        'Represents the check-in request shown during a trip.',
        'Can branch to the safe confirmation or the help flow.',
        'Matches the staged escalation model used across the flow.',
      ],
      actions: <NavigationAction>[
        NavigationAction(
          label: 'I am fine',
          route: '/trip-live/im-fine',
          icon: Icons.check_circle_outline,
          isPrimary: true,
        ),
        NavigationAction(
          label: 'Need help',
          route: '/trip-live/need-help',
          icon: Icons.help_outline,
        ),
      ],
      note: 'The prompt is intentionally simple so it can be swapped for the Figma UI later.',
    );
  }
}

class ImFineStateScreen extends StatelessWidget {
  const ImFineStateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScenarioPlaceholderScreen(
      title: "I'm Fine",
      category: 'Trip live',
      summary: 'Confirmation state that clears the check-in and returns the traveler to the trip.',
      routePath: '/trip-live/im-fine',
      accentColor: AppColors.safeGreen,
      heroIcon: Icons.verified_outlined,
      bullets: <String>[
        'Represents the safe confirmation branch after check-in.',
        'Returns the user to the active trip experience.',
        'Can still lead into progress updates later in the flow.',
      ],
      actions: <NavigationAction>[
        NavigationAction(
          label: 'Return to active trip',
          route: '/trip-live',
          icon: Icons.directions_walk_outlined,
          isPrimary: true,
        ),
        NavigationAction(
          label: 'Go to progress update',
          route: '/trip-live/progress-update',
          icon: Icons.timeline_outlined,
        ),
      ],
      note: 'This is the safe branch in the trip check-in path.',
    );
  }
}

class NeedHelpFlowScreen extends StatelessWidget {
  const NeedHelpFlowScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScenarioPlaceholderScreen(
      title: 'Need Help Flow',
      category: 'Trip live',
      summary: 'Escalation branch that transitions from trip check-in into SOS and emergency actions.',
      routePath: '/trip-live/need-help',
      accentColor: AppColors.emergencyRed,
      heroIcon: Icons.sos_outlined,
      bullets: <String>[
        'Represents the user saying they need assistance.',
        'Leads toward the floating SOS interaction and countdown states.',
        'Bridges trip live to emergency response screens.',
      ],
      actions: <NavigationAction>[
        NavigationAction(
          label: 'Open trip progress update',
          route: '/trip-live/progress-update',
          icon: Icons.timeline_outlined,
          isPrimary: true,
        ),
        NavigationAction(
          label: 'Trigger floating SOS',
          route: '/trip-live/sos-expanded',
          icon: Icons.emergency_outlined,
        ),
      ],
      note: 'This path is the escalation branch that eventually lands in emergency screens.',
    );
  }
}

class TripProgressUpdateScreen extends StatelessWidget {
  const TripProgressUpdateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScenarioPlaceholderScreen(
      title: 'Trip Progress Update',
      category: 'Trip live',
      summary: 'Status update screen for route progress, ETA shifts, and trip milestones.',
      routePath: '/trip-live/progress-update',
      accentColor: AppColors.skyBlue,
      heroIcon: Icons.timeline,
      bullets: <String>[
        'Shows a live trip progress snapshot.',
        'Can be used as a bridge to the SOS surface.',
        'Provides a handoff point between routine and urgent states.',
      ],
      actions: <NavigationAction>[
        NavigationAction(
          label: 'Open floating SOS',
          route: '/trip-live/sos-expanded',
          icon: Icons.emergency_outlined,
          isPrimary: true,
        ),
        NavigationAction(
          label: 'Back to navigation',
          route: '/trip-live/navigation',
          icon: Icons.navigation_outlined,
        ),
      ],
      note: 'This is a placeholder for status and ETA updates during the live trip.',
    );
  }
}

class FloatingSosExpandedScreen extends StatelessWidget {
  const FloatingSosExpandedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return PageScaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
              child: Row(
                children: [
                  const CircleAvatar(radius: 16, backgroundColor: Color(0xFFEAD3B8), child: Icon(Icons.person, size: 16, color: AppColors.trustNavy)),
                  const SizedBox(width: 8),
                  Text('SafeWalk', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700, color: AppColors.trustNavy)),
                  const Spacer(),
                  const Icon(Icons.notifications_none_rounded, color: AppColors.trustNavy),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.fromLTRB(18, 18, 18, 24),
                children: [
                  Text('CURRENT LOCATION', style: theme.textTheme.labelSmall?.copyWith(color: AppColors.skyBlue, fontWeight: FontWeight.w700)),
                  const SizedBox(height: 6),
                  Text('1248 Market Street, SF', style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w700, color: AppColors.trustNavy)),
                  const SizedBox(height: 4),
                  Text('Emergency Mode Activated', style: theme.textTheme.bodySmall?.copyWith(color: AppColors.emergencyRed, fontWeight: FontWeight.w700)),
                  const SizedBox(height: 20),
                  GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    childAspectRatio: 1.22,
                    children: [
                      const _EmergencyTile(title: 'Police', subtitle: 'CALL 911', icon: Icons.shield_outlined, accent: AppColors.skyBlue),
                      const _EmergencyTile(title: 'Fire', subtitle: 'IMMEDIATE ALERT', icon: Icons.local_fire_department_outlined, accent: AppColors.emergencyRed),
                      const _EmergencyTile(title: 'Medical', subtitle: 'SEND EMS', icon: Icons.medical_services_outlined, accent: AppColors.safeGreen),
                      _EmergencyTile(title: 'Guardians', subtitle: 'ALERT NETWORK', icon: Icons.group_outlined, accent: AppColors.trustNavy, highlighted: true, onTap: () => context.go('/companion/main')),
                    ],
                  ),
                  const SizedBox(height: 18),
                  Material(
                    color: AppColors.emergencyRed,
                    borderRadius: BorderRadius.circular(38),
                    child: InkWell(
                      onTap: () => context.go('/trip-live/sos-hold'),
                      borderRadius: BorderRadius.circular(38),
                      child: Container(
                        height: 104,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(38),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.emergencyRed.withOpacity(0.32),
                              blurRadius: 26,
                              offset: const Offset(0, 14),
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.wifi_tethering_rounded, color: Colors.white, size: 26),
                            const SizedBox(height: 6),
                            Text('HOLD SOS', style: theme.textTheme.headlineSmall?.copyWith(color: Colors.white, fontWeight: FontWeight.w800)),
                            const SizedBox(height: 4),
                            Text('RELEASE TO CANCEL', style: theme.textTheme.labelSmall?.copyWith(color: Colors.white70, fontWeight: FontWeight.w700)),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 18),
                  Center(
                    child: OutlinedButton(
                      onPressed: () => context.go('/trip-live'),
                      child: const Text('CANCEL EMERGENCY'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _EmergencyTile extends StatelessWidget {
  const _EmergencyTile({required this.title, required this.subtitle, required this.icon, required this.accent, this.highlighted = false, this.onTap});

  final String title;
  final String subtitle;
  final IconData icon;
  final Color accent;
  final bool highlighted;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final bg = highlighted ? AppColors.trustNavy : Colors.white;
    final fg = highlighted ? Colors.white : AppColors.trustNavy;

    return Material(
      color: bg,
      borderRadius: BorderRadius.circular(24),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(24),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: highlighted ? Colors.white.withOpacity(0.12) : accent.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(icon, color: highlighted ? Colors.white : accent),
              ),
              const Spacer(),
              Text(title, style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700, color: fg)),
              const SizedBox(height: 4),
              Text(subtitle, style: Theme.of(context).textTheme.labelSmall?.copyWith(color: highlighted ? Colors.white70 : AppColors.textMuted, fontWeight: FontWeight.w700)),
            ],
          ),
        ),
      ),
    );
  }
}
class SosHoldActivationScreen extends StatelessWidget {
  const SosHoldActivationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScenarioPlaceholderScreen(
      title: 'SOS Hold Activation',
      category: 'Trip live',
      summary: 'Hold interaction that confirms a deliberate SOS activation before alerting contacts.',
      routePath: '/trip-live/sos-hold',
      accentColor: AppColors.emergencyRed,
      heroIcon: Icons.back_hand_outlined,
      bullets: <String>[
        'Represents the deliberate hold gesture for SOS.',
        'Precedes the countdown and alert transitions.',
        'Exists to prevent accidental escalation.',
      ],
      actions: <NavigationAction>[
        NavigationAction(
          label: 'Proceed to countdown',
          route: '/trip-live/sos-countdown',
          icon: Icons.hourglass_bottom_outlined,
          isPrimary: true,
        ),
        NavigationAction(
          label: 'Return to SOS expanded',
          route: '/trip-live/sos-expanded',
          icon: Icons.emergency_outlined,
        ),
      ],
      note: 'This screen stands in for the hold-to-confirm SOS interaction.',
    );
  }
}

class SosCountdownScreen extends StatelessWidget {
  const SosCountdownScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScenarioPlaceholderScreen(
      title: 'SOS Countdown',
      category: 'Trip live',
      summary: 'Countdown state shown before the system escalates and sends alerts.',
      routePath: '/trip-live/sos-countdown',
      accentColor: AppColors.emergencyRed,
      heroIcon: Icons.hourglass_empty,
      bullets: <String>[
        'Represents the pre-alert countdown state.',
        'Provides the final chance to cancel or confirm.',
        'Transitions into alert sent and contact call flows.',
      ],
      actions: <NavigationAction>[
        NavigationAction(
          label: 'Send emergency alert',
          route: '/emergency/alert-sent',
          icon: Icons.notification_important_outlined,
          isPrimary: true,
        ),
        NavigationAction(
          label: 'Go back to hold',
          route: '/trip-live/sos-hold',
          icon: Icons.back_hand_outlined,
        ),
      ],
      note: 'The countdown is the last trip-side screen before emergency handoff.',
    );
  }
}


