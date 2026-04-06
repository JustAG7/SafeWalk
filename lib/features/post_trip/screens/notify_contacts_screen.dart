import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_colors.dart';
import '../../../shared/widgets/page_scaffold.dart';

class NotifyContactsScreen extends StatelessWidget {
  const NotifyContactsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return PageScaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 14, 16, 16),
          child: Column(
            children: [
              Row(
                children: [
                  const Icon(Icons.menu_rounded, color: AppColors.trustNavy),
                  const SizedBox(width: 12),
                  Text(
                    'SAFEWALK',
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: AppColors.trustNavy,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 1,
                    ),
                  ),
                  const Spacer(),
                  const CircleAvatar(radius: 14, backgroundColor: Color(0xFFEAD3B8), child: Icon(Icons.person, size: 14, color: AppColors.trustNavy)),
                ],
              ),
              const SizedBox(height: 24),
              const CircleAvatar(
                radius: 42,
                backgroundColor: Color(0xFFE8FAF1),
                child: CircleAvatar(
                  radius: 28,
                  backgroundColor: AppColors.safeGreen,
                  child: Icon(Icons.shield_rounded, color: Colors.white, size: 26),
                ),
              ),
              const SizedBox(height: 18),
              Text(
                'Guardians Notified',
                style: theme.textTheme.headlineMedium?.copyWith(
                  color: AppColors.trustNavy,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Your circle knows you\'re safe.',
                style: theme.textTheme.bodyLarge?.copyWith(color: AppColors.textSecondary),
              ),
              const SizedBox(height: 24),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'ACTIVE GUARDIANS',
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: AppColors.textMuted,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              const _GuardianStatusCard(name: 'Sarah J.', subtitle: 'Trusted Contact'),
              const SizedBox(height: 12),
              const _GuardianStatusCard(name: 'Marcus K.', subtitle: 'Family Circle'),
              const SizedBox(height: 12),
              const _GuardianStatusCard(name: 'Lina R.', subtitle: 'Emergency Contact'),
              const SizedBox(height: 18),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFF1F5FE),
                  borderRadius: BorderRadius.circular(22),
                ),
                child: Text(
                  '"You successfully checked in at 10:42 PM. Your route summary has been archived."',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: AppColors.textSecondary,
                    height: 1.45,
                  ),
                ),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: FilledButton(
                  onPressed: () => context.go('/post-trip/rate-route-safety'),
                  child: const Text('Continue to Rating'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _GuardianStatusCard extends StatelessWidget {
  const _GuardianStatusCard({required this.name, required this.subtitle});

  final String name;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Row(
        children: [
          const CircleAvatar(radius: 22, backgroundColor: Color(0xFFEAD3B8), child: Icon(Icons.person, color: AppColors.trustNavy)),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: AppColors.trustNavy,
                        fontWeight: FontWeight.w700,
                      ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColors.textSecondary),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xFFE8FAF1),
              borderRadius: BorderRadius.circular(999),
            ),
            child: Text(
              'NOTIFICATION SENT',
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: AppColors.safeGreen,
                    fontWeight: FontWeight.w700,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
