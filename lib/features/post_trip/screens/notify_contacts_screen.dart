import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_colors.dart';
import '../../../shared/widgets/page_scaffold.dart';
import '../mock/post_trip_mock_data.dart';
import '../models/post_trip_guardian.dart';

class NotifyContactsScreen extends StatefulWidget {
  const NotifyContactsScreen({super.key});

  @override
  State<NotifyContactsScreen> createState() => _NotifyContactsScreenState();
}

class _NotifyContactsScreenState extends State<NotifyContactsScreen> {
  late final Set<String> _deliveredGuardianIds;

  @override
  void initState() {
    super.initState();
    _deliveredGuardianIds = kPostTripGuardians
        .where((guardian) => guardian.isDelivered)
        .map((guardian) => guardian.id)
        .toSet();
  }

  void _confirmDelivery(PostTripGuardian guardian) {
    setState(() => _deliveredGuardianIds.add(guardian.id));
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(content: Text('Delivery confirmed for ${guardian.name}.')),
      );
  }

  void _showDeliverySheet() {
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
                'Delivery recap',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: AppColors.trustNavy,
                      fontWeight: FontWeight.w700,
                    ),
              ),
              const SizedBox(height: 8),
              Text(
                '${_deliveredGuardianIds.length}/${kPostTripGuardians.length} guardians have received your safe-arrival update.',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.textSecondary,
                      height: 1.45,
                    ),
              ),
              const SizedBox(height: 16),
              for (final guardian in kPostTripGuardians)
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: CircleAvatar(
                    backgroundColor: guardian.avatarColor,
                    child: const Icon(Icons.person, color: AppColors.trustNavy),
                  ),
                  title: Text(guardian.name),
                  subtitle: Text(guardian.subtitle),
                  trailing: Icon(
                    _deliveredGuardianIds.contains(guardian.id)
                        ? Icons.check_circle
                        : Icons.schedule_rounded,
                    color: _deliveredGuardianIds.contains(guardian.id)
                        ? AppColors.safeGreen
                        : AppColors.textMuted,
                  ),
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
                  TextButton(
                    onPressed: _showDeliverySheet,
                    child: const Text('Status'),
                  ),
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
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: AppColors.textSecondary,
                ),
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
              Expanded(
                child: ListView.separated(
                  itemCount: kPostTripGuardians.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final guardian = kPostTripGuardians[index];
                    return _GuardianStatusCard(
                      guardian: guardian,
                      delivered: _deliveredGuardianIds.contains(guardian.id),
                      onTap: () => _confirmDelivery(guardian),
                    );
                  },
                ),
              ),
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
              const SizedBox(height: 14),
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
  const _GuardianStatusCard({
    required this.guardian,
    required this.delivered,
    this.onTap,
  });

  final PostTripGuardian guardian;
  final bool delivered;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(22),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(22),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Row(
            children: [
              CircleAvatar(
                radius: 22,
                backgroundColor: guardian.avatarColor,
                child: const Icon(Icons.person, color: AppColors.trustNavy),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      guardian.name,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: AppColors.trustNavy,
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      guardian.subtitle,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: AppColors.textSecondary,
                          ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: delivered ? const Color(0xFFE8FAF1) : const Color(0xFFF5F7FA),
                  borderRadius: BorderRadius.circular(999),
                ),
                child: Text(
                  delivered ? 'NOTIFICATION SENT' : 'TAP TO CONFIRM',
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: delivered ? AppColors.safeGreen : AppColors.textMuted,
                        fontWeight: FontWeight.w700,
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
