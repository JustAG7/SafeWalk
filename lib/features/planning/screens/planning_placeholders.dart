import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_colors.dart';
import '../../../shared/navigation/route_placeholder_screen.dart';
import '../../../shared/widgets/page_scaffold.dart';

class MainHomeDashboardScreen extends StatelessWidget {
  const MainHomeDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return PageScaffold(
      safeArea: false,
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFF3B5969), Color(0xFF233744)],
                ),
              ),
              child: CustomPaint(painter: _MapBackdropPainter()),
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 10, 16, 8),
                  child: Row(
                    children: [
                      const CircleAvatar(radius: 16, backgroundColor: Colors.white, child: Icon(Icons.person, size: 16, color: AppColors.trustNavy)),
                      const SizedBox(width: 8),
                      Text('SafeWalk', style: theme.textTheme.titleMedium?.copyWith(color: Colors.white, fontWeight: FontWeight.w700)),
                      const Spacer(),
                      const Icon(Icons.notifications_none_rounded, color: Colors.white),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(18)),
                    child: Row(
                      children: const [
                        Icon(Icons.search_rounded, color: AppColors.textMuted),
                        SizedBox(width: 10),
                        Expanded(child: Text('Where to?', style: TextStyle(color: AppColors.textMuted))),
                        Icon(Icons.tune_rounded, color: AppColors.textMuted),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  child: Container(
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(color: const Color(0xFFF5F8FC), borderRadius: BorderRadius.circular(26)),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('CURRENT STATUS', style: theme.textTheme.labelSmall?.copyWith(color: AppColors.textMuted, fontWeight: FontWeight.w700)),
                              const SizedBox(height: 8),
                              Text('You are Protected', style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700, color: AppColors.trustNavy)),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  const CircleAvatar(radius: 11, backgroundColor: Color(0xFFEAF4FF), child: Icon(Icons.group_outlined, size: 12, color: AppColors.skyBlue)),
                                  const SizedBox(width: 6),
                                  const CircleAvatar(radius: 11, backgroundColor: Color(0xFFE4F5EC), child: Icon(Icons.shield_outlined, size: 12, color: AppColors.safeGreen)),
                                  const SizedBox(width: 8),
                                  Text('3 active guardians nearby', style: theme.textTheme.bodySmall?.copyWith(color: AppColors.textSecondary)),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 46,
                          height: 46,
                          decoration: const BoxDecoration(color: Color(0xFFE3FAEF), shape: BoxShape.circle),
                          child: const Icon(Icons.verified_rounded, color: AppColors.safeGreen),
                        ),
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  child: Row(
                    children: [
                      Expanded(
                        child: _QuickActionCard(
                          title: 'Go Home',
                          subtitle: 'SAFE ROUTE ACTIVE',
                          icon: Icons.home_outlined,
                          background: const Color(0xFFF3F6FB),
                          onTap: () => context.go('/planning/quick-go-home'),
                        ),
                      ),
                      const SizedBox(width: 14),
                      Expanded(child: _SosActionCard(onTap: () => context.go('/trip-live/sos-expanded'))),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                const _BottomTabStrip(active: _HomeTab.home),
                const SizedBox(height: 12),
              ],
            ),
          ),
          Positioned(right: 18, bottom: 164, child: Column(children: const [_MapFab(icon: Icons.gps_fixed_rounded), SizedBox(height: 10), _MapFab(icon: Icons.layers_outlined)])),
        ],
      ),
    );
  }
}

class TripsHubScreen extends StatelessWidget {
  const TripsHubScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const RoutePlaceholderScreen(title: 'Trips Hub', path: '/trips', description: 'Primary trips tab surface for current trip state, history, and post-trip summary entry points.');
  }
}

