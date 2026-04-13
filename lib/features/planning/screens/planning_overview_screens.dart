import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_colors.dart';
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
                  colors: [Color(0xFF456374), Color(0xFF233744)],
                ),
              ),
              child: CustomPaint(painter: _MapBackdropPainter()),
            ),
          ),
          Positioned(
            left: -8,
            bottom: 72,
            child: IgnorePointer(
              child: Text(
                'SAFE WALK',
                style: theme.textTheme.displaySmall?.copyWith(
                  color: Colors.white.withValues(alpha: 0.18),
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1.2,
                ),
              ),
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
                      IconButton(onPressed: () => context.go('/planning/city-alerts'), icon: const Icon(Icons.notifications_none_rounded, color: Colors.white)),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  child: Material(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    elevation: 6,
                    shadowColor: Colors.black.withValues(alpha: 0.08),
                    child: InkWell(
                      onTap: () => context.go('/planning/search'),
                      borderRadius: BorderRadius.circular(20),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 15),
                        child: Row(
                          children: [
                            Icon(Icons.search_rounded, color: AppColors.textMuted),
                            SizedBox(width: 10),
                            Expanded(child: Text('Where to?', style: TextStyle(color: AppColors.textMuted))),
                            Icon(Icons.tune_rounded, color: AppColors.textMuted),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  child: Material(
                    color: const Color(0xFFF5F8FC),
                    borderRadius: BorderRadius.circular(28),
                    elevation: 10,
                    shadowColor: Colors.black.withValues(alpha: 0.08),
                    child: InkWell(
                      onTap: () => context.go('/planning/safety-status'),
                      borderRadius: BorderRadius.circular(28),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(18, 18, 18, 18),
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
                              width: 52,
                              height: 52,
                              decoration: BoxDecoration(
                                color: const Color(0xFFE3FAEF),
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color(0xFF4EDEA3).withValues(alpha: 0.28),
                                    blurRadius: 24,
                                    spreadRadius: 2,
                                  ),
                                ],
                              ),
                              child: const Icon(Icons.shield_rounded, color: AppColors.safeGreen),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  child: Row(
                    children: [
                      Expanded(child: _QuickActionCard(title: 'Go Home', subtitle: 'SAFE ROUTE ACTIVE', icon: Icons.home_outlined, background: const Color(0xFFF3F6FB), onTap: () => context.go('/planning/quick-go-home'))),
                      const SizedBox(width: 14),
                      Expanded(child: _SosActionCard(onTap: () => context.go('/trip-live/sos-expanded'))),
                    ],
                  ),
                ),
                const SizedBox(height: 18),
                const _BottomTabStrip(active: _HomeTab.home),
                const SizedBox(height: 12),
              ],
            ),
          ),
          Positioned(right: 18, bottom: 164, child: Column(children: [_MapFab(icon: Icons.gps_fixed_rounded, onTap: () => context.go('/safety-map/main')), const SizedBox(height: 10), _MapFab(icon: Icons.layers_outlined, onTap: () => context.go('/planning/recent-destinations'))])),
        ],
      ),
    );
  }
}

