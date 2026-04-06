import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_radius.dart';
import '../../../core/constants/app_spacing.dart';
import '../../../shared/widgets/page_scaffold.dart';

class SetupCompletedScreen extends StatelessWidget {
  const SetupCompletedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return PageScaffold(
      backgroundColor: const Color(0xFFF7F9FC),
      body: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFF7F9FC), Color(0xFFEFF6F2), Color(0xFFF7F9FC)],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 430),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        Text('SafeWalk', style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w700, color: AppColors.trustNavy)),
                        const Spacer(),
                        const CircleAvatar(radius: 14, backgroundColor: Color(0xFFEAD3B8), child: Icon(Icons.person, size: 14, color: AppColors.trustNavy)),
                        const SizedBox(width: 8),
                        const Icon(Icons.notifications_none_rounded, color: AppColors.trustNavy),
                      ],
                    ),
                    const SizedBox(height: 26),
                    Center(
                      child: Container(
                        width: 140,
                        height: 140,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0x2226B26C),
                        ),
                        child: Center(
                          child: Container(
                            width: 88,
                            height: 88,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFF063B2B),
                            ),
                            child: const Icon(Icons.shield_outlined, color: Colors.white, size: 40),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'You\'re all set,\nSarah!',
                      textAlign: TextAlign.center,
                      style: theme.textTheme.headlineLarge?.copyWith(fontWeight: FontWeight.w700, color: AppColors.trustNavy, height: 1.08),
                    ),
                    const SizedBox(height: 14),
                    Text(
                      'Your safety network is now active and ready to guide you. We\'ve optimized your profile for maximum protection.',
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodyMedium?.copyWith(color: AppColors.textSecondary, height: 1.55),
                    ),
                    const SizedBox(height: 24),
                    const _SetupReadyCard(
                      icon: Icons.person_outline_rounded,
                      section: 'PROFILE',
                      title: 'Verified Identity',
                      subtitle: 'Emergency details and medical ID linked.',
                    ),
                    const SizedBox(height: 12),
                    const _SetupReadyCard(
                      icon: Icons.groups_rounded,
                      section: 'CONTACTS',
                      title: '5 Guardians',
                      subtitle: 'Primary safety circle configured and notified.',
                    ),
                    const SizedBox(height: 12),
                    const _SetupReadyCard(
                      icon: Icons.place_outlined,
                      section: 'LOCATIONS',
                      title: 'Trusted Zones',
                      subtitle: 'Home, Work, and Gym geo-fences active.',
                    ),
                    const SizedBox(height: 24),
                    SizedBox(
                      height: 56,
                      child: FilledButton(
                        onPressed: () => context.go('/home'),
                        child: const Text('Go to Dashboard'),
                      ),
                    ),
                    const SizedBox(height: 14),
                    TextButton(
                      onPressed: () {},
                      child: const Text('VIEW SETUP DETAILS'),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(22),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.shadow.withOpacity(0.06),
                            blurRadius: 20,
                            offset: const Offset(0, 12),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const [
                          _BottomMiniItem(icon: Icons.home_filled, label: 'HOME', active: true),
                          _BottomMiniItem(icon: Icons.map_outlined, label: 'MAP'),
                          _BottomMiniItem(icon: Icons.route_outlined, label: 'TRIPS'),
                          _BottomMiniItem(icon: Icons.settings_outlined, label: 'SETTINGS'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _SetupReadyCard extends StatelessWidget {
  const _SetupReadyCard({
    required this.icon,
    required this.section,
    required this.title,
    required this.subtitle,
  });

  final IconData icon;
  final String section;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: const Color(0xFFEAF4FF),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(icon, color: AppColors.trustNavy),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(section, style: Theme.of(context).textTheme.labelSmall?.copyWith(color: AppColors.textMuted, fontWeight: FontWeight.w700, letterSpacing: 0.5)),
                const SizedBox(height: 6),
                Text(title, style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700, color: AppColors.trustNavy)),
                const SizedBox(height: 4),
                Text(subtitle, style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColors.textSecondary, height: 1.35)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _BottomMiniItem extends StatelessWidget {
  const _BottomMiniItem({required this.icon, required this.label, this.active = false});

  final IconData icon;
  final String label;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 34,
          height: 34,
          decoration: BoxDecoration(
            color: active ? AppColors.trustNavy : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, size: 18, color: active ? Colors.white : AppColors.textMuted),
        ),
        const SizedBox(height: 4),
        Text(label, style: Theme.of(context).textTheme.labelSmall?.copyWith(color: active ? AppColors.trustNavy : AppColors.textMuted, fontWeight: FontWeight.w700)),
      ],
    );
  }
}