class QuickGoHomeActionScreen extends StatelessWidget {
  const QuickGoHomeActionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return PageScaffold(
      safeArea: false,
      body: Stack(
        children: [
          const Positioned.fill(child: DecoratedBox(decoration: BoxDecoration(gradient: RadialGradient(center: Alignment.topCenter, radius: 1.1, colors: [Color(0xFF6FA091), Color(0xFFE2F4EA)])))),
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(14, 8, 14, 0),
                  child: Row(
                    children: [
                      const CircleAvatar(radius: 15, backgroundColor: Color(0xFFEAF4FF), child: Icon(Icons.person, size: 15, color: AppColors.trustNavy)),
                      const SizedBox(width: 8),
                      Text('SafeWalk', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700, color: AppColors.trustNavy)),
                      const Spacer(),
                      IconButton(onPressed: () => context.go('/home'), icon: const Icon(Icons.close_rounded, color: AppColors.textSecondary)),
                    ],
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Column(
                    children: [
                      Row(children: const [Expanded(child: _InfoMetric(title: 'ARRIVAL', value: '12 mins', subtitle: 'ETA 10:42 PM')), SizedBox(width: 12), Expanded(child: _InfoMetric(title: 'RISK LEVEL', value: 'Low', subtitle: '98% Safe Corridor'))]),
                      const SizedBox(height: 14),
                      Container(
                        padding: const EdgeInsets.all(18),
                        decoration: BoxDecoration(color: Colors.white.withOpacity(0.92), borderRadius: BorderRadius.circular(28)),
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                          Text('DESTINATION', style: theme.textTheme.labelSmall?.copyWith(color: AppColors.textMuted, fontWeight: FontWeight.w700)),
                          const SizedBox(height: 8),
                          Row(children: [
                            Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('Home', style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w700, color: AppColors.trustNavy)), const SizedBox(height: 4), Text('422 Willow Creek, San Francisco', style: theme.textTheme.bodySmall?.copyWith(color: AppColors.textSecondary))])),
                            const CircleAvatar(radius: 18, backgroundColor: Color(0xFFEAF4FF), child: Icon(Icons.home_outlined, color: AppColors.trustNavy)),
                          ]),
                          const SizedBox(height: 18),
                          SizedBox(height: 56, width: double.infinity, child: FilledButton.icon(onPressed: () => context.go('/planning/start-confirmation'), icon: const Icon(Icons.shield_outlined), label: const Text('Start Safe Trip'))),
                          const SizedBox(height: 14),
                          Center(child: Text('? NOTIFY CONTACTS', style: theme.textTheme.labelMedium?.copyWith(color: AppColors.textSecondary, fontWeight: FontWeight.w700))),
                        ]),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 34),
              ],
            ),
          ),
          const Positioned(top: 160, right: 18, child: _MapFab(icon: Icons.gps_fixed_rounded)),
          const Positioned(top: 214, right: 18, child: _MapFab(icon: Icons.layers_outlined)),
          const Positioned(left: 170, top: 120, child: _RouteDot()),
          const Positioned(left: 188, top: 160, child: _RouteDot()),
          const Positioned(left: 206, top: 200, child: _RouteDot()),
          const Positioned(left: 220, top: 240, child: _RouteDot()),
          const Positioned(left: 214, top: 280, child: _RouteDot()),
          Positioned(right: 26, bottom: 86, child: Container(width: 46, height: 46, decoration: const BoxDecoration(color: AppColors.emergencyRed, shape: BoxShape.circle), child: const Center(child: Text('SOS', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700))))),
        ],
      ),
    );
  }
}

