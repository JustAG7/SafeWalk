import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_radius.dart';
import '../../../core/constants/app_spacing.dart';
import '../../../shared/widgets/page_scaffold.dart';

class PermissionSuccessScreen extends StatelessWidget {
  const PermissionSuccessScreen({super.key});

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
            colors: [Color(0xFFF7F9FC), Color(0xFFF0F4FB)],
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
                        Row(
                          children: [
                            const Icon(Icons.shield_outlined, size: 18, color: AppColors.trustNavy),
                            const SizedBox(width: 6),
                            Text(
                              'SafeWalk',
                              style: theme.textTheme.titleSmall?.copyWith(
                                fontWeight: FontWeight.w700,
                                color: AppColors.trustNavy,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Text(
                          'STEP 5 OF 5',
                          style: theme.textTheme.labelSmall?.copyWith(
                            color: AppColors.textMuted,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 22),
                    const _SuccessRings(),
                    const SizedBox(height: 24),
                    Text(
                      'Permissions Granted',
                      textAlign: TextAlign.center,
                      style: theme.textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: AppColors.trustNavy,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Your safety companion is now fully equipped to protect you on your journey.',
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: AppColors.textSecondary,
                        height: 1.55,
                      ),
                    ),
                    const SizedBox(height: 22),
                    Container(
                      padding: const EdgeInsets.all(AppSpacing.md),
                      decoration: BoxDecoration(
                        color: const Color(0xFFEFF3FB),
                        borderRadius: BorderRadius.circular(22),
                      ),
                      child: const Column(
                        children: [
                          _SuccessItem(
                            icon: Icons.place_rounded,
                            title: 'LOCATION ACCESS',
                            value: 'Always Authorized',
                          ),
                          SizedBox(height: 14),
                          _SuccessItem(
                            icon: Icons.notifications_active_rounded,
                            title: 'EMERGENCY ALERTS',
                            value: 'Enabled',
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 26),
                    SizedBox(
                      height: 54,
                      child: FilledButton(
                        onPressed: () => context.go('/setup/profile'),
                        child: const Text('Continue to Setup'),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Container(
                      height: 118,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        gradient: const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Color(0xFFE3E8F1), Color(0xFFC7D0DE)],
                        ),
                      ),
                      child: const Center(
                        child: Icon(Icons.blur_on_rounded, size: 44, color: Colors.white70),
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

class _SuccessRings extends StatelessWidget {
  const _SuccessRings();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 176,
        height: 176,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0x332D8CFF),
        ),
        child: Center(
          child: Container(
            width: 126,
            height: 126,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0x2238C793),
            ),
            child: Center(
              child: Container(
                width: 78,
                height: 78,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: Icon(Icons.check_rounded, color: AppColors.safeGreen, size: 38),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _SuccessItem extends StatelessWidget {
  const _SuccessItem({
    required this.icon,
    required this.title,
    required this.value,
  });

  final IconData icon;
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      children: [
        Container(
          width: 34,
          height: 34,
          decoration: BoxDecoration(
            color: const Color(0xFFE4F5EC),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, size: 18, color: AppColors.safeGreen),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: theme.textTheme.labelSmall?.copyWith(
                  color: AppColors.textMuted,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(height: 3),
              Text(
                value,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: AppColors.trustNavy,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
