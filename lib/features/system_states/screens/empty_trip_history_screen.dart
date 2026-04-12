import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_colors.dart';
import '../../../shared/widgets/page_scaffold.dart';

class EmptyTripHistoryScreen extends StatelessWidget {
  const EmptyTripHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return PageScaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 10),
          child: Column(
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    radius: 14,
                    backgroundColor: Color(0xFFEAF1FD),
                    child: Icon(
                      Icons.person_outline_rounded,
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
                  const Icon(Icons.search_rounded, color: AppColors.textMuted),
                  const SizedBox(width: 10),
                  const Icon(Icons.more_horiz_rounded, color: AppColors.textMuted),
                ],
              ),
              Expanded(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            gradient: const LinearGradient(
                              colors: [Color(0xFFD4DCE6), Color(0xFFEEF3F8)],
                            ),
                          ),
                          child: const Center(
                            child: CircleAvatar(
                              radius: 28,
                              backgroundColor: AppColors.trustNavy,
                              child: Icon(Icons.route_outlined, color: Colors.white),
                            ),
                          ),
                        ),
                        const SizedBox(height: 22),
                        Text(
                          'No Trips Yet',
                          style: theme.textTheme.headlineMedium?.copyWith(
                            color: AppColors.trustNavy,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Your safety journey begins with your first walk. Start a trip to see your analytics here.',
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
                            onPressed: () => context.go('/planning/search'),
                            icon: const Icon(Icons.add_rounded),
                            label: const Text('Start New Trip'),
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextButton(
                          onPressed: () => context.go('/post-trip/trip-summary'),
                          child: const Text('View Sample Reports'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
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
      ('HOME', Icons.home_filled, '/home'),
      ('MAP', Icons.map_outlined, '/safety-map/main'),
      ('TRIPS', Icons.route_outlined, '/trips'),
      ('SETTINGS', Icons.settings_outlined, '/settings/dashboard'),
    ];

    return Container(
      margin: const EdgeInsets.only(top: 8),
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