class RecentDestinationsScreen extends StatelessWidget {
  const RecentDestinationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return PageScaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
              child: Row(
                children: [
                  const CircleAvatar(radius: 16, backgroundColor: Color(0xFFEAD3B8), child: Icon(Icons.person, size: 16, color: AppColors.trustNavy)),
                  const SizedBox(width: 8),
                  Text('SafeWalk', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700, color: AppColors.trustNavy)),
                  const Spacer(),
                  const Icon(Icons.notifications_none_rounded, color: AppColors.trustNavy),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.fromLTRB(18, 18, 18, 16),
                children: [
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [Expanded(child: Text('Recent\nDestinations', style: theme.textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.w700, color: AppColors.trustNavy, height: 1.0))), TextButton(onPressed: () {}, child: const Text('VIEW\nMAP', textAlign: TextAlign.right))]),
                  const SizedBox(height: 16),
                  Container(height: 52, padding: const EdgeInsets.symmetric(horizontal: 14), decoration: BoxDecoration(color: const Color(0xFFF1F5FA), borderRadius: BorderRadius.circular(18)), child: Row(children: const [Icon(Icons.search_rounded, color: AppColors.textMuted), SizedBox(width: 10), Text('Where are you headed?', style: TextStyle(color: AppColors.textMuted))])),
                  const SizedBox(height: 18),
                  Text('FREQUENT JOURNEYS', style: theme.textTheme.labelSmall?.copyWith(color: AppColors.textMuted, fontWeight: FontWeight.w700)),
                  const SizedBox(height: 12),
                  const _PrimaryDestinationCard(),
                  const SizedBox(height: 12),
                  const Row(children: [Expanded(child: _MiniDestinationCard(title: 'Gym', score: '8.4 SCORE', icon: Icons.fitness_center_outlined)), SizedBox(width: 12), Expanded(child: _MiniDestinationCard(title: 'Library', score: '7.2 SCORE', icon: Icons.local_library_outlined))]),
                  const SizedBox(height: 18),
                  Text('RECENT ACTIVITY', style: theme.textTheme.labelSmall?.copyWith(color: AppColors.textMuted, fontWeight: FontWeight.w700)),
                  const SizedBox(height: 12),
                  const _ActivityTile(title: 'Headquarters', subtitle: '340 Madison Ave, NY', score: 'SECURE', date: '2H AGO'),
                  const SizedBox(height: 10),
                  const _ActivityTile(title: 'Blue Bottle Coffee', subtitle: 'Chelsea Market District', score: '7.3 SCORE', date: 'YESTERDAY'),
                  const SizedBox(height: 10),
                  const _ActivityTile(title: 'Whole Foods', subtitle: 'Union Square East', score: '8.1 SCORE', date: 'OCT 24'),
                ],
              ),
            ),
            const Padding(padding: EdgeInsets.fromLTRB(12, 0, 12, 12), child: _BottomTabStrip(active: _HomeTab.map)),
          ],
        ),
      ),
    );
  }
}

class SafetyStatusOverviewScreen extends StatelessWidget {
  const SafetyStatusOverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return PageScaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
              child: Row(
                children: [
                  const CircleAvatar(radius: 16, backgroundColor: Color(0xFFEAD3B8), child: Icon(Icons.person, size: 16, color: AppColors.trustNavy)),
                  const SizedBox(width: 8),
                  Text('SafeWalk', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700, color: AppColors.trustNavy)),
                  const Spacer(),
                  const Icon(Icons.notifications_none_rounded, color: AppColors.trustNavy),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.fromLTRB(18, 18, 18, 16),
                children: [
                  Text('SENTINEL CORE STYLE', style: theme.textTheme.labelSmall?.copyWith(color: AppColors.skyBlue, fontWeight: FontWeight.w700)),
                  const SizedBox(height: 8),
                  Text('Safety Status', style: theme.textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.w700, color: AppColors.trustNavy)),
                  const SizedBox(height: 20),
                  const Center(child: _ProtectionRing()),
                  const SizedBox(height: 22),
                  Container(
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24)),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Text('Security Verification', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700, color: AppColors.trustNavy)),
                      const SizedBox(height: 14),
                      const _StatusLine(icon: Icons.location_on_outlined, title: 'GPS Active', subtitle: 'Real-time tracking engaged'),
                      const SizedBox(height: 12),
                      const _StatusLine(icon: Icons.group_outlined, title: 'Guardians Notified', subtitle: '3 contacts watching your path'),
                      const SizedBox(height: 12),
                      const _StatusLine(icon: Icons.hub_outlined, title: 'Smart City Data Sync', subtitle: 'Local mesh network connected'),
                      const SizedBox(height: 12),
                      const _StatusLine(icon: Icons.battery_charging_full_outlined, title: 'Battery Optimized', subtitle: 'Low-energy tracking active'),
                    ]),
                  ),
                  const SizedBox(height: 18),
                  Container(
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(color: AppColors.trustNavy, borderRadius: BorderRadius.circular(24)),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Text('ACTIVE GUARDIAN', style: theme.textTheme.labelSmall?.copyWith(color: Colors.white70, fontWeight: FontWeight.w700)),
                      const SizedBox(height: 10),
                      Text('Secure Route Confirmed', style: theme.textTheme.titleLarge?.copyWith(color: Colors.white, fontWeight: FontWeight.w700)),
                      const SizedBox(height: 8),
                      Text('The AI Sentinel has analyzed 12 live feeds and 4 crime reports along your current path. The environment is categorized as �Ultra-Safe.�', style: theme.textTheme.bodyMedium?.copyWith(color: Colors.white.withOpacity(0.78), height: 1.5)),
                    ]),
                  ),
                ],
              ),
            ),
            const Padding(padding: EdgeInsets.fromLTRB(12, 0, 12, 12), child: _BottomTabStrip(active: _HomeTab.map)),
          ],
        ),
      ),
    );
  }
}

