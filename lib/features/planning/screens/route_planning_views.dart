import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../shared/widgets/page_scaffold.dart';

class DestinationSearchScreen extends StatelessWidget {
  const DestinationSearchScreen({super.key});

  @override
  Widget build(BuildContext context) => _PlanningPage(
        title: 'Search Destination',
        buttonLabel: 'See Secure Results',
        onPressed: () => context.go('/planning/results'),
      );
}

class DestinationResultsScreen extends StatelessWidget {
  const DestinationResultsScreen({super.key});

  @override
  Widget build(BuildContext context) => _PlanningPage(
        title: 'Destination Results',
        buttonLabel: 'Choose Route',
        onPressed: () => context.go('/planning/route-options'),
      );
}

class MapRouteOptionsScreen extends StatelessWidget {
  const MapRouteOptionsScreen({super.key});

  @override
  Widget build(BuildContext context) => _PlanningPage(
        title: 'Map Route Options',
        buttonLabel: 'Compare Routes',
        onPressed: () => context.go('/planning/route-comparison'),
      );
}

class RouteComparisonBottomSheetScreen extends StatelessWidget {
  const RouteComparisonBottomSheetScreen({super.key});

  @override
  Widget build(BuildContext context) => _PlanningPage(
        title: 'Route Comparison',
        buttonLabel: 'Safety Details',
        onPressed: () => context.go('/planning/route-safety-details'),
      );
}

class RouteSafetyScoreDetailsScreen extends StatelessWidget {
  const RouteSafetyScoreDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) => _PlanningPage(
        title: 'Route Safety Details',
        buttonLabel: 'See Recommendation',
        onPressed: () => context.go('/planning/route-recommendation'),
      );
}

class RouteRecommendationAiScreen extends StatelessWidget {
  const RouteRecommendationAiScreen({super.key});

  @override
  Widget build(BuildContext context) => _PlanningPage(
        title: 'Route Recommendation',
        buttonLabel: 'Start Safe Trip',
        onPressed: () => context.go('/planning/start-confirmation'),
      );
}

class StartTripConfirmationScreen extends StatelessWidget {
  const StartTripConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) => _PlanningPage(
        title: 'Trip Confirmation',
        buttonLabel: 'Initiate Guardian',
        onPressed: () => context.go('/trip-live'),
      );
}

class _PlanningPage extends StatelessWidget {
  const _PlanningPage({
    required this.title,
    required this.buttonLabel,
    required this.onPressed,
  });

  final String title;
  final String buttonLabel;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFF3F6FB),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: const Center(child: Icon(Icons.map_outlined, size: 48)),
                ),
              ),
              const SizedBox(height: 20),
              FilledButton(
                onPressed: onPressed,
                child: Text(buttonLabel),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
