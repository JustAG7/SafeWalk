import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_colors.dart';
import '../../../shared/widgets/page_scaffold.dart';

class SubmitReportConfirmationScreen extends StatelessWidget {
  const SubmitReportConfirmationScreen({super.key});

  void _showReportDetails(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Report Details'),
        content: const Text(
          'Suspicious activity reported near Valencia St & 16th St. Status: verified locally and shared with nearby guardians.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  void _showShareSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      builder: (context) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Share report',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: AppColors.trustNavy,
                      fontWeight: FontWeight.w700,
                    ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Choose how this confirmed report should be shared.',
              ),
              const SizedBox(height: 18),
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: const Icon(Icons.group_outlined),
                title: const Text('Share with trusted contacts'),
                onTap: () {
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Shared with trusted contacts.')),
                  );
                },
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: const Icon(Icons.copy_all_outlined),
                title: const Text('Copy summary link'),
                onTap: () {
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Summary link copied.')),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return PageScaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
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
                  TextButton(
                    onPressed: () => _showReportDetails(context),
                    child: const Text('Details'),
                  ),
                ],
              ),
              const SizedBox(height: 28),
              const CircleAvatar(
                radius: 52,
                backgroundColor: Color(0xFFE8FAF1),
                child: CircleAvatar(
                  radius: 34,
                  backgroundColor: AppColors.safeGreen,
                  child: Icon(Icons.shield_rounded, color: Colors.white, size: 30),
                ),
              ),
              const SizedBox(height: 18),
              Text(
                'Thank you for\nYour Contribution',
                textAlign: TextAlign.center,
                style: theme.textTheme.headlineMedium?.copyWith(
                  color: AppColors.trustNavy,
                  fontWeight: FontWeight.w700,
                  height: 1.05,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Your report has been securely submitted. By sharing this information, you\'re helping neighbors stay safe today.',
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: AppColors.textSecondary,
                  height: 1.45,
                ),
              ),
              const SizedBox(height: 22),
              _InfoCard(
                icon: Icons.groups_outlined,
                title: 'Community Reach',
                subtitle: 'Alerted 12 Guardians nearby',
                onTap: () => _showShareSheet(context),
              ),
              const SizedBox(height: 12),
              _InfoCard(
                icon: Icons.shield_outlined,
                title: 'Privacy Locked',
                subtitle: 'Your identity remains hidden',
                onTap: () => _showReportDetails(context),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                height: 52,
                child: FilledButton(
                  onPressed: () => context.go('/safety-map/main'),
                  child: const Text('Back to Map'),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                height: 52,
                child: OutlinedButton(
                  onPressed: () => _showShareSheet(context),
                  child: const Text('Share with Contacts'),
                ),
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () => _showReportDetails(context),
                child: const Text('View Report Details'),
              ),
              const SizedBox(height: 8),
              const _BottomBar(activeIndex: 1),
            ],
          ),
        ),
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  const _InfoCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(22),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(22),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              CircleAvatar(
                radius: 18,
                backgroundColor: const Color(0xFFEAF1FD),
                child: Icon(icon, size: 18, color: AppColors.skyBlue),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: AppColors.trustNavy,
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: AppColors.textSecondary,
                          ),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.open_in_new_rounded, color: AppColors.textMuted),
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
      ('HOME', Icons.home_filled, '/home'),
      ('MAP', Icons.map_outlined, '/safety-map/main'),
      ('TRIPS', Icons.route_outlined, '/trips'),
      ('SETTINGS', Icons.settings_outlined, '/settings/dashboard'),
    ];
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24)),
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
                      color: activeIndex == i ? AppColors.trustNavy : Colors.transparent,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      items[i].$2,
                      size: 18,
                      color: activeIndex == i ? Colors.white : AppColors.textMuted,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    items[i].$1,
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: activeIndex == i ? AppColors.trustNavy : AppColors.textMuted,
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