class SmartCityAlertsFeedScreen extends StatelessWidget {
  const SmartCityAlertsFeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return PageScaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
              child: Row(
                children: [
                  const CircleAvatar(radius: 16, backgroundColor: Color(0xFFEAD3B8), child: Icon(Icons.person, size: 16, color: AppColors.trustNavy)),
                  const SizedBox(width: 8),
                  Text('SafeWalk', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700, color: AppColors.trustNavy)),
                  const Spacer(),
                  const Icon(Icons.notifications_none_rounded, color: AppColors.trustNavy),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.fromLTRB(18, 18, 18, 16),
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(color: const Color(0xFFEFF8F2), borderRadius: BorderRadius.circular(22)),
                    child: Row(children: [const Icon(Icons.verified_outlined, color: AppColors.safeGreen), const SizedBox(width: 10), Expanded(child: Text('Guardian Active\nYour route is being monitored by 4 nodes', style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600, color: AppColors.trustNavy)))]),
                  ),
                  const SizedBox(height: 16),
                  Row(children: const [_FilterChip(label: 'All Alerts', active: true), SizedBox(width: 8), _FilterChip(label: 'Street Lights'), SizedBox(width: 8), _FilterChip(label: 'Patrols')]),
                  const SizedBox(height: 18),
                  const _AlertFeedTile(title: 'Street Light Outage', subtitle: '5th Ave crossing 22nd St. Visibility is reduced. Exercise caution while walking.', tag1: 'CAUTION', tag2: 'INFRASTRUCTURE', time: '2 MIN AGO', accent: Color(0xFFFFDAD7), icon: Icons.lightbulb_outline),
                  const SizedBox(height: 12),
                  const _AlertFeedTile(title: 'Increased Patrol', subtitle: 'Safety presence increased near Central Station area for the next 4 hours.', tag1: 'UPDATE', tag2: 'SECURITY', time: '15 MIN AGO', accent: Color(0xFFEAF4FF), icon: Icons.shield_outlined),
                  const SizedBox(height: 12),
                  const _AlertFeedTile(title: 'Safety Reminder', subtitle: 'Stay on Main Roads during night hours. Well-lit routes are verified as 40% safer.', tag1: 'TIP', tag2: 'COMMUTE', time: '1 HR AGO', accent: Color(0xFFEAF4FF), icon: Icons.route_outlined),
                  const SizedBox(height: 14),
                  Container(
                    height: 118,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(24), gradient: const LinearGradient(colors: [Color(0xFF14273C), Color(0xFF0A1728)])),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Text('LIVE FOOTAGE', style: theme.textTheme.labelSmall?.copyWith(color: Colors.white60, fontWeight: FontWeight.w700)),
                      const Spacer(),
                      Text('Broadway Safe Corridor', style: theme.textTheme.titleLarge?.copyWith(color: Colors.white, fontWeight: FontWeight.w700)),
                      const SizedBox(height: 4),
                      Text('Active lighting � 100% visibility � no current patrol issue', style: theme.textTheme.bodySmall?.copyWith(color: Colors.white70)),
                    ]),
                  ),
                  const SizedBox(height: 12),
                  const _AlertFeedTile(title: 'Large Crowd Expected', subtitle: 'Event ending at Madison Sq. Expected foot traffic increase. Stay vigilant.', tag1: 'PUBLIC EVENT', tag2: 'SOS', time: '2 HR AGO', accent: Color(0xFFEAF4FF), icon: Icons.groups_rounded),
                ],
              ),
            ),
            const Padding(padding: EdgeInsets.fromLTRB(12, 0, 12, 12), child: _BottomTabStrip(active: _HomeTab.map)),
          ],
        ),
      ),
    );
  }
}

class DestinationSearchScreen extends StatelessWidget {
  const DestinationSearchScreen({super.key});
  @override
  Widget build(BuildContext context) => const RoutePlaceholderScreen(title: 'Destination Search', path: '/planning/search', description: 'Search entry point for destination selection before route comparison.');
}

