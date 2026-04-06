import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/constants/app_radius.dart';
import '../../core/constants/app_spacing.dart';
import '../../shared/widgets/page_scaffold.dart';
import '../../shared/widgets/pill_badge.dart';
import '../../shared/widgets/primary_button.dart';
import '../../shared/widgets/secondary_button.dart';
import '../../shared/widgets/section_header.dart';

class NavigationAction {
  const NavigationAction({
    required this.label,
    required this.route,
    this.icon,
    this.isPrimary = false,
  });

  final String label;
  final String route;
  final IconData? icon;
  final bool isPrimary;
}

class ScenarioPlaceholderScreen extends StatelessWidget {
  const ScenarioPlaceholderScreen({
    super.key,
    required this.title,
    required this.category,
    required this.summary,
    required this.routePath,
    required this.accentColor,
    required this.heroIcon,
    this.bullets = const <String>[],
    this.actions = const <NavigationAction>[],
    this.note,
  });

  final String title;
  final String category;
  final String summary;
  final String routePath;
  final Color accentColor;
  final IconData heroIcon;
  final List<String> bullets;
  final List<NavigationAction> actions;
  final String? note;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return PageScaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.page),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _HeroCard(
              title: title,
              category: category,
              summary: summary,
              accentColor: accentColor,
              heroIcon: heroIcon,
            ),
            const SizedBox(height: AppSpacing.lg),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.lg),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SectionHeader(
                      title: 'Placeholder content',
                      subtitle: 'This screen is wired for navigation only.',
                      padding: EdgeInsets.zero,
                      titleStyle: textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    ...bullets.map(
                      (bullet) => Padding(
                        padding: const EdgeInsets.only(bottom: AppSpacing.sm),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 8),
                              width: 8,
                              height: 8,
                              decoration: BoxDecoration(
                                color: accentColor,
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(width: AppSpacing.sm),
                            Expanded(child: Text(bullet)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.lg),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SectionHeader(
                      title: 'Navigation',
                      subtitle: 'Routes mirror the intended placeholder flow.',
                      padding: EdgeInsets.zero,
                      titleStyle: textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    PillBadge(
                      label: routePath,
                      icon: Icons.route_outlined,
                      backgroundColor: colorScheme.primaryContainer,
                      foregroundColor: colorScheme.onPrimaryContainer,
                      borderColor: colorScheme.primary.withOpacity(0.08),
                    ),
                    const SizedBox(height: AppSpacing.lg),
                    ...actions.map(
                      (action) => Padding(
                        padding: const EdgeInsets.only(bottom: AppSpacing.sm),
                        child: action.isPrimary
                            ? PrimaryButton(
                                label: action.label,
                                icon: action.icon,
                                expanded: true,
                                onPressed: () => context.go(action.route),
                              )
                            : SecondaryButton(
                                label: action.label,
                                icon: action.icon,
                                expanded: true,
                                onPressed: () => context.go(action.route),
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (note != null) ...[
              const SizedBox(height: AppSpacing.lg),
              Card(
                color: colorScheme.surfaceContainerHighest,
                child: Padding(
                  padding: const EdgeInsets.all(AppSpacing.lg),
                  child: Text(
                    note!,
                    style: textTheme.bodyMedium,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _HeroCard extends StatelessWidget {
  const _HeroCard({
    required this.title,
    required this.category,
    required this.summary,
    required this.accentColor,
    required this.heroIcon,
  });

  final String title;
  final String category;
  final String summary;
  final Color accentColor;
  final IconData heroIcon;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppRadius.xl),
        gradient: LinearGradient(
          colors: [
            accentColor,
            accentColor.withOpacity(0.90),
            colorScheme.surfaceContainerHighest,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: accentColor.withOpacity(0.16),
            blurRadius: 24,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.xl),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PillBadge(
              label: category,
              icon: Icons.layers_outlined,
              backgroundColor: colorScheme.surface.withOpacity(0.14),
              foregroundColor: colorScheme.onSurface,
              borderColor: colorScheme.surface.withOpacity(0.18),
            ),
            const SizedBox(height: AppSpacing.lg),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    color: colorScheme.surface.withOpacity(0.16),
                    borderRadius: BorderRadius.circular(AppRadius.lg),
                  ),
                  child: Icon(
                    heroIcon,
                    color: colorScheme.onSurface,
                    size: 28,
                  ),
                ),
                const SizedBox(width: AppSpacing.md),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: textTheme.headlineSmall?.copyWith(
                          color: colorScheme.onSurface,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: AppSpacing.sm),
                      Text(
                        summary,
                        style: textTheme.bodyMedium?.copyWith(
                          color: colorScheme.onSurface.withOpacity(0.92),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