class TripsHubScreen extends StatelessWidget {
  const TripsHubScreen({super.key});

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
                  TextButton(onPressed: () => context.go('/post-trip/trip-summary'), child: const Text('LATEST REPORT')),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.fromLTRB(18, 18, 18, 16),
                children: [
                  Text('Trips Hub', style: theme.textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.w700, color: AppColors.trustNavy)),
                  const SizedBox(height: 10),
                  Text('Track your active walk, revisit recent journeys, and jump into post-trip insights.', style: theme.textTheme.bodyMedium?.copyWith(color: AppColors.textSecondary)),
                  const SizedBox(height: 18),
                  Container(
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(color: const Color(0xFFEEF5E8), borderRadius: BorderRadius.circular(26)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('ACTIVE TRIP', style: theme.textTheme.labelSmall?.copyWith(color: AppColors.safeGreen, fontWeight: FontWeight.w700)),
                        const SizedBox(height: 10),
                        Text('Guardian monitoring in progress', style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700, color: AppColors.trustNavy)),
                        const SizedBox(height: 8),
                        Text('3 contacts watching · ETA 10:42 PM · Broadway safe corridor', style: theme.textTheme.bodySmall?.copyWith(color: AppColors.textSecondary)),
                        const SizedBox(height: 16),
                        SizedBox(width: double.infinity, height: 52, child: FilledButton.icon(onPressed: () => context.go('/trip-live'), icon: const Icon(Icons.navigation_rounded), label: const Text('Resume Live Trip'))),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Row(
                    children: [
                      Expanded(child: _OverviewMiniCard(title: 'Tonight', score: '1 active walk', icon: Icons.nightlight_round)),
                      SizedBox(width: 12),
                      Expanded(child: _OverviewMiniCard(title: 'History', score: '12 protected trips', icon: Icons.history_rounded)),
                    ],
                  ),
                  const SizedBox(height: 18),
                  Text('RECENT SUMMARIES', style: theme.textTheme.labelSmall?.copyWith(color: AppColors.textMuted, fontWeight: FontWeight.w700)),
                  const SizedBox(height: 12),
                  const _OverviewActivityTile(title: 'Home to Central Park', subtitle: 'Safe arrival confirmed', score: '9.8 SAFE', date: 'TODAY'),
                  const SizedBox(height: 10),
                  const _OverviewActivityTile(title: 'Campus to Library', subtitle: '2 guardians tracked this route', score: '8.9 SAFE', date: 'YESTERDAY'),
                  const SizedBox(height: 10),
                  SizedBox(width: double.infinity, height: 50, child: OutlinedButton.icon(onPressed: () => context.go('/post-trip/trip-summary'), icon: const Icon(Icons.insights_outlined), label: const Text('Open Trip Analytics'))),
                ],
              ),
            ),
            const Padding(padding: EdgeInsets.fromLTRB(12, 0, 12, 12), child: _BottomTabStrip(active: _HomeTab.trips)),
          ],
        ),
      ),
    );
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
          const Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  center: Alignment.topCenter,
                  radius: 1.2,
                  colors: [Color(0xFF6B978E), Color(0xFFE6F5ED)],
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: CustomPaint(
              painter: _QuickRoutePainter(),
            ),
          ),
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
                      const Row(
                        children: [
                          Expanded(child: _InfoMetric(title: 'ARRIVAL', value: '12 mins', subtitle: 'ETA 10:42 PM')),
                          SizedBox(width: 12),
                          Expanded(child: _InfoMetric(title: 'RISK LEVEL', value: 'Low', subtitle: '98% Safe Corridor')),
                        ],
                      ),
                      const SizedBox(height: 14),
                      Container(
                        padding: const EdgeInsets.all(18),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.94),
                          borderRadius: BorderRadius.circular(28),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.08),
                              blurRadius: 24,
                              offset: const Offset(0, 8),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('DESTINATION', style: theme.textTheme.labelSmall?.copyWith(color: AppColors.textMuted, fontWeight: FontWeight.w700)),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Home', style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w700, color: AppColors.trustNavy)),
                                      const SizedBox(height: 4),
                                      Text('422 Willow Creek, San Francisco', style: theme.textTheme.bodySmall?.copyWith(color: AppColors.textSecondary)),
                                    ],
                                  ),
                                ),
                                const CircleAvatar(radius: 18, backgroundColor: Color(0xFFEAF4FF), child: Icon(Icons.home_outlined, color: AppColors.trustNavy)),
                              ],
                            ),
                            const SizedBox(height: 18),
                            SizedBox(height: 56, width: double.infinity, child: FilledButton.icon(onPressed: () => context.go('/planning/start-confirmation'), icon: const Icon(Icons.shield_outlined), label: const Text('Start Safe Trip'))),
                            const SizedBox(height: 14),
                            Center(child: TextButton.icon(onPressed: () => context.go('/trip-live/contact-tracking'), icon: const Icon(Icons.notifications_active_outlined, size: 18), label: Text('NOTIFY CONTACTS', style: theme.textTheme.labelMedium?.copyWith(color: AppColors.textSecondary, fontWeight: FontWeight.w700)))),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 34),
              ],
            ),
          ),
          Positioned(top: 160, right: 18, child: _MapFab(icon: Icons.gps_fixed_rounded, onTap: () => context.go('/safety-map/main'))),
          Positioned(top: 214, right: 18, child: _MapFab(icon: Icons.layers_outlined, onTap: () => context.go('/planning/route-options'))),
          Positioned(
            left: 214,
            top: 144,
            child: Container(
              width: 10,
              height: 10,
              decoration: const BoxDecoration(color: Color(0xFF0C4C2F), shape: BoxShape.circle),
            ),
          ),
          Positioned(
            right: 26,
            bottom: 86,
            child: Material(
              color: AppColors.emergencyRed,
              shape: const CircleBorder(),
              child: InkWell(
                onTap: () => context.go('/trip-live/sos-expanded'),
                customBorder: const CircleBorder(),
                child: const SizedBox(width: 46, height: 46, child: Center(child: Text('SOS', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700)))),
              ),
            ),
          ),
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
                  IconButton(onPressed: () => context.go('/planning/city-alerts'), icon: const Icon(Icons.notifications_none_rounded, color: AppColors.trustNavy)),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.fromLTRB(18, 18, 18, 16),
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: Text('Recent\nDestinations', style: theme.textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.w700, color: AppColors.trustNavy, height: 1.0))),
                      TextButton(onPressed: () => context.go('/safety-map/main'), child: const Text('VIEW\nMAP', textAlign: TextAlign.right)),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Material(
                    color: const Color(0xFFF1F5FA),
                    borderRadius: BorderRadius.circular(18),
                    child: InkWell(
                      onTap: () => context.go('/planning/search'),
                      borderRadius: BorderRadius.circular(18),
                      child: Container(
                        height: 52,
                        padding: const EdgeInsets.symmetric(horizontal: 14),
                        child: const Row(children: [Icon(Icons.search_rounded, color: AppColors.textMuted), SizedBox(width: 10), Text('Where are you headed?', style: TextStyle(color: AppColors.textMuted))]),
                      ),
                    ),
                  ),
                  const SizedBox(height: 18),
                  Text('FREQUENT JOURNEYS', style: theme.textTheme.labelSmall?.copyWith(color: AppColors.textMuted, fontWeight: FontWeight.w700)),
                  const SizedBox(height: 12),
                  const _PrimaryDestinationCard(),
                  const SizedBox(height: 12),
                  const Row(
                    children: [
                      Expanded(child: _OverviewMiniCard(title: 'Gym', score: '8.4 SCORE', icon: Icons.fitness_center_outlined)),
                      SizedBox(width: 12),
                      Expanded(child: _OverviewMiniCard(title: 'Library', score: '7.2 SCORE', icon: Icons.local_library_outlined)),
                    ],
                  ),
                  const SizedBox(height: 18),
                  Text('RECENT ACTIVITY', style: theme.textTheme.labelSmall?.copyWith(color: AppColors.textMuted, fontWeight: FontWeight.w700)),
                  const SizedBox(height: 12),
                  const _OverviewActivityTile(title: 'Headquarters', subtitle: '340 Madison Ave, NY', score: 'SECURE', date: '2H AGO'),
                  const SizedBox(height: 10),
                  const _OverviewActivityTile(title: 'Blue Bottle Coffee', subtitle: 'Chelsea Market District', score: '7.3 SCORE', date: 'YESTERDAY'),
                  const SizedBox(height: 10),
                  const _OverviewActivityTile(title: 'Whole Foods', subtitle: 'Union Square East', score: '8.1 SCORE', date: 'OCT 24'),
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
                  IconButton(onPressed: () => context.go('/planning/city-alerts'), icon: const Icon(Icons.notifications_none_rounded, color: AppColors.trustNavy)),
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Security Verification', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700, color: AppColors.trustNavy)),
                        const SizedBox(height: 14),
                        const _StatusLine(icon: Icons.location_on_outlined, title: 'GPS Active', subtitle: 'Real-time tracking engaged'),
                        const SizedBox(height: 12),
                        const _StatusLine(icon: Icons.group_outlined, title: 'Guardians Notified', subtitle: '3 contacts watching your path'),
                        const SizedBox(height: 12),
                        const _StatusLine(icon: Icons.hub_outlined, title: 'Smart City Data Sync', subtitle: 'Local mesh network connected'),
                        const SizedBox(height: 12),
                        const _StatusLine(icon: Icons.battery_charging_full_outlined, title: 'Battery Optimized', subtitle: 'Low-energy tracking active'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 18),
                  Container(
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(color: AppColors.trustNavy, borderRadius: BorderRadius.circular(24)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('ACTIVE GUARDIAN', style: theme.textTheme.labelSmall?.copyWith(color: Colors.white70, fontWeight: FontWeight.w700)),
                        const SizedBox(height: 10),
                        Text('Secure Route Confirmed', style: theme.textTheme.titleLarge?.copyWith(color: Colors.white, fontWeight: FontWeight.w700)),
                        const SizedBox(height: 8),
                        Text('The AI Sentinel has analyzed 12 live feeds and 4 crime reports along your current path. The environment is categorized as Ultra-Safe.', style: theme.textTheme.bodyMedium?.copyWith(color: Colors.white.withValues(alpha: 0.82), height: 1.5)),
                      ],
                    ),
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