class DestinationResultsScreen extends StatelessWidget {
  const DestinationResultsScreen({super.key});
  @override
  Widget build(BuildContext context) => const RoutePlaceholderScreen(title: 'Destination Results', path: '/planning/results', description: 'Search results list for destination candidates, saved places, and next-step route actions.');
}

class MapRouteOptionsScreen extends StatelessWidget {
  const MapRouteOptionsScreen({super.key});
  @override
  Widget build(BuildContext context) => const RoutePlaceholderScreen(title: 'Map Route Options', path: '/planning/route-options', description: 'Map-based route alternatives view from the latest Figma trip planning flow.');
}

class RouteComparisonBottomSheetScreen extends StatelessWidget {
  const RouteComparisonBottomSheetScreen({super.key});
  @override
  Widget build(BuildContext context) => const RoutePlaceholderScreen(title: 'Route Comparison Bottom Sheet', path: '/planning/route-comparison', description: 'Comparison surface for multiple route candidates, time, safety, and recommendation context.');
}

class RouteSafetyScoreDetailsScreen extends StatelessWidget {
  const RouteSafetyScoreDetailsScreen({super.key});
  @override
  Widget build(BuildContext context) => const RoutePlaceholderScreen(title: 'Route Safety Score Details', path: '/planning/route-safety-details', description: 'Detailed route scoring view with safety breakdown and supporting context.');
}

class RouteRecommendationAiScreen extends StatelessWidget {
  const RouteRecommendationAiScreen({super.key});
  @override
  Widget build(BuildContext context) => const RoutePlaceholderScreen(title: 'Route Recommendation AI', path: '/planning/route-recommendation', description: 'Recommendation view for the best route choice before trip confirmation.');
}

class StartTripConfirmationScreen extends StatelessWidget {
  const StartTripConfirmationScreen({super.key});
  @override
  Widget build(BuildContext context) => const RoutePlaceholderScreen(title: 'Start Trip Confirmation', path: '/planning/start-confirmation', description: 'Final confirmation surface before transitioning into the live trip flow.');
}

class _QuickActionCard extends StatelessWidget {
  const _QuickActionCard({required this.title, required this.subtitle, required this.icon, required this.background, required this.onTap});
  final String title; final String subtitle; final IconData icon; final Color background; final VoidCallback onTap;
  @override
  Widget build(BuildContext context) => Material(color: background, borderRadius: BorderRadius.circular(24), child: InkWell(onTap: onTap, borderRadius: BorderRadius.circular(24), child: Padding(padding: const EdgeInsets.all(18), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [CircleAvatar(radius: 18, backgroundColor: Colors.white, child: Icon(icon, color: AppColors.trustNavy)), const Spacer(), Text(title, style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700, color: AppColors.trustNavy)), const SizedBox(height: 4), Text(subtitle, style: Theme.of(context).textTheme.labelSmall?.copyWith(color: AppColors.textMuted, fontWeight: FontWeight.w700))]))));
}

class _SosActionCard extends StatelessWidget {
  const _SosActionCard({required this.onTap}); final VoidCallback onTap;
  @override
  Widget build(BuildContext context) => Material(color: const Color(0xFFC91010), borderRadius: BorderRadius.circular(24), child: InkWell(onTap: onTap, borderRadius: BorderRadius.circular(24), child: Padding(padding: const EdgeInsets.all(18), child: Column(children: [const Spacer(), const CircleAvatar(radius: 18, backgroundColor: Color(0x33FFFFFF), child: Icon(Icons.emergency_outlined, color: Colors.white)), const Spacer(), Text('SOS', style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w800, color: Colors.white)), const Spacer()]))));
}

class _MapFab extends StatelessWidget {
  const _MapFab({required this.icon}); final IconData icon;
  @override
  Widget build(BuildContext context) => Container(width: 44, height: 44, decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle), child: Icon(icon, color: AppColors.trustNavy, size: 20));
}

enum _HomeTab { home, map, trips, settings }

class _TabItem {
  const _TabItem({required this.tab, required this.icon, required this.label, required this.route});

  final _HomeTab tab;
  final IconData icon;
  final String label;
  final String route;
}

class _BottomTabStrip extends StatelessWidget {
  const _BottomTabStrip({required this.active});

  final _HomeTab active;

