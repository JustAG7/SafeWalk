import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_colors.dart';
import '../../../shared/widgets/page_scaffold.dart';

class NoTrustedContactsScreen extends StatelessWidget {
  const NoTrustedContactsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    void showWhyItMatters() {
      showModalBottomSheet<void>(
        context: context,
        showDragHandle: true,
        builder: (sheetContext) => SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Why guardians matter', style: theme.textTheme.titleLarge?.copyWith(color: AppColors.trustNavy, fontWeight: FontWeight.w700)),
                const SizedBox(height: 8),
                Text('Trusted contacts receive your trip status, check-in prompts, and SOS escalation updates. Adding even one contact makes your safety flow much stronger.', style: theme.textTheme.bodyMedium?.copyWith(color: AppColors.textSecondary, height: 1.45)),
              ],
            ),
          ),
        ),
      );
    }

    return PageScaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
          child: Column(
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    radius: 14,
                    backgroundColor: Color(0xFFEAF1FD),
                    child: Icon(
                      Icons.shield_outlined,
                      size: 16,
                      color: AppColors.skyBlue,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'SafeWalk',
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: AppColors.trustNavy,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: showWhyItMatters,
                    icon: const Icon(Icons.help_outline_rounded, color: AppColors.textMuted),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Expanded(
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(28),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const CircleAvatar(
                          radius: 42,
                          backgroundColor: Color(0xFFEAF1FD),
                          child: Icon(
                            Icons.shield_outlined,
                            size: 34,
                            color: AppColors.trustNavy,
                          ),
                        ),
                        const SizedBox(height: 18),
                        Text(
                          'Who\'s Watching\nOver You?',
                          textAlign: TextAlign.center,
                          style: theme.textTheme.headlineMedium?.copyWith(
                            color: AppColors.trustNavy,
                            fontWeight: FontWeight.w700,
                            height: 1.05,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          'You have not added any guardians yet. Trips are safer when someone you trust is notified.',
                          textAlign: TextAlign.center,
                          style: theme.textTheme.bodyLarge?.copyWith(
                            color: AppColors.textSecondary,
                            height: 1.45,
                          ),
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: double.infinity,
                          height: 54,
                          child: FilledButton.icon(
                            onPressed: () => context.go('/setup/contacts'),
                            icon: const Icon(Icons.person_add_alt_1_rounded),
                            label: const Text('Add Trusted Contacts'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const _BottomBar(activeIndex: 1),
            ],
          ),
        ),
      ),
    );
  }
}

class _BottomBar extends StatelessWidget {
  const _BottomBar({required this.activeIndex});

  final int activeIndex;

  @override
  Widget build(BuildContext context) {
    final items = const [
      ('SAFEZONE', Icons.home_filled, '/home'),
      ('CONTACTS', Icons.group_outlined, '/setup/contacts'),
      ('SOS', Icons.sos_outlined, '/trip-live/need-help'),
      ('SETTINGS', Icons.settings_outlined, '/settings/dashboard'),
    ];

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          for (var i = 0; i < items.length; i++)
            InkWell(
              onTap: () => context.go(items[i].$3),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 34,
                    height: 34,
                    decoration: BoxDecoration(
                      color: activeIndex == i
                          ? AppColors.trustNavy
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      items[i].$2,
                      size: 18,
                      color: activeIndex == i
                          ? Colors.white
                          : AppColors.textMuted,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    items[i].$1,
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: activeIndex == i
                          ? AppColors.trustNavy
                          : AppColors.textMuted,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
