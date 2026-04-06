import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_colors.dart';
import '../../../shared/widgets/page_scaffold.dart';

class TrustedContactsListScreen extends StatelessWidget {
  const TrustedContactsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return PageScaffold(
      backgroundColor: const Color(0xFFF7F9FC),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () => context.go('/setup/avatar'),
                    icon: const Icon(Icons.arrow_back_rounded),
                  ),
                  const Spacer(),
                  Text(
                    'SafeWalk',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: AppColors.trustNavy,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                'Trusted Contacts',
                style: theme.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: AppColors.trustNavy,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Add people who should be notified if you need help.',
                style: theme.textTheme.bodyMedium,
              ),
              const SizedBox(height: 24),
              const _ContactTile(name: 'Sarah Jenkins', meta: 'Mobile • (555) 012-3456'),
              const SizedBox(height: 12),
              const _ContactTile(name: 'David Miller', meta: 'Work • (555) 987-6543'),
              const SizedBox(height: 12),
              const _ContactTile(name: 'Mom', meta: 'Home • (555) 234-5678', selected: true),
              const Spacer(),
              SizedBox(
                height: 52,
                child: FilledButton(
                  onPressed: () => context.go('/setup/address/home'),
                  child: const Text('Next'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ContactTile extends StatelessWidget {
  const _ContactTile({
    required this.name,
    required this.meta,
    this.selected = false,
  });

  final String name;
  final String meta;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: selected ? const Color(0xFFEAF4FF) : Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 20,
            backgroundColor: Color(0xFFD8DEE8),
            child: Icon(Icons.person, color: AppColors.trustNavy),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 4),
                Text(meta, style: Theme.of(context).textTheme.bodySmall),
              ],
            ),
          ),
          if (selected)
            const Icon(Icons.check_circle, color: AppColors.safeGreen)
          else
            FilledButton(onPressed: () {}, child: const Text('Add')),
        ],
      ),
    );
  }
}