class SmartCityAlertsFeedScreen extends StatefulWidget {
  const SmartCityAlertsFeedScreen({super.key});

  @override
  State<SmartCityAlertsFeedScreen> createState() => _SmartCityAlertsFeedScreenState();
}

class _SmartCityAlertsFeedScreenState extends State<SmartCityAlertsFeedScreen> {
  String _filter = 'All Alerts';

  List<_AlertItem> get _alerts {
    const all = [
      _AlertItem('Street Light Outage', '5th Ave crossing 22nd St. Visibility is reduced. Exercise caution while walking.', 'CAUTION', 'INFRASTRUCTURE', '2 MIN AGO', Color(0xFFFFDAD7), Icons.lightbulb_outline, 'Street Lights'),
      _AlertItem('Increased Patrol', 'Safety presence increased near Central Station area for the next 4 hours.', 'UPDATE', 'SECURITY', '15 MIN AGO', Color(0xFFEAF4FF), Icons.shield_outlined, 'Patrols'),
      _AlertItem('Safety Reminder', 'Stay on Main Roads during night hours. Well-lit routes are verified as 40% safer.', 'TIP', 'COMMUTE', '1 HR AGO', Color(0xFFEAF4FF), Icons.route_outlined, 'Street Lights'),
      _AlertItem('Large Crowd Expected', 'Event ending at Madison Sq. Expected foot traffic increase. Stay vigilant.', 'PUBLIC EVENT', 'SOS', '2 HR AGO', Color(0xFFEAF4FF), Icons.groups_rounded, 'Patrols'),
    ];
    if (_filter == 'All Alerts') return all;
    return all.where((item) => item.group == _filter).toList();
  }

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
                  Row(children: [
                    _FilterChip(label: 'All Alerts', active: _filter == 'All Alerts', onTap: () => setState(() => _filter = 'All Alerts')),
                    const SizedBox(width: 8),
                    _FilterChip(label: 'Street Lights', active: _filter == 'Street Lights', onTap: () => setState(() => _filter = 'Street Lights')),
                    const SizedBox(width: 8),
                    _FilterChip(label: 'Patrols', active: _filter == 'Patrols', onTap: () => setState(() => _filter = 'Patrols')),
                  ],),
                  const SizedBox(height: 18),
                  for (final item in _alerts) ...[
                    _AlertFeedTile(item: item),
                    const SizedBox(height: 12),
                  ],
                  Container(
                    height: 118,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(24), gradient: const LinearGradient(colors: [Color(0xFF14273C), Color(0xFF0A1728)])),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Text('LIVE FOOTAGE', style: theme.textTheme.labelSmall?.copyWith(color: Colors.white60, fontWeight: FontWeight.w700)),
                      const Spacer(),
                      Text('Broadway Safe Corridor', style: theme.textTheme.titleLarge?.copyWith(color: Colors.white, fontWeight: FontWeight.w700)),
                      const SizedBox(height: 4),
                      Text('Active lighting • 100% visibility • no current patrol issue', style: theme.textTheme.bodySmall?.copyWith(color: Colors.white70)),
                    ],),
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

