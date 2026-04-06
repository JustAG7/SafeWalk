import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_colors.dart';
import '../../../shared/widgets/page_scaffold.dart';

class DestinationSearchScreen extends StatelessWidget {
  const DestinationSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return _PlanningScaffold(
      title: 'Search Destination',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const _SearchBox(text: 'Enter destination, building, or place'),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: const [
              _Chip(label: 'Home'),
              _Chip(label: 'Partner House'),
              _Chip(label: 'Library'),
              _Chip(label: 'Coffee'),
            ],
          ),
          const SizedBox(height: 24),
          SizedBox(
            height: 52,
            child: FilledButton(
              onPressed: () => context.go('/planning/results'),
              child: const Text('See Secure Results'),
            ),
          ),
        ],
      ),
    );
  }
}

class DestinationResultsScreen extends StatelessWidget {
  const DestinationResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return _PlanningScaffold(
      title: 'Destination Results',
      child: Column(
        children: [
          _ResultCard(
            title: 'Sentinel Hub North',
            subtitle: '4521 Oak Street, Financial District',
            score: '9.2',
            onTap: () => context.go('/planning/route-options'),
          ),
          const SizedBox(height: 12),
          _ResultCard(
            title: 'Blue Horizon Point',
            subtitle: '892 Maritime Blvd, Pier 9',
            score: '8.7',
            onTap: () => context.go('/planning/route-options'),
          ),
          const SizedBox(height: 12),
          _ResultCard(
            title: 'Civic Plaza East',
            subtitle: '1200 Government Way',
            score: '9.5',
            onTap: () => context.go('/planning/route-options'),
          ),
        ],
      ),
    );
  }
}

class MapRouteOptionsScreen extends StatelessWidget {
  const MapRouteOptionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return _PlanningScaffold(
      title: 'Map Route Options',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 220,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF1B334C), Color(0xFF0F2236)],
              ),
              borderRadius: BorderRadius.circular(24),
            ),
            child: const Center(
              child: Icon(Icons.map_outlined, color: Colors.white, size: 48),
            ),
          ),
          const SizedBox(height: 20),
          const _SectionCard(
            title: 'The Guardian Route',
            subtitle: 'Enhanced lighting and community presence',
            trailing: '12 min',
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 52,
            child: FilledButton(
              onPressed: () => context.go('/planning/route-comparison'),
              child: const Text('Review Routes'),
            ),
          ),
        ],
      ),
    );
  }
}

class RouteComparisonBottomSheetScreen extends StatelessWidget {
  const RouteComparisonBottomSheetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return _PlanningScaffold(
      title: 'Route Comparison',
      child: Column(
        children: [
          _ComparisonCard(
            title: 'The Guardian',
            subtitle: '+2 mins • High security',
            score: '98% safe',
            onTap: () => context.go('/planning/route-safety-details'),
          ),
          const SizedBox(height: 12),
          _ComparisonCard(
            title: 'Shortest',
            subtitle: '-1 min • Express route',
            score: '82% safe',
            onTap: () => context.go('/planning/route-safety-details'),
          ),
        ],
      ),
    );
  }
}

class RouteSafetyScoreDetailsScreen extends StatelessWidget {
  const RouteSafetyScoreDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return _PlanningScaffold(
      title: 'Route Safety Details',
      child: Column(
        children: [
          const _ScoreHero(score: '94'),
          const SizedBox(height: 16),
          const _SectionCard(
            title: 'Smart Lighting',
            subtitle: 'Low risk and dynamic coverage',
            trailing: '88%',
          ),
          const SizedBox(height: 12),
          const _SectionCard(
            title: 'Verified Foot Traffic',
            subtitle: 'Real-time density analytics',
            trailing: '92%',
          ),
          const SizedBox(height: 12),
          const _SectionCard(
            title: 'Guardian Coverage',
            subtitle: 'Local response proximity',
            trailing: '89%',
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 52,
            child: FilledButton(
              onPressed: () => context.go('/planning/route-recommendation'),
              child: const Text('See Recommendation'),
            ),
          ),
        ],
      ),
    );
  }
}