  @override
  Widget build(BuildContext context) {
    final items = const [
      _TabItem(tab: _HomeTab.home, icon: Icons.home_filled, label: 'HOME', route: '/home'),
      _TabItem(tab: _HomeTab.map, icon: Icons.map_outlined, label: 'MAP', route: '/planning/recent-destinations'),
      _TabItem(tab: _HomeTab.trips, icon: Icons.route_outlined, label: 'TRIPS', route: '/trips'),
      _TabItem(tab: _HomeTab.settings, icon: Icons.settings_outlined, label: 'SETTINGS', route: '/settings'),
    ];

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          for (final item in items)
            InkWell(
              onTap: () => context.go(item.route),
              borderRadius: BorderRadius.circular(14),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 34,
                      height: 34,
                      decoration: BoxDecoration(
                        color: active == item.tab ? AppColors.trustNavy : Colors.transparent,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(item.icon, size: 18, color: active == item.tab ? Colors.white : AppColors.textMuted),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item.label,
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            color: active == item.tab ? AppColors.trustNavy : AppColors.textMuted,
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _InfoMetric extends StatelessWidget {
  const _InfoMetric({required this.title, required this.value, required this.subtitle}); final String title; final String value; final String subtitle;
  @override
  Widget build(BuildContext context) => Container(padding: const EdgeInsets.all(14), decoration: BoxDecoration(color: Colors.white.withOpacity(0.82), borderRadius: BorderRadius.circular(24)), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(title, style: Theme.of(context).textTheme.labelSmall?.copyWith(color: AppColors.textMuted, fontWeight: FontWeight.w700)), const SizedBox(height: 6), Text(value, style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w700, color: AppColors.trustNavy)), const SizedBox(height: 4), Text(subtitle, style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColors.textSecondary))]));
}

class _PrimaryDestinationCard extends StatelessWidget {
  const _PrimaryDestinationCard();
  @override
  Widget build(BuildContext context) => Container(padding: const EdgeInsets.all(16), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24)), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Align(alignment: Alignment.topRight, child: Container(padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6), decoration: BoxDecoration(color: const Color(0xFFEAF7EF), borderRadius: BorderRadius.circular(999)), child: const Text('ELITE SAFETY 9.8', style: TextStyle(color: AppColors.safeGreen, fontWeight: FontWeight.w700, fontSize: 11)))), const Icon(Icons.home_outlined, color: AppColors.trustNavy), const SizedBox(height: 12), Text('Partner�s House', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700, color: AppColors.trustNavy)), const SizedBox(height: 6), Text('2.4 miles � West Village', style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColors.textSecondary))]));
}

class _MiniDestinationCard extends StatelessWidget {
  const _MiniDestinationCard({required this.title, required this.score, required this.icon}); final String title; final String score; final IconData icon;
  @override
  Widget build(BuildContext context) => Container(padding: const EdgeInsets.all(16), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24)), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Icon(icon, color: AppColors.skyBlue), const SizedBox(height: 24), Text(title, style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700, color: AppColors.trustNavy)), const SizedBox(height: 6), Text(score, style: Theme.of(context).textTheme.labelSmall?.copyWith(color: AppColors.skyBlue, fontWeight: FontWeight.w700))]));
}

class _ActivityTile extends StatelessWidget {
  const _ActivityTile({required this.title, required this.subtitle, required this.score, required this.date}); final String title; final String subtitle; final String score; final String date;
  @override
  Widget build(BuildContext context) => Container(padding: const EdgeInsets.all(14), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(22)), child: Row(children: [Container(width: 38, height: 38, decoration: BoxDecoration(color: const Color(0xFFEAF4FF), borderRadius: BorderRadius.circular(14)), child: const Icon(Icons.work_outline_rounded, color: AppColors.trustNavy)), const SizedBox(width: 12), Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(title, style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700)), const SizedBox(height: 4), Text(subtitle, style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColors.textSecondary))])), Column(crossAxisAlignment: CrossAxisAlignment.end, children: [Container(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5), decoration: BoxDecoration(color: const Color(0xFFEAF7EF), borderRadius: BorderRadius.circular(999)), child: Text(score, style: const TextStyle(color: AppColors.safeGreen, fontWeight: FontWeight.w700, fontSize: 10))), const SizedBox(height: 6), Text(date, style: Theme.of(context).textTheme.labelSmall?.copyWith(color: AppColors.textMuted))]) ]));
}

