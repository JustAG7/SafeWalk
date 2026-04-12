import 'package:flutter/material.dart';

import '../../../app/router/app_routes.dart';
import '../models/permission_step.dart';

const permissionSteps = <PermissionStepData>[
  PermissionStepData(
    step: 1,
    totalSteps: 5,
    route: AppRoutePaths.setupPermissions,
    nextRoute: AppRoutePaths.setupNotifications,
    title: 'Enable Location',
    description: 'To find the safest, most well-lit routes for your journey at any hour.',
    primaryLabel: 'Allow Location',
    secondaryLabel: 'Not now',
    icon: Icons.place_rounded,
    visualTone: PermissionVisualTone.location,
    eyebrow: 'Step 1 of 5',
    highlights: [
      PermissionBenefit(
        icon: Icons.route_rounded,
        title: 'Safer routing',
        subtitle: 'We can guide you through brighter, lower-risk streets.',
      ),
      PermissionBenefit(
        icon: Icons.my_location_rounded,
        title: 'Live positioning',
        subtitle: 'Your trip progress stays accurate during active walks.',
      ),
    ],
    learnMoreTitle: 'Why location matters',
    learnMoreBody:
        'SafeWalk uses location only to power route guidance, live trip monitoring, and SOS assistance during a walk. Your choice here only affects this device.',
    successMessage: 'Location access enabled.',
    secondaryDecisionCopy: 'You can continue without location, but route intelligence will stay limited until you enable it later.',
    privacyFootnote: 'Your privacy is encrypted',
  ),
  PermissionStepData(
    step: 2,
    totalSteps: 5,
    route: AppRoutePaths.setupNotifications,
    nextRoute: AppRoutePaths.setupCallPermission,
    title: 'Stay Informed',
    description: 'Receive instant alerts about safety incidents nearby and check-in reminders during your trips.',
    primaryLabel: 'Enable Notifications',
    secondaryLabel: 'Maybe later',
    icon: Icons.notifications_active_rounded,
    visualTone: PermissionVisualTone.notifications,
    eyebrow: 'Onboarding',
    highlights: [
      PermissionBenefit(
        icon: Icons.warning_amber_rounded,
        title: 'Area alerts',
        subtitle: 'See nearby reports while you are walking.',
      ),
      PermissionBenefit(
        icon: Icons.schedule_send_rounded,
        title: 'Check-in reminders',
        subtitle: 'The app can nudge you when a trip needs confirmation.',
      ),
    ],
    learnMoreTitle: 'Why notifications matter',
    learnMoreBody:
        'Notifications are how SafeWalk sends guardian check-ins, route updates, and emergency reminders. You can skip them, but active safety nudges will be muted.',
    successMessage: 'Notifications enabled.',
    secondaryDecisionCopy: 'You can delay notifications for now. Important updates will stay inside the app until you turn them on.',
    privacyFootnote: 'Guardian system active',
  ),
  PermissionStepData(
    step: 3,
    totalSteps: 5,
    route: AppRoutePaths.setupCallPermission,
    nextRoute: AppRoutePaths.setupBackgroundTracking,
    title: 'Emergency Call Access',
    description: 'Allow SafeWalk to initiate calls so you can reach emergency services or your trusted contacts with a single tap.',
    primaryLabel: 'Allow Call Access',
    secondaryLabel: 'Skip for now',
    icon: Icons.call_rounded,
    visualTone: PermissionVisualTone.call,
    eyebrow: 'Step 3 of 5',
    highlights: [
      PermissionBenefit(
        icon: Icons.sos_rounded,
        title: 'One-tap SOS',
        subtitle: 'Emergency call shortcuts stay close when stress is high.',
      ),
      PermissionBenefit(
        icon: Icons.people_alt_rounded,
        title: 'Trusted contacts',
        subtitle: 'Call your circle quickly during urgent moments.',
      ),
    ],
    learnMoreTitle: 'How call access is used',
    learnMoreBody:
        'Call access lets SafeWalk reach emergency services or trusted contacts with fewer steps when you need help.',
    successMessage: 'Call access enabled.',
    secondaryDecisionCopy: 'Skipping this keeps the app usable, but emergency call actions will stay limited until enabled.',
  ),
  PermissionStepData(
    step: 4,
    totalSteps: 5,
    route: AppRoutePaths.setupBackgroundTracking,
    nextRoute: AppRoutePaths.permissionSuccess,
    title: 'Continuous Protection',
    description: 'Enable background tracking so your trusted contacts can see your progress even when your phone is in your pocket.',
    primaryLabel: 'Always Allow',
    secondaryLabel: 'Only while using',
    icon: Icons.shield_outlined,
    visualTone: PermissionVisualTone.background,
    eyebrow: 'Step 4 of 5',
    highlights: [
      PermissionBenefit(
        icon: Icons.shield_moon_rounded,
        title: 'Guardian coverage',
        subtitle: 'Monitoring stays active for the full trip duration.',
      ),
      PermissionBenefit(
        icon: Icons.lock_outline_rounded,
        title: 'Private by design',
        subtitle: 'Trip data is shown only to selected trusted contacts.',
      ),
    ],
    learnMoreTitle: 'Background protection',
    learnMoreBody:
        'Background tracking helps maintain live guardian updates and automatic check-ins while your phone is in your pocket.',
    successMessage: 'Background protection configured.',
    secondaryDecisionCopy: 'Choosing while-in-use still moves you forward. Continuous monitoring will just be shown as limited in the next screen.',
    privacyFootnote: 'Required for automatic emergency detection',
  ),
];

PermissionStepData permissionStepForRoute(String route) {
  return permissionSteps.firstWhere((step) => step.route == route);
}

const grantedPermissionSummary = <PermissionBenefit>[
  PermissionBenefit(
    icon: Icons.place_rounded,
    title: 'Location access',
    subtitle: 'Always authorized',
  ),
  PermissionBenefit(
    icon: Icons.notifications_active_rounded,
    title: 'Emergency alerts',
    subtitle: 'Enabled',
  ),
  PermissionBenefit(
    icon: Icons.verified_user_outlined,
    title: 'Guardian mode',
    subtitle: 'Protection profile ready',
  ),
];
