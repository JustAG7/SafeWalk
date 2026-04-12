import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_colors.dart';
import '../../../shared/widgets/page_scaffold.dart';
import '../mock/post_trip_mock_data.dart';

class TripSummaryAnalyticsScreen extends StatelessWidget {
  const TripSummaryAnalyticsScreen({super.key});

  void _showShareSheet(BuildContext context) {
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
              Text(
                'Share summary',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: AppColors.trustNavy,
                      fontWeight: FontWeight.w700,
                    ),
              ),
              const SizedBox(height: 8),
              Text(
                'Choose where this post-trip summary should go.',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.textSecondary,
                      height: 1.45,
                    ),
              ),
              const SizedBox(height: 18),
              for (final action in postTripShareActions)
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Icon(action['icon']! as IconData),
                  title: Text(action['label']! as String),
                  onTap: () {
                    Navigator.of(sheetContext).pop();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('${action['label']} is ready.'),
                      ),
                    );
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }

  void _showMetricDetails(BuildContext context, String title, String value) {
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
                title,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: AppColors.trustNavy,
                      fontWeight: FontWeight.w700,
                    ),
              ),
              const SizedBox(height: 8),
              Text(
                'This trip metric is currently $value for this completed walk.',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.textSecondary,
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
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () => context.go('/home'),
                    icon: const Icon(Icons.close_rounded, color: AppColors.trustNavy),
                  ),
                  Expanded(
                    child: Text(
                      'Trip Summary',
                      textAlign: TextAlign.center,
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: AppColors.trustNavy,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () => _showShareSheet(context),
                    child: const Text('Share'),
                  ),
                ],
              ),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.only(top: 12),
                  children: [
                    Container(
                      padding: const EdgeInsets.all(22),
                      decoration: BoxDecoration(
                        color: AppColors.trustNavy,
                        borderRadius: BorderRadius.circular(26),
                      ),
                      child: Column(
                        children: [
                          Text(
                            'OVERALL SAFETY SCORE',
                            style: theme.textTheme.labelSmall?.copyWith(
                              color: Colors.white54,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            kPostTripSummaryStats['routeScore']!,
                            style: theme.textTheme.displayLarge?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          Text(
                            '/10',
                            style: theme.textTheme.titleLarge?.copyWith(
                              color: Colors.white70,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(999),
                            ),
                            child: Text(
                              kPostTripSummaryStats['tripState']!,
                              style: theme.textTheme.labelSmall?.copyWith(
                                color: const Color(0xFF7FE3B0),
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: _SummaryStat(
                            icon: Icons.route_outlined,
                            title: 'DISTANCE',
                            value: kPostTripSummaryStats['distance']!,
                            onTap: () => _showMetricDetails(
                              context,
                              'Distance',
                              kPostTripSummaryStats['distance']!,
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _SummaryStat(
                            icon: Icons.timelapse_outlined,
                            title: 'DURATION',
                            value: kPostTripSummaryStats['duration']!,
                            onTap: () => _showMetricDetails(
                              context,
                              'Duration',
                              kPostTripSummaryStats['duration']!,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: _SummaryStat(
                            icon: Icons.groups_outlined,
                            title: 'GUARDIANS',
                            value: kPostTripSummaryStats['guardians']!,
                            onTap: () => _showMetricDetails(
                              context,
                              'Guardians',
                              kPostTripSummaryStats['guardians']!,
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _SummaryStat(
                            icon: Icons.wb_sunny_outlined,
                            title: 'BRIGHTNESS',
                            value: kPostTripSummaryStats['brightness']!,
                            onTap: () => _showMetricDetails(
                              context,
                              'Brightness',
                              kPostTripSummaryStats['brightness']!,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 18),
                    Row(
                      children: [
                        Text(
                          'Path Analytics',
                          style: theme.textTheme.titleMedium?.copyWith(
                            color: AppColors.trustNavy,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () => _showShareSheet(context),
                          borderRadius: BorderRadius.circular(999),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFFE8FAF1),
                              borderRadius: BorderRadius.circular(999),
                            ),
                            child: Text(
                              'HIGH VISIBILITY',
                              style: theme.textTheme.labelSmall?.copyWith(
                                color: AppColors.safeGreen,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    InkWell(
                      onTap: () => _showMetricDetails(
                        context,
                        'Path analytics',
                        'High visibility corridor with steady guardian coverage.',
                      ),
                      borderRadius: BorderRadius.circular(24),
                      child: Container(
                        height: 132,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          gradient: const LinearGradient(
                            colors: [Color(0xFF37414A), Color(0xFF101C27)],
                          ),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.route_outlined,
                            color: Color(0xFF73F2AB),
                            size: 42,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: FilledButton(
                  onPressed: () => context.go('/home'),
                  child: const Text('Done'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SummaryStat extends StatelessWidget {
  const _SummaryStat({
    required this.icon,
    required this.title,
    required this.value,
    this.onTap,
  });

  final IconData icon;
  final String title;
  final String value;
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
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon, color: AppColors.skyBlue),
              const SizedBox(height: 12),
              Text(
                title,
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: AppColors.textMuted,
                      fontWeight: FontWeight.w700,
                    ),
              ),
              const SizedBox(height: 6),
              Text(
                value,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: AppColors.trustNavy,
                      fontWeight: FontWeight.w700,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