class _ProtectionRing extends StatelessWidget {
  const _ProtectionRing();
  @override
  Widget build(BuildContext context) => Container(width: 170, height: 170, decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: const Color(0xFF25C77C), width: 6)), child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Text('100%', style: Theme.of(context).textTheme.headlineLarge?.copyWith(fontWeight: FontWeight.w700, color: AppColors.trustNavy)), Text('PROTECTION LEVEL', style: Theme.of(context).textTheme.labelSmall?.copyWith(color: AppColors.textMuted, fontWeight: FontWeight.w700))]));
}

class _StatusLine extends StatelessWidget {
  const _StatusLine({required this.icon, required this.title, required this.subtitle}); final IconData icon; final String title; final String subtitle;
  @override
  Widget build(BuildContext context) => Row(children: [Container(width: 34, height: 34, decoration: BoxDecoration(color: const Color(0xFFEAF4FF), borderRadius: BorderRadius.circular(12)), child: Icon(icon, size: 18, color: AppColors.skyBlue)), const SizedBox(width: 12), Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(title, style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w700)), const SizedBox(height: 3), Text(subtitle, style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColors.textSecondary))])), const Icon(Icons.check_circle_rounded, color: AppColors.safeGreen, size: 18)]);
}

class _FilterChip extends StatelessWidget {
  const _FilterChip({required this.label, this.active = false}); final String label; final bool active;
  @override
  Widget build(BuildContext context) => Container(padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10), decoration: BoxDecoration(color: active ? AppColors.trustNavy : const Color(0xFFEFF3FB), borderRadius: BorderRadius.circular(999)), child: Text(label, style: Theme.of(context).textTheme.labelMedium?.copyWith(color: active ? Colors.white : AppColors.textSecondary, fontWeight: FontWeight.w700)));
}

class _AlertFeedTile extends StatelessWidget {
  const _AlertFeedTile({required this.title, required this.subtitle, required this.tag1, required this.tag2, required this.time, required this.accent, required this.icon}); final String title; final String subtitle; final String tag1; final String tag2; final String time; final Color accent; final IconData icon;
  @override
  Widget build(BuildContext context) => Container(padding: const EdgeInsets.all(14), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(22)), child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [Container(width: 42, height: 42, decoration: BoxDecoration(color: accent, borderRadius: BorderRadius.circular(14)), child: Icon(icon, color: AppColors.trustNavy)), const SizedBox(width: 12), Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Row(children: [Expanded(child: Text(title, style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700))), Text(time, style: Theme.of(context).textTheme.labelSmall?.copyWith(color: AppColors.textMuted))]), const SizedBox(height: 6), Text(subtitle, style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColors.textSecondary, height: 1.35)), const SizedBox(height: 10), Row(children: [_SmallTag(text: tag1), const SizedBox(width: 6), _SmallTag(text: tag2)])]))]));
}

class _SmallTag extends StatelessWidget {
  const _SmallTag({required this.text}); final String text;
  @override
  Widget build(BuildContext context) => Container(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5), decoration: BoxDecoration(color: const Color(0xFFEFF3FB), borderRadius: BorderRadius.circular(999)), child: Text(text, style: Theme.of(context).textTheme.labelSmall?.copyWith(color: AppColors.textSecondary, fontWeight: FontWeight.w700)));
}

class _RouteDot extends StatelessWidget {
  const _RouteDot();
  @override
  Widget build(BuildContext context) => Container(width: 8, height: 8, decoration: const BoxDecoration(color: Color(0xFF2374FF), shape: BoxShape.circle));
}

class _MapBackdropPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.white.withOpacity(0.16)..style = PaintingStyle.stroke..strokeWidth = 1;
    for (double x = -20; x < size.width + 20; x += 26) { canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint); }
    for (double y = 110; y < size.height; y += 26) { canvas.drawLine(Offset(0, y), Offset(size.width, y), paint); }
    final roadPaint = Paint()..color = Colors.white.withOpacity(0.26)..style = PaintingStyle.stroke..strokeWidth = 2.2;
    final path = Path()..moveTo(size.width * 0.7, 90)..cubicTo(size.width * 0.62, size.height * 0.3, size.width * 0.18, size.height * 0.38, size.width * 0.14, size.height * 0.72);
    canvas.drawPath(path, roadPaint);
  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