class _AlertItem {
  const _AlertItem(this.title, this.subtitle, this.tag1, this.tag2, this.time, this.accent, this.icon, this.group);
  final String title;
  final String subtitle;
  final String tag1;
  final String tag2;
  final String time;
  final Color accent;
  final IconData icon;
  final String group;
}

class _QuickActionCard extends StatelessWidget {
  const _QuickActionCard({required this.title, required this.subtitle, required this.icon, required this.background, required this.onTap});
  final String title;
  final String subtitle;
  final IconData icon;
  final Color background;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) => Material(color: background, borderRadius: BorderRadius.circular(24), child: InkWell(onTap: onTap, borderRadius: BorderRadius.circular(24), child: Padding(padding: const EdgeInsets.all(18), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [CircleAvatar(radius: 18, backgroundColor: Colors.white, child: Icon(icon, color: AppColors.trustNavy)), const Spacer(), Text(title, style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700, color: AppColors.trustNavy)), const SizedBox(height: 4), Text(subtitle, style: Theme.of(context).textTheme.labelSmall?.copyWith(color: AppColors.textMuted, fontWeight: FontWeight.w700))]))));
}

class _SosActionCard extends StatelessWidget {
  const _SosActionCard({required this.onTap});
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) => Material(color: const Color(0xFFC91010), borderRadius: BorderRadius.circular(24), child: InkWell(onTap: onTap, borderRadius: BorderRadius.circular(24), child: Padding(padding: const EdgeInsets.all(18), child: Column(children: [const Spacer(), const CircleAvatar(radius: 18, backgroundColor: Color(0x33FFFFFF), child: Icon(Icons.emergency_outlined, color: Colors.white)), const Spacer(), Text('SOS', style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w800, color: Colors.white)), const Spacer()]))));
}

