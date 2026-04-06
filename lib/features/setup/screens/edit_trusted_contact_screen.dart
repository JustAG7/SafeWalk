import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_radius.dart';
import '../../../core/constants/app_spacing.dart';
import '../../../shared/widgets/page_scaffold.dart';

class EditTrustedContactScreen extends StatelessWidget {
  const EditTrustedContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return PageScaffold(
      backgroundColor: const Color(0xFFF7F9FC),
      body: SafeArea(
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
                      IconButton(
                        onPressed: () => context.go('/setup/contacts'),
                        icon: const Icon(Icons.arrow_back_rounded),
                      ),
                      Text(
                        'Edit Contact',
                        style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700, color: AppColors.trustNavy),
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: () => context.go('/setup/contacts'),
                        child: const Text('SAVE'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 18),
                  Center(
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          width: 104,
                          height: 104,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: AppColors.skyBlue, width: 3),
                            image: const DecorationImage(
                              image: NetworkImage('https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=400&q=80'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          right: 4,
                          bottom: 2,
                          child: Container(
                            width: 28,
                            height: 28,
                            decoration: const BoxDecoration(
                              color: AppColors.trustNavy,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(Icons.edit_rounded, size: 16, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Sarah Miller',
                    textAlign: TextAlign.center,
                    style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w700, color: AppColors.trustNavy),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'TRUSTED GUARDIAN',
                    textAlign: TextAlign.center,
                    style: theme.textTheme.labelSmall?.copyWith(color: AppColors.textMuted, letterSpacing: 0.8, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 20),
                  const _PermissionBlock(
                    title: 'NOTIFICATION PERMISSIONS',
                    items: [
                      _ToggleRowData(
                        title: 'Notify on Trip Start',
                        subtitle: 'Automatic alert when you begin a walk',
                        isEnabled: true,
                        activeColor: AppColors.skyBlue,
                      ),
                      _ToggleRowData(
                        title: 'Notify on Arrival',
                        subtitle: 'Send confirmation once you reach destination',
                        isEnabled: true,
                        activeColor: AppColors.skyBlue,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const _PriorityBlock(),
                  const SizedBox(height: 22),
                  SizedBox(
                    height: 54,
                    child: OutlinedButton.icon(
                      onPressed: () => context.go('/setup/contacts'),
                      icon: const Icon(Icons.person_remove_alt_1_outlined, color: AppColors.emergencyRed),
                      label: const Text('Remove Contact', style: TextStyle(color: AppColors.emergencyRed)),
                    ),
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

class _PermissionBlock extends StatelessWidget {
  const _PermissionBlock({required this.title, required this.items});

  final String title;
  final List<_ToggleRowData> items;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.outlineVariant),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: AppColors.textMuted,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.7,
                ),
          ),
          const SizedBox(height: 14),
          for (var i = 0; i < items.length; i++) ...[
            _ToggleRow(data: items[i]),
            if (i != items.length - 1) const SizedBox(height: 18),
          ],
        ],
      ),
    );
  }
}

class _PriorityBlock extends StatelessWidget {
  const _PriorityBlock();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF4F4),
        borderRadius: BorderRadius.circular(24),
      ),
      child: const _ToggleRow(
        data: _ToggleRowData(
          title: 'Emergency Call Priority',
          subtitle: 'Sarah will be first in SOS rotation',
          isEnabled: true,
          activeColor: AppColors.emergencyRed,
        ),
      ),
    );
  }
}

class _ToggleRowData {
  const _ToggleRowData({
    required this.title,
    required this.subtitle,
    required this.isEnabled,
    required this.activeColor,
  });

  final String title;
  final String subtitle;
  final bool isEnabled;
  final Color activeColor;
}

class _ToggleRow extends StatelessWidget {
  const _ToggleRow({required this.data});

  final _ToggleRowData data;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(data.title, style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700)),
              const SizedBox(height: 4),
              Text(data.subtitle, style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColors.textSecondary, height: 1.35)),
            ],
          ),
        ),
        const SizedBox(width: 12),
        Switch(
          value: data.isEnabled,
          onChanged: (_) {},
          activeColor: data.activeColor,
        ),
      ],
    );
  }
}
