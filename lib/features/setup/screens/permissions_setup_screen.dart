import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_colors.dart';
import '../../../shared/widgets/page_scaffold.dart';

class PermissionsSetupScreen extends StatelessWidget {
  const PermissionsSetupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return _PermissionStepScreen(
      step: 1,
      title: 'Enable Location',
      description: 'Allow location so SafeWalk can find safer routes for you.',
      primaryLabel: 'Allow Location',
      primaryAction: () => context.go('/setup/notifications'),
      secondaryLabel: 'Not now',
      secondaryAction: () => context.go('/setup/notifications'),
      icon: Icons.place_rounded,
    );
  }
}

class NotificationPermissionScreen extends StatelessWidget {
  const NotificationPermissionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return _PermissionStepScreen(
      step: 2,
      title: 'Stay Informed',
      description: 'Enable alerts for nearby incidents and check-in reminders.',
      primaryLabel: 'Enable Notifications',
      primaryAction: () => context.go('/setup/call-permission'),
      secondaryLabel: 'Maybe later',
      secondaryAction: () => context.go('/setup/call-permission'),
      icon: Icons.notifications_rounded,
    );
  }
}

class CallPermissionScreen extends StatelessWidget {
  const CallPermissionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return _PermissionStepScreen(
      step: 3,
      title: 'Emergency Call Access',
      description: 'Allow one-tap calling for emergency services and trusted contacts.',
      primaryLabel: 'Allow Call Access',
      primaryAction: () => context.go('/setup/background-tracking'),
      secondaryLabel: 'Skip for now',
      secondaryAction: () => context.go('/setup/background-tracking'),
      icon: Icons.call_rounded,
    );
  }
}

class BackgroundTrackingPermissionScreen extends StatelessWidget {
  const BackgroundTrackingPermissionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return _PermissionStepScreen(
      step: 4,
      title: 'Continuous Protection',
      description: 'Enable background tracking so guardians can follow your trip progress.',
      primaryLabel: 'Always Allow',
      primaryAction: () => context.go('/setup/permission-success'),
      secondaryLabel: 'Only while using',
      secondaryAction: () => context.go('/setup/permission-success'),
      icon: Icons.shield_outlined,
    );
  }
}

class _PermissionStepScreen extends StatelessWidget {
  const _PermissionStepScreen({
    required this.step,
    required this.title,
    required this.description,
    required this.primaryLabel,
    required this.primaryAction,
    required this.secondaryLabel,
    required this.secondaryAction,
    required this.icon,
  });

  final int step;
  final String title;
  final String description;
  final String primaryLabel;
  final VoidCallback primaryAction;
  final String secondaryLabel;
  final VoidCallback secondaryAction;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return PageScaffold(
      backgroundColor: const Color(0xFFF7F9FC),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 430),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'STEP $step OF 5',
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: AppColors.textMuted,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Container(
                    width: 88,
                    height: 88,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Icon(icon, color: AppColors.trustNavy, size: 38),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    title,
                    style: theme.textTheme.headlineMedium?.copyWith(
                      color: AppColors.trustNavy,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(description, style: theme.textTheme.bodyMedium),
                  const Spacer(),
                  SizedBox(
                    height: 52,
                    child: FilledButton(
                      onPressed: primaryAction,
                      child: Text(primaryLabel),
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextButton(
                    onPressed: secondaryAction,
                    child: Text(secondaryLabel),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