class _MapFab extends StatelessWidget {
  const _MapFab({required this.icon, this.onTap});
  final IconData icon;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) => Material(color: Colors.white, shape: const CircleBorder(), child: InkWell(onTap: onTap, customBorder: const CircleBorder(), child: SizedBox(width: 44, height: 44, child: Icon(icon, color: AppColors.trustNavy, size: 20))));
}

class _FilterChip extends StatelessWidget {
  const _FilterChip({required this.label, this.active = false, this.onTap});
  final String label;
  final bool active;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) => Material(color: active ? AppColors.trustNavy : const Color(0xFFEFF3FB), borderRadius: BorderRadius.circular(999), child: InkWell(onTap: onTap, borderRadius: BorderRadius.circular(999), child: Padding(padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10), child: Text(label, style: Theme.of(context).textTheme.labelMedium?.copyWith(color: active ? Colors.white : AppColors.textSecondary, fontWeight: FontWeight.w700)))));
}

class _AlertFeedTile extends StatelessWidget {
  const _AlertFeedTile({required this.item});
  final _AlertItem item;
  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(22)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(color: item.accent, borderRadius: BorderRadius.circular(14)),
              child: Icon(item.icon, color: AppColors.trustNavy),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(child: Text(item.title, style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700))),
                      Text(item.time, style: Theme.of(context).textTheme.labelSmall?.copyWith(color: AppColors.textMuted)),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(item.subtitle, style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColors.textSecondary, height: 1.35)),
                  const SizedBox(height: 10),
                  Row(children: [_SmallTag(text: item.tag1), const SizedBox(width: 6), _SmallTag(text: item.tag2)]),
                ],
              ),
            ),
          ],
        ),
      );
}

class _SmallTag extends StatelessWidget {
  const _SmallTag({required this.text});
  final String text;
  @override
  Widget build(BuildContext context) => Container(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5), decoration: BoxDecoration(color: const Color(0xFFEFF3FB), borderRadius: BorderRadius.circular(999)), child: Text(text, style: Theme.of(context).textTheme.labelSmall?.copyWith(color: AppColors.textSecondary, fontWeight: FontWeight.w700)));
}

