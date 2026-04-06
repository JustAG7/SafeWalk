import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_colors.dart';
import '../../../shared/widgets/page_scaffold.dart';

class WorkAddressSetupScreen extends StatelessWidget {
  const WorkAddressSetupScreen({super.key});

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
                      Row(
                        children: [
                          const CircleAvatar(radius: 16, backgroundColor: Color(0xFFEAF4FF), child: Icon(Icons.person, size: 16, color: AppColors.trustNavy)),
                          const SizedBox(width: 8),
                          Text('SafeWalk', style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w700, color: AppColors.trustNavy)),
                        ],
                      ),
                      const Spacer(),
                      const Icon(Icons.notifications_none_rounded, color: AppColors.trustNavy),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Where do you\ngo most often?',
                    style: theme.textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.w700, color: AppColors.trustNavy, height: 1.08),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Adding your frequent stops helps the Guardian anticipate your route and keep you safe.',
                    style: theme.textTheme.bodyMedium?.copyWith(color: AppColors.textSecondary, height: 1.5),
                  ),
                  const SizedBox(height: 22),
                  Text('DESTINATION ADDRESS', style: theme.textTheme.labelSmall?.copyWith(color: AppColors.textMuted, fontWeight: FontWeight.w700)),
                  const SizedBox(height: 8),
                  Container(
                    height: 58,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(color: AppColors.outlineVariant),
                    ),
                    child: Row(
                      children: const [
                        Icon(Icons.place_outlined, size: 18, color: AppColors.textMuted),
                        SizedBox(width: 10),
                        Text('Enter street, building, or place name', style: TextStyle(color: AppColors.textMuted)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFFEFF3FB),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('SELECT A CATEGORY', style: theme.textTheme.labelSmall?.copyWith(color: AppColors.textMuted, fontWeight: FontWeight.w700)),
                        const SizedBox(height: 14),
                        GridView.count(
                          crossAxisCount: 3,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          mainAxisSpacing: 12,
                          crossAxisSpacing: 12,
                          childAspectRatio: 0.95,
                          children: const [
                            _CategoryTile(icon: Icons.work_outline_rounded, label: 'WORK'),
                            _CategoryTile(icon: Icons.school_outlined, label: 'SCHOOL'),
                            _CategoryTile(icon: Icons.fitness_center_outlined, label: 'GYM'),
                            _CategoryTile(icon: Icons.favorite_border_rounded, label: 'PARTNER'),
                            _CategoryTile(icon: Icons.local_cafe_outlined, label: 'CAFE'),
                            _CategoryTile(icon: Icons.local_library_outlined, label: 'LIBRARY'),
                            _CategoryTile(icon: Icons.restaurant_outlined, label: 'DINING'),
                            _CategoryTile(icon: Icons.add_rounded, label: 'OTHER'),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 22),
                  SizedBox(
                    height: 54,
                    child: FilledButton(
                      onPressed: () => context.go('/setup/complete'),
                      child: const Text('Save Destination'),
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextButton(
                    onPressed: () => context.go('/setup/complete'),
                    child: const Text('SKIP FOR NOW'),
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

class _CategoryTile extends StatelessWidget {
  const _CategoryTile({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
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
          const SizedBox(height: 10),
          Text(
            label,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: AppColors.textSecondary,
                  fontWeight: FontWeight.w700,
                ),
          ),
        ],
      ),
    );
  }
}
