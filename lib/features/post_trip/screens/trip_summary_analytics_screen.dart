import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_colors.dart';
import '../../../shared/widgets/page_scaffold.dart';

class TripSummaryAnalyticsScreen extends StatelessWidget {
  const TripSummaryAnalyticsScreen({super.key});

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
                  const CircleAvatar(radius: 14, backgroundColor: Color(0xFFEAD3B8), child: Icon(Icons.person, size: 14, color: AppColors.trustNavy)),
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
                          Text('OVERALL SAFETY SCORE', style: theme.textTheme.labelSmall?.copyWith(color: Colors.white54, fontWeight: FontWeight.w700)),
                          const SizedBox(height: 12),
                          Text('9.8', style: theme.textTheme.displayLarge?.copyWith(color: Colors.white, fontWeight: FontWeight.w800)),
                          Text('/10', style: theme.textTheme.titleLarge?.copyWith(color: Colors.white70)),
                          const SizedBox(height: 10),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                            decoration: BoxDecoration(color: Colors.white.withOpacity(0.1), borderRadius: BorderRadius.circular(999)),
                            child: Text('TRIP VERIFIED SAFE', style: theme.textTheme.labelSmall?.copyWith(color: const Color(0xFF7FE3B0), fontWeight: FontWeight.w700)),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Row(
                      children: [
                        Expanded(child: _SummaryStat(icon: Icons.route_outlined, title: 'DISTANCE', value: '1.2 km')),
                        SizedBox(width: 12),
                        Expanded(child: _SummaryStat(icon: Icons.timelapse_outlined, title: 'DURATION', value: '14 mins')),
                      ],
                    ),
                    const SizedBox(height: 12),
                    const Row(
                      children: [
                        Expanded(child: _SummaryStat(icon: Icons.groups_outlined, title: 'GUARDIANS', value: '3')),
                        SizedBox(width: 12),
                        Expanded(child: _SummaryStat(icon: Icons.wb_sunny_outlined, title: 'BRIGHTNESS', value: '92%')),
                      ],
                    ),
                    const SizedBox(height: 18),
                    Row(
                      children: [
                        Text('Path Analytics', style: theme.textTheme.titleMedium?.copyWith(color: AppColors.trustNavy, fontWeight: FontWeight.w700)),
                        const Spacer(),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                          decoration: BoxDecoration(color: const Color(0xFFE8FAF1), borderRadius: BorderRadius.circular(999)),
                          child: Text('HIGH VISIBILITY', style: theme.textTheme.labelSmall?.copyWith(color: AppColors.safeGreen, fontWeight: FontWeight.w700)),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Container(
                      height: 132,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        gradient: const LinearGradient(colors: [Color(0xFF37414A), Color(0xFF101C27)]),
                      ),
                      child: const Center(child: Icon(Icons.route_outlined, color: Color(0xFF73F2AB), size: 42)),
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
  const _SummaryStat({required this.icon, required this.title, required this.value});

  final IconData icon;
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
      ),
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
    );
  }
}