class _InfoMetric extends StatelessWidget {
  const _InfoMetric({required this.title, required this.value, required this.subtitle});
  final String title;
  final String value;
  final String subtitle;

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.82), borderRadius: BorderRadius.circular(24)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: Theme.of(context).textTheme.labelSmall?.copyWith(color: AppColors.textMuted, fontWeight: FontWeight.w700)),
            const SizedBox(height: 6),
            Text(value, style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w700, color: AppColors.trustNavy)),
            const SizedBox(height: 4),
            Text(subtitle, style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColors.textSecondary)),
          ],
        ),
      );
}

class _PrimaryDestinationCard extends StatelessWidget {
  const _PrimaryDestinationCard();

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 118,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFF1C6074), Color(0xFF7AA7BD)],
                ),
              ),
              child: Stack(
                children: [
                  Positioned.fill(child: CustomPaint(painter: _BuildingGlowPainter())),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(color: const Color(0xFFEAF7EF), borderRadius: BorderRadius.circular(999)),
                      child: const Text('ELITE SAFETY', style: TextStyle(color: AppColors.safeGreen, fontWeight: FontWeight.w700, fontSize: 11)),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 14),
            const Icon(Icons.apartment_rounded, color: AppColors.trustNavy),
            const SizedBox(height: 12),
            Text('Partner\'s House', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700, color: AppColors.trustNavy)),
            const SizedBox(height: 6),
            Text('2.4 miles • West Village', style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColors.textSecondary)),
          ],
        ),
      );
}

class _OverviewMiniCard extends StatelessWidget {
  const _OverviewMiniCard({required this.title, required this.score, required this.icon});
  final String title;
  final String score;
  final IconData icon;

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: AppColors.skyBlue),
            const SizedBox(height: 24),
            Text(title, style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700, color: AppColors.trustNavy)),
            const SizedBox(height: 6),
            Text(score, style: Theme.of(context).textTheme.labelSmall?.copyWith(color: AppColors.skyBlue, fontWeight: FontWeight.w700)),
          ],
        ),
      );
}

class _OverviewActivityTile extends StatelessWidget {
  const _OverviewActivityTile({required this.title, required this.subtitle, required this.score, required this.date});
  final String title;
  final String subtitle;
  final String score;
  final String date;

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(22)),
        child: Row(
          children: [
            Container(
              width: 38,
              height: 38,
              decoration: BoxDecoration(color: const Color(0xFFEAF4FF), borderRadius: BorderRadius.circular(14)),
              child: const Icon(Icons.work_outline_rounded, color: AppColors.trustNavy),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700)),
                  const SizedBox(height: 4),
                  Text(subtitle, style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColors.textSecondary)),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(color: const Color(0xFFEAF7EF), borderRadius: BorderRadius.circular(999)),
                  child: Text(score, style: const TextStyle(color: AppColors.safeGreen, fontWeight: FontWeight.w700, fontSize: 10)),
                ),
                const SizedBox(height: 6),
                Text(date, style: Theme.of(context).textTheme.labelSmall?.copyWith(color: AppColors.textMuted)),
              ],
            ),
          ],
        ),
      );
}

class _ProtectionRing extends StatelessWidget {
  const _ProtectionRing();

  @override
  Widget build(BuildContext context) => Container(
        width: 170,
        height: 170,
        decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: const Color(0xFF25C77C), width: 6)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('100%', style: Theme.of(context).textTheme.headlineLarge?.copyWith(fontWeight: FontWeight.w700, color: AppColors.trustNavy)),
            Text('PROTECTION LEVEL', style: Theme.of(context).textTheme.labelSmall?.copyWith(color: AppColors.textMuted, fontWeight: FontWeight.w700)),
          ],
        ),
      );
}

class _StatusLine extends StatelessWidget {
  const _StatusLine({required this.icon, required this.title, required this.subtitle});
  final IconData icon;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) => Row(
        children: [
          Container(
            width: 34,
            height: 34,
            decoration: BoxDecoration(color: const Color(0xFFEAF4FF), borderRadius: BorderRadius.circular(12)),
            child: Icon(icon, size: 18, color: AppColors.skyBlue),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w700)),
                const SizedBox(height: 3),
                Text(subtitle, style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColors.textSecondary)),
              ],
            ),
          ),
          const Icon(Icons.check_circle_rounded, color: AppColors.safeGreen, size: 18),
        ],
      );
}