class RouteRecommendationAiScreen extends StatelessWidget {
  const RouteRecommendationAiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return _PlanningScaffold(
      title: 'Route Recommendation',
      child: Column(
        children: [
          Container(
            width: 180,
            height: 180,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [Color(0xFF76F0C3), Color(0xFF1D7DD8), Color(0xFF0D4273)],
              ),
            ),
            child: const Icon(Icons.auto_awesome, color: Colors.white, size: 42),
          ),
          const SizedBox(height: 20),
          const _SectionCard(
            title: 'Optimized Path',
            subtitle: 'Adds 2 minutes but avoids low-light corridors.',
            trailing: '98%',
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 52,
            child: FilledButton(
              onPressed: () => context.go('/planning/start-confirmation'),
              child: const Text('Start Safe Trip'),
            ),
          ),
        ],
      ),
    );
  }
}

class StartTripConfirmationScreen extends StatelessWidget {
  const StartTripConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return _PlanningScaffold(
      title: 'Trip Confirmation',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const _SectionCard(
            title: 'North End District, Apartment 4B',
            subtitle: 'Estimated arrival 12:45 AM',
            trailing: '18 min',
          ),
          const SizedBox(height: 16),
          Row(
            children: const [
              Expanded(
                child: _SectionCard(
                  title: 'Safety Score',
                  subtitle: 'Guardian route selected',
                  trailing: '9.8/10',
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: _SectionCard(
                  title: 'Visibility',
                  subtitle: 'Well lit streets',
                  trailing: 'High',
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const _SectionCard(
            title: 'Active Guardians',
            subtitle: 'Sarah J., Marcus K., Lina R.',
            trailing: '3',
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 52,
            child: FilledButton(
              onPressed: () => context.go('/trip-live'),
              child: const Text('Initiate Guardian'),
            ),
          ),
        ],
      ),
    );
  }
}

class _PlanningScaffold extends StatelessWidget {
  const _PlanningScaffold({required this.title, required this.child});

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return PageScaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () => context.pop(),
                  icon: const Icon(Icons.arrow_back_rounded),
                ),
                Expanded(
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: AppColors.trustNavy,
                    ),
                  ),
                ),
                const CircleAvatar(
                  radius: 16,
                  backgroundColor: Color(0xFFEAD3B8),
                  child: Icon(Icons.person, size: 16, color: AppColors.trustNavy),
                ),
              ],
            ),
            const SizedBox(height: 20),
            child,
          ],
        ),
      ),
    );
  }
}

class _SearchBox extends StatelessWidget {
  const _SearchBox({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          const Icon(Icons.search_rounded, color: AppColors.textMuted),
          const SizedBox(width: 10),
          Expanded(child: Text(text, style: Theme.of(context).textTheme.bodyMedium)),
        ],
      ),
    );
  }
}

class _Chip extends StatelessWidget {
  const _Chip({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Text(label),
    );
  }
}

class _ResultCard extends StatelessWidget {
  const _ResultCard({
    required this.title,
    required this.subtitle,
    required this.score,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final String score;
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
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox(height: 4),
                    Text(subtitle, style: Theme.of(context).textTheme.bodySmall),
                  ],
                ),
              ),
              Text(
                score,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: AppColors.safeGreen,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SectionCard extends StatelessWidget {
  const _SectionCard({
    required this.title,
    required this.subtitle,
    required this.trailing,
  });

  final String title;
  final String subtitle;
  final String trailing;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 4),
                Text(subtitle, style: Theme.of(context).textTheme.bodySmall),
              ],
            ),
          ),
          Text(
            trailing,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: AppColors.trustNavy,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

class _ComparisonCard extends StatelessWidget {
  const _ComparisonCard({
    required this.title,
    required this.subtitle,
    required this.score,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final String score;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(title, style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 4),
          Text(subtitle, style: Theme.of(context).textTheme.bodySmall),
          const SizedBox(height: 12),
          Text(score, style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 12),
          FilledButton(onPressed: onTap, child: const Text('Select')),
        ],
      ),
    );
  }
}

class _ScoreHero extends StatelessWidget {
  const _ScoreHero({required this.score});

  final String score;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFF10304B),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          Text(
            score,
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Safety Score',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
