import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_colors.dart';
import '../../../shared/widgets/page_scaffold.dart';

class RateRouteSafetyScreen extends StatelessWidget {
  const RateRouteSafetyScreen({super.key});

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
                    onPressed: () => context.go('/post-trip/notify-contacts'),
                    icon: const Icon(Icons.close_rounded, color: AppColors.trustNavy),
                  ),
                  Expanded(
                    child: Text(
                      'SafeWalk',
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
                      height: 110,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        gradient: const LinearGradient(colors: [Color(0xFF5D6C7D), Color(0xFF102B45)]),
                      ),
                      child: const Center(child: Icon(Icons.route_outlined, color: Colors.white70, size: 40)),
                    ),
                    const SizedBox(height: 18),
                    Text(
                      'How was your route?',
                      style: theme.textTheme.headlineMedium?.copyWith(
                        color: AppColors.trustNavy,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Your feedback helps Guardian AI improve safety paths for everyone.',
                      style: theme.textTheme.bodyLarge?.copyWith(
                        color: AppColors.textSecondary,
                        height: 1.45,
                      ),
                    ),
                    const SizedBox(height: 18),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(Icons.star_rounded, color: AppColors.trustNavy, size: 34),
                              SizedBox(width: 6),
                              Icon(Icons.star_rounded, color: AppColors.trustNavy, size: 34),
                              SizedBox(width: 6),
                              Icon(Icons.star_rounded, color: AppColors.trustNavy, size: 34),
                              SizedBox(width: 6),
                              Icon(Icons.star_half_rounded, color: Color(0xFFB8C6D8), size: 34),
                              SizedBox(width: 6),
                              Icon(Icons.star_outline_rounded, color: Color(0xFFB8C6D8), size: 34),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text('Tap to rate', style: theme.textTheme.labelMedium?.copyWith(color: AppColors.textMuted, fontWeight: FontWeight.w700)),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text('ROUTE DETAILS', style: theme.textTheme.labelSmall?.copyWith(color: AppColors.textMuted, fontWeight: FontWeight.w700)),
                    const SizedBox(height: 10),
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: const [
                        _Tag(text: 'Well Lit'),
                        _Tag(text: 'Crowded'),
                        _Tag(text: 'Quiet'),
                        _Tag(text: 'Safe Path'),
                        _Tag(text: 'Construction'),
                      ],
                    ),
                    const SizedBox(height: 18),
                    Text('ANYTHING ELSE WE SHOULD KNOW?', style: theme.textTheme.labelSmall?.copyWith(color: AppColors.textMuted, fontWeight: FontWeight.w700)),
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(22),
                      ),
                      child: const Text('Type your experience here...', style: TextStyle(color: AppColors.textMuted)),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: FilledButton(
                  onPressed: () => context.go('/post-trip/trip-summary'),
                  child: const Text('Submit Feedback'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Tag extends StatelessWidget {
  const _Tag({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFEFF3FB),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.labelMedium?.copyWith(
              color: AppColors.textSecondary,
              fontWeight: FontWeight.w700,
            ),
      ),
    );
  }
}