enum _HomeTab { home, map, trips, settings }

class _BottomTabStrip extends StatelessWidget {
  const _BottomTabStrip({required this.active});
  final _HomeTab active;
  @override
  Widget build(BuildContext context) {
    final items = const [(_HomeTab.home, Icons.home_filled, 'HOME', '/home'), (_HomeTab.map, Icons.map_outlined, 'MAP', '/planning/recent-destinations'), (_HomeTab.trips, Icons.route_outlined, 'TRIPS', '/trips'), (_HomeTab.settings, Icons.settings_outlined, 'SETTINGS', '/settings/dashboard')];
    return Container(padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24)), child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [for (final item in items) InkWell(onTap: () => context.go(item.$4), borderRadius: BorderRadius.circular(14), child: Padding(padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2), child: Column(mainAxisSize: MainAxisSize.min, children: [Container(width: 34, height: 34, decoration: BoxDecoration(color: active == item.$1 ? AppColors.trustNavy : Colors.transparent, borderRadius: BorderRadius.circular(12)), child: Icon(item.$2, size: 18, color: active == item.$1 ? Colors.white : AppColors.textMuted)), const SizedBox(height: 4), Text(item.$3, style: Theme.of(context).textTheme.labelSmall?.copyWith(color: active == item.$1 ? AppColors.trustNavy : AppColors.textMuted, fontWeight: FontWeight.w700))])))]));
  }
}

class _MapBackdropPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final grid = Paint()
      ..color = Colors.white.withValues(alpha: 0.14)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;
    for (double x = -20; x < size.width + 20; x += 24) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), grid);
    }
    for (double y = 110; y < size.height; y += 24) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), grid);
    }

    final roadPaint = Paint()
      ..color = Colors.white.withValues(alpha: 0.22)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.4;
    final path1 = Path()
      ..moveTo(size.width * 0.76, 78)
      ..cubicTo(size.width * 0.64, size.height * 0.26, size.width * 0.20, size.height * 0.36, size.width * 0.15, size.height * 0.70);
    final path2 = Path()
      ..moveTo(size.width * 0.15, size.height * 0.18)
      ..quadraticBezierTo(size.width * 0.44, size.height * 0.22, size.width * 0.84, size.height * 0.12);
    canvas.drawPath(path1, roadPaint);
    canvas.drawPath(path2, roadPaint);
  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _QuickRoutePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final field = Paint()
      ..color = Colors.white.withValues(alpha: 0.08)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;
    for (double x = 0; x < size.width; x += 28) {
      canvas.drawLine(Offset(x, 70), Offset(x, size.height), field);
    }
    for (double y = 70; y < size.height; y += 28) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), field);
    }

    final route = Paint()
      ..color = const Color(0xFF2C6FFF)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round;
    final path = Path()
      ..moveTo(size.width * 0.65, size.height * 0.20)
      ..cubicTo(size.width * 0.70, size.height * 0.32, size.width * 0.52, size.height * 0.36, size.width * 0.56, size.height * 0.50)
      ..quadraticBezierTo(size.width * 0.60, size.height * 0.62, size.width * 0.52, size.height * 0.70);
    canvas.drawPath(path, route);

    final dashed = Paint()
      ..color = const Color(0xFF78A3FF)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round;
    for (double i = 0; i < 6; i++) {
      final start = Offset(size.width * (0.56 + (i * 0.015)), size.height * (0.47 + i * 0.03));
      final end = Offset(start.dx + 2, start.dy + 8);
      canvas.drawLine(start, end, dashed);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _BuildingGlowPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final glow = Paint()
      ..shader = const LinearGradient(
        begin: Alignment.bottomLeft,
        end: Alignment.topRight,
        colors: [Color(0x66D7F0FF), Color(0x00FFFFFF)],
      ).createShader(Offset.zero & size);
    canvas.drawRect(Offset.zero & size, glow);

    final line = Paint()
      ..color = Colors.white.withValues(alpha: 0.22)
      ..strokeWidth = 1;
    for (double x = 26; x < size.width; x += 26) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), line);
    }
    for (double y = 18; y < size.height; y += 18) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), line);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}


