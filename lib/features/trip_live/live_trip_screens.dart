import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/constants/app_colors.dart';
import '../../shared/widgets/page_scaffold.dart';

class ActiveTripMainScreen extends StatelessWidget {
  const ActiveTripMainScreen({super.key});

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
                  colors: [Color(0xFFB5C96D), Color(0xFF6F8E3A)],
                ),
              ),
              child: CustomPaint(painter: _GuardianMapPainter(greenMode: true)),
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(14, 10, 14, 0),
                  child: Row(
                    children: [
                      Text('Guardian Active', style: theme.textTheme.titleSmall?.copyWith(color: AppColors.trustNavy, fontWeight: FontWeight.w700)),
                      const Spacer(),
                      const CircleAvatar(radius: 14, backgroundColor: Color(0xFFEAD3B8), child: Icon(Icons.person, size: 14, color: AppColors.trustNavy)),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(18, 18, 18, 0),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(color: Colors.white.withOpacity(0.92), borderRadius: BorderRadius.circular(26)),
                    child: Row(
                      children: [
                        const CircleAvatar(radius: 6, backgroundColor: Color(0xFF4BE090)),
                        const SizedBox(width: 10),
                        Expanded(child: Text('Safe Path\nSelected', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700, color: AppColors.trustNavy))),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                          decoration: BoxDecoration(color: const Color(0xFFEAF1FD), borderRadius: BorderRadius.circular(999)),
                          child: Text('Encrypted', style: theme.textTheme.labelSmall?.copyWith(color: AppColors.skyBlue, fontWeight: FontWeight.w700)),
                        ),
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Container(
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(color: const Color(0xFFF1F6E7), borderRadius: BorderRadius.circular(30)),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('ESTIMATED ARRIVAL', style: theme.textTheme.labelSmall?.copyWith(color: AppColors.textMuted, fontWeight: FontWeight.w700)), const SizedBox(height: 8), Text('10:42\nPM', style: theme.textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.w700, color: AppColors.trustNavy, height: 0.95))])),
                            Text('-12\nmins', textAlign: TextAlign.right, style: theme.textTheme.titleLarge?.copyWith(color: AppColors.skyBlue, fontWeight: FontWeight.w700, height: 1.0)),
                            const SizedBox(width: 12),
                            const _MiniAvatarStack(),
                          ],
                        ),
                        const SizedBox(height: 18),
                        Row(
                          children: [
                            Expanded(child: OutlinedButton.icon(onPressed: () => context.go('/trip-live/contact-tracking'), icon: const Icon(Icons.send_outlined), label: const Text('Notify Contacts'))),
                            const SizedBox(width: 12),
                            Expanded(child: FilledButton.icon(onPressed: () => context.go('/trip-live/need-help'), icon: const Icon(Icons.sos_outlined), label: const Text('SOS Alert'))),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text('Currently near Market Street, San Francisco', style: theme.textTheme.labelSmall?.copyWith(color: AppColors.textMuted)),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                const Padding(
                  padding: EdgeInsets.fromLTRB(12, 0, 12, 12),
                  child: _TripBottomBar(active: _TripTab.route),
                ),
              ],
            ),
          ),
          Positioned(top: 160, right: 18, child: Container(width: 42, height: 42, decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle), child: IconButton(onPressed: () {}, icon: const Icon(Icons.open_in_full_rounded, size: 18, color: AppColors.trustNavy)))),
        ],
      ),
    );
  }
}

class LiveNavigationScreen extends StatelessWidget {
  const LiveNavigationScreen({super.key});

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
                gradient: LinearGradient(colors: [Color(0xFFF1F3F6), Color(0xFFD9DEE6)], begin: Alignment.topCenter, end: Alignment.bottomCenter),
              ),
              child: CustomPaint(painter: _GuardianMapPainter()),
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(14, 10, 14, 0),
                  child: Row(children: [Text('Guardian Active', style: theme.textTheme.titleSmall?.copyWith(color: AppColors.trustNavy, fontWeight: FontWeight.w700)), const Spacer(), const CircleAvatar(radius: 14, backgroundColor: Color(0xFFEAD3B8), child: Icon(Icons.person, size: 14, color: AppColors.trustNavy))]),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 18, 16, 0),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(color: Colors.white.withOpacity(0.94), borderRadius: BorderRadius.circular(22)),
                    child: Row(children: [Container(width: 44, height: 44, decoration: BoxDecoration(color: const Color(0xFFEAF1FD), borderRadius: BorderRadius.circular(16)), child: const Icon(Icons.turn_right_rounded, color: AppColors.trustNavy)), const SizedBox(width: 12), Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('Turn Right onto 5th Ave', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700, color: AppColors.trustNavy)), const SizedBox(height: 4), Text('in 200m • 4 mins remaining', style: theme.textTheme.bodySmall?.copyWith(color: AppColors.textSecondary))]))]),
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(mainAxisAlignment: MainAxisAlignment.end, children: const [
                    _MiniStatusCard(label: 'BRIGHTNESS', value: '98%'),
                    SizedBox(width: 10),
                    _MiniStatusCard(label: 'CONTACTS', value: '3'),
                  ]),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 18),
                  child: Row(children: [Expanded(child: OutlinedButton.icon(onPressed: () => context.go('/trip-live/need-help'), icon: const Icon(Icons.sos_outlined), label: const Text('SOS'))), const SizedBox(width: 12), Expanded(flex: 2, child: FilledButton.icon(onPressed: () => context.go('/post-trip/arrival-success'), icon: const Icon(Icons.close_rounded), label: const Text('End Trip')))]),
                ),
              ],
            ),
          ),
          Positioned(left: 100, bottom: 92, child: Container(padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6), decoration: BoxDecoration(color: const Color(0xFFD6F3E4), borderRadius: BorderRadius.circular(999)), child: const Text('Sentinel Active', style: TextStyle(color: AppColors.safeGreen, fontWeight: FontWeight.w700, fontSize: 11)))),
        ],
      ),
    );
  }
}
class LiveContactTrackingScreen extends StatelessWidget {
  const LiveContactTrackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return PageScaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(14, 10, 14, 0),
              child: Row(children: [Text('Guardian Active', style: theme.textTheme.titleSmall?.copyWith(color: AppColors.trustNavy, fontWeight: FontWeight.w700)), const Spacer(), const CircleAvatar(radius: 14, backgroundColor: Color(0xFFEAD3B8), child: Icon(Icons.person, size: 14, color: AppColors.trustNavy))]),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.fromLTRB(16, 18, 16, 16),
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24)),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Row(children: [Expanded(child: Text('Active Protection', style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w700, color: AppColors.trustNavy))), const CircleAvatar(radius: 5, backgroundColor: Color(0xFF4BE090))]),
                      const SizedBox(height: 14),
                      Container(height: 164, decoration: BoxDecoration(color: const Color(0xFF164B69), borderRadius: BorderRadius.circular(22)), child: CustomPaint(painter: _MiniTrackingPainter())),
                    ]),
                  ),
                  const SizedBox(height: 16),
                  Row(children: [Text('Watching Live', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700, color: AppColors.trustNavy)), const Spacer(), Text('2 Active', style: theme.textTheme.labelSmall?.copyWith(color: AppColors.skyBlue, fontWeight: FontWeight.w700))]),
                  const SizedBox(height: 12),
                  _WatcherTile(name: 'Sarah Williams', subtitle: 'Watching since 8:12 PM', icon: Icons.chat_bubble_outline_rounded, onTap: () => context.go('/companion/chat-voice-assist')),
                  const SizedBox(height: 10),
                  _WatcherTile(name: 'Dad', subtitle: 'Watching since 8:15 PM', icon: Icons.call_outlined, onTap: () => context.go('/companion/main')),
                  const SizedBox(height: 10),
                  const _WatcherTile(name: 'Marcus', subtitle: 'Offline', icon: Icons.notifications_none_rounded),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CheckInPromptScreen extends StatelessWidget {
  const CheckInPromptScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return PageScaffold(
      backgroundColor: const Color(0xFFFDFEFF),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(width: 76, height: 76, decoration: const BoxDecoration(shape: BoxShape.circle, gradient: RadialGradient(colors: [Color(0x6637E5A6), Color(0x112374FF)])), child: const Icon(Icons.shield_outlined, color: AppColors.trustNavy)),
                const SizedBox(height: 28),
                Text('Are you okay,\nJulian?', textAlign: TextAlign.center, style: theme.textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.w700, color: AppColors.trustNavy)),
                const SizedBox(height: 14),
                Text('Guardian Active is waiting for your confirmation.', textAlign: TextAlign.center, style: theme.textTheme.bodyLarge?.copyWith(color: AppColors.textSecondary, height: 1.45)),
                const SizedBox(height: 22),
                Text('00:54', style: theme.textTheme.displayLarge?.copyWith(fontWeight: FontWeight.w800, color: AppColors.trustNavy)),
                const SizedBox(height: 4),
                Text('SECONDS REMAINING', style: theme.textTheme.labelSmall?.copyWith(color: AppColors.textMuted, fontWeight: FontWeight.w700)),
                const SizedBox(height: 18),
                SizedBox(width: double.infinity, height: 56, child: FilledButton.icon(onPressed: () => context.go('/trip-live/im-fine'), icon: const Icon(Icons.check_circle_outline_rounded), label: const Text('I\'m Fine'))),
                const SizedBox(height: 14),
                SizedBox(width: double.infinity, height: 56, child: FilledButton(onPressed: () => context.go('/trip-live/need-help'), style: FilledButton.styleFrom(backgroundColor: const Color(0xFFFDE7E5), foregroundColor: AppColors.emergencyRed), child: const Text('I Need Help'))),
                const SizedBox(height: 14),
                Text('Emergency contacts will be notified automatically if you do not respond.', textAlign: TextAlign.center, style: theme.textTheme.bodySmall?.copyWith(color: AppColors.textMuted, height: 1.45)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ImFineStateScreen extends StatelessWidget {
  const ImFineStateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return PageScaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 20),
          children: [
            Row(children: [Text('Guardian Active', style: theme.textTheme.titleSmall?.copyWith(color: AppColors.trustNavy, fontWeight: FontWeight.w700)), const Spacer(), const CircleAvatar(radius: 14, backgroundColor: Color(0xFFEAD3B8), child: Icon(Icons.person, size: 14, color: AppColors.trustNavy))]),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(28)),
              child: Column(children: [const CircleAvatar(radius: 32, backgroundColor: Color(0xFFE5FAEF), child: Icon(Icons.shield_rounded, color: AppColors.safeGreen, size: 30)), const SizedBox(height: 14), Text('Safety Confirmed', style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w700, color: AppColors.trustNavy)), const SizedBox(height: 6), Text('You are marked as safe.', style: theme.textTheme.bodyMedium?.copyWith(color: AppColors.textSecondary)), const SizedBox(height: 16), Container(width: double.infinity, padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12), decoration: BoxDecoration(color: const Color(0xFFF1F5FE), borderRadius: BorderRadius.circular(18)), child: Text('Next check-in in 15 minutes', style: theme.textTheme.bodyMedium?.copyWith(color: AppColors.trustNavy, fontWeight: FontWeight.w700)))]),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(26)),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Row(children: [Expanded(child: Text('Home to Central Park', style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700, color: AppColors.trustNavy))), const _StatusBadgeLite(text: 'LIVE')]), const SizedBox(height: 10), Text('2 Guardians watching your path', style: theme.textTheme.bodySmall?.copyWith(color: AppColors.textSecondary)), const SizedBox(height: 16), const Row(children: [Expanded(child: _MetricTile(title: 'DISTANCE LEFT', value: '1.2 km')), SizedBox(width: 12), Expanded(child: _MetricTile(title: 'ETA', value: '8 min'))]), const SizedBox(height: 14), SizedBox(width: double.infinity, height: 50, child: OutlinedButton.icon(onPressed: () => context.go('/trip-live/contact-tracking'), icon: const Icon(Icons.person_add_alt_1_outlined), label: const Text('Add Temporary Contact')))]),
            ),
          ],
        ),
      ),
    );
  }
}

class NeedHelpFlowScreen extends StatelessWidget {
  const NeedHelpFlowScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return PageScaffold(
      safeArea: false,
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(gradient: LinearGradient(colors: [Color(0xFF18324A), Color(0xFF0C1B2B)], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
              child: CustomPaint(painter: _GuardianMapPainter(darkMode: true)),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [IconButton(onPressed: () => context.go('/trip-live/check-in'), icon: const Icon(Icons.close_rounded, color: Colors.white)), Text('Emergency Help', style: theme.textTheme.titleMedium?.copyWith(color: Colors.white, fontWeight: FontWeight.w700)), const Spacer(), const CircleAvatar(radius: 14, backgroundColor: Color(0xFFEAD3B8), child: Icon(Icons.person, size: 14, color: AppColors.trustNavy))]),
                  const SizedBox(height: 18),
                  Container(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6), decoration: BoxDecoration(color: Colors.white.withOpacity(0.12), borderRadius: BorderRadius.circular(999)), child: Text('Action Required', style: theme.textTheme.labelSmall?.copyWith(color: Colors.white70, fontWeight: FontWeight.w700))),
                  const Spacer(),
                  _EmergencyActionTile(color: AppColors.emergencyRed, icon: Icons.emergency, title: 'Call 911', subtitle: 'Emergency Services', onTap: () => context.go('/trip-live/sos-expanded')),
                  const SizedBox(height: 12),
                  _EmergencyActionTile(color: const Color(0xFFEAF1FD), icon: Icons.group_outlined, title: 'Alert Guardians', subtitle: 'Guardian Network', darkText: true, onTap: () => context.go('/companion/main')),
                  const SizedBox(height: 12),
                  _EmergencyActionTile(color: const Color(0xFFE8FAF1), icon: Icons.shield_outlined, title: 'Find Safe Point', subtitle: 'Location Security', darkText: true, onTap: () => context.go('/emergency/nearby-safe-points')),
                  const SizedBox(height: 18),
                  Container(width: double.infinity, padding: const EdgeInsets.all(14), decoration: BoxDecoration(color: const Color(0xFF113355), borderRadius: BorderRadius.circular(18)), child: Text('Location sharing is currently active.', style: theme.textTheme.bodyMedium?.copyWith(color: const Color(0xFF8BE4C3), fontWeight: FontWeight.w600))),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
class TripProgressUpdateScreen extends StatelessWidget {
  const TripProgressUpdateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return PageScaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 20),
          children: [
            Row(children: [Text('Guardian Active', style: theme.textTheme.titleSmall?.copyWith(color: AppColors.trustNavy, fontWeight: FontWeight.w700)), const Spacer(), const CircleAvatar(radius: 14, backgroundColor: Color(0xFFEAD3B8), child: Icon(Icons.person, size: 14, color: AppColors.trustNavy))]),
            const SizedBox(height: 20),
            Text('Trip Active', style: theme.textTheme.labelSmall?.copyWith(color: AppColors.safeGreen, fontWeight: FontWeight.w700)),
            const SizedBox(height: 8),
            Text('You\'re making\ngreat progress.', style: theme.textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.w700, color: AppColors.trustNavy, height: 1.0)),
            const SizedBox(height: 18),
            Row(children: [Expanded(child: _ProgressData(title: 'TOTAL DISTANCE', value: '68%', subtitle: 'completed')), const SizedBox(width: 14), Expanded(child: _ProgressData(title: 'ESTIMATED ARRIVAL', value: '22:14', subtitle: ''))]),
            const SizedBox(height: 12),
            ClipRRect(borderRadius: BorderRadius.circular(999), child: const LinearProgressIndicator(value: 0.68, minHeight: 8, backgroundColor: Color(0xFFDCE5F0), valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF2374FF)))),
            const SizedBox(height: 18),
            const Row(children: [Expanded(child: _MetricTile(title: 'Safe Corridor', value: '100%')), SizedBox(width: 12), Expanded(child: _MetricTile(title: 'Community Presence', value: 'High'))]),
            const SizedBox(height: 16),
            Container(height: 140, decoration: BoxDecoration(color: const Color(0xFFC8D5C0), borderRadius: BorderRadius.circular(24)), child: CustomPaint(painter: _MiniTrackingPainter(lightMode: true))),
            const SizedBox(height: 18),
            SizedBox(width: double.infinity, height: 56, child: FilledButton.icon(onPressed: () => context.go('/trip-live/sos-expanded'), icon: const Icon(Icons.sos_outlined), label: const Text('Hold for SOS'))),
            const SizedBox(height: 12),
            SizedBox(width: double.infinity, height: 54, child: OutlinedButton(onPressed: () => context.go('/trip-live/contact-tracking'), child: const Text('Update Contacts'))),
          ],
        ),
      ),
    );
  }
}

enum _TripTab { route, contacts, checkIn, sos }

class _TripBottomBar extends StatelessWidget {
  const _TripBottomBar({required this.active});
  final _TripTab active;
  @override
  Widget build(BuildContext context) {
    final items = const [
      (_TripTab.route, Icons.route_outlined, 'ROUTE', '/trip-live/navigation'),
      (_TripTab.contacts, Icons.people_outline_rounded, 'CONTACTS', '/trip-live/contact-tracking'),
      (_TripTab.checkIn, Icons.fact_check_outlined, 'CHECK-IN', '/trip-live/check-in'),
      (_TripTab.sos, Icons.sos_outlined, 'SOS', '/trip-live/need-help'),
    ];
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      decoration: BoxDecoration(color: const Color(0xFFF1F6E7), borderRadius: BorderRadius.circular(24)),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [for (final item in items) InkWell(onTap: () => context.go(item.$4), borderRadius: BorderRadius.circular(12), child: Padding(padding: const EdgeInsets.symmetric(horizontal: 4), child: Column(mainAxisSize: MainAxisSize.min, children: [Icon(item.$2, size: 18, color: active == item.$1 ? AppColors.trustNavy : AppColors.textMuted), const SizedBox(height: 4), Text(item.$3, style: Theme.of(context).textTheme.labelSmall?.copyWith(color: active == item.$1 ? AppColors.trustNavy : AppColors.textMuted, fontWeight: FontWeight.w700))])))]),
    );
  }
}

class _MiniAvatarStack extends StatelessWidget {
  const _MiniAvatarStack();
  @override
  Widget build(BuildContext context) => Row(children: const [CircleAvatar(radius: 14, backgroundColor: Colors.white, child: Icon(Icons.person, size: 14, color: AppColors.textMuted)), SizedBox(width: -4), CircleAvatar(radius: 14, backgroundColor: Colors.white, child: Icon(Icons.person, size: 14, color: AppColors.textMuted)), SizedBox(width: -4), CircleAvatar(radius: 14, backgroundColor: Color(0xFFEAF1FD), child: Text('+3', style: TextStyle(fontSize: 10, color: AppColors.skyBlue, fontWeight: FontWeight.w700)))]);
}

class _MiniStatusCard extends StatelessWidget {
  const _MiniStatusCard({required this.label, required this.value});
  final String label;
  final String value;
  @override
  Widget build(BuildContext context) => Container(padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10), decoration: BoxDecoration(color: Colors.white.withOpacity(0.9), borderRadius: BorderRadius.circular(16)), child: Column(children: [Text(label, style: Theme.of(context).textTheme.labelSmall?.copyWith(color: AppColors.textMuted, fontWeight: FontWeight.w700)), const SizedBox(height: 4), Text(value, style: Theme.of(context).textTheme.titleMedium?.copyWith(color: AppColors.trustNavy, fontWeight: FontWeight.w700))]));
}

class _WatcherTile extends StatelessWidget {
  const _WatcherTile({required this.name, required this.subtitle, required this.icon, this.onTap});
  final String name;
  final String subtitle;
  final IconData icon;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) => Material(color: Colors.white, borderRadius: BorderRadius.circular(22), child: InkWell(onTap: onTap, borderRadius: BorderRadius.circular(22), child: Padding(padding: const EdgeInsets.all(14), child: Row(children: [const CircleAvatar(radius: 22, backgroundColor: Color(0xFFEAD3B8), child: Icon(Icons.person, color: AppColors.trustNavy)), const SizedBox(width: 12), Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(name, style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700, color: AppColors.trustNavy)), const SizedBox(height: 4), Text(subtitle, style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColors.textSecondary))])), CircleAvatar(radius: 16, backgroundColor: const Color(0xFFEAF1FD), child: Icon(icon, size: 16, color: AppColors.skyBlue))]))));
}

class _EmergencyActionTile extends StatelessWidget {
  const _EmergencyActionTile({required this.color, required this.icon, required this.title, required this.subtitle, this.darkText = false, required this.onTap});
  final Color color;
  final IconData icon;
  final String title;
  final String subtitle;
  final bool darkText;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    final fg = darkText ? AppColors.trustNavy : Colors.white;
    final sub = darkText ? AppColors.textMuted : Colors.white70;
    return Material(color: color, borderRadius: BorderRadius.circular(24), child: InkWell(onTap: onTap, borderRadius: BorderRadius.circular(24), child: Padding(padding: const EdgeInsets.all(18), child: Row(children: [Container(width: 44, height: 44, decoration: BoxDecoration(color: darkText ? Colors.white : Colors.white.withOpacity(0.16), borderRadius: BorderRadius.circular(16)), child: Icon(icon, color: darkText ? AppColors.trustNavy : Colors.white)), const SizedBox(width: 14), Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(subtitle.toUpperCase(), style: Theme.of(context).textTheme.labelSmall?.copyWith(color: sub, fontWeight: FontWeight.w700)), const SizedBox(height: 4), Text(title, style: Theme.of(context).textTheme.titleLarge?.copyWith(color: fg, fontWeight: FontWeight.w700))])), Icon(Icons.arrow_forward_ios_rounded, size: 16, color: fg)]))));
  }
}

class _StatusBadgeLite extends StatelessWidget {
  const _StatusBadgeLite({required this.text});
  final String text;
  @override
  Widget build(BuildContext context) => Container(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5), decoration: BoxDecoration(color: const Color(0xFFE5FAEF), borderRadius: BorderRadius.circular(999)), child: Text(text, style: const TextStyle(color: AppColors.safeGreen, fontWeight: FontWeight.w700, fontSize: 10)));
}

class _MetricTile extends StatelessWidget {
  const _MetricTile({required this.title, required this.value});
  final String title;
  final String value;
  @override
  Widget build(BuildContext context) => Container(padding: const EdgeInsets.all(16), decoration: BoxDecoration(color: const Color(0xFFF3F6FB), borderRadius: BorderRadius.circular(22)), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(title, style: Theme.of(context).textTheme.labelSmall?.copyWith(color: AppColors.textMuted, fontWeight: FontWeight.w700)), const SizedBox(height: 8), Text(value, style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: AppColors.trustNavy, fontWeight: FontWeight.w700))]));
}

class _ProgressData extends StatelessWidget {
  const _ProgressData({required this.title, required this.value, required this.subtitle});
  final String title;
  final String value;
  final String subtitle;
  @override
  Widget build(BuildContext context) => Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(title, style: Theme.of(context).textTheme.labelSmall?.copyWith(color: AppColors.textMuted, fontWeight: FontWeight.w700)), const SizedBox(height: 6), Text(value, style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: AppColors.trustNavy, fontWeight: FontWeight.w700)), if (subtitle.isNotEmpty) Text(subtitle, style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColors.textSecondary))]);
}

class _GuardianMapPainter extends CustomPainter {
  const _GuardianMapPainter({this.greenMode = false, this.darkMode = false});
  final bool greenMode;
  final bool darkMode;
  @override
  void paint(Canvas canvas, Size size) {
    final gridColor = darkMode ? Colors.white.withOpacity(0.14) : Colors.white.withOpacity(greenMode ? 0.2 : 0.4);
    final road = Paint()..color = gridColor..style = PaintingStyle.stroke..strokeWidth = 1.4;
    for (double x = 0; x < size.width; x += 28) { canvas.drawLine(Offset(x, 0), Offset(x, size.height), road); }
    for (double y = 0; y < size.height; y += 28) { canvas.drawLine(Offset(0, y), Offset(size.width, y), road); }
    final route = Paint()..color = greenMode ? const Color(0xFF2C70FF) : const Color(0xFF6AA5FF)..style = PaintingStyle.stroke..strokeWidth = 4..strokeCap = StrokeCap.round;
    final path = Path()..moveTo(size.width * 0.68, size.height * 0.12)..cubicTo(size.width * 0.48, size.height * 0.26, size.width * 0.6, size.height * 0.54, size.width * 0.35, size.height * 0.78);
    canvas.drawPath(path, route);
    canvas.drawCircle(Offset(size.width * 0.52, size.height * 0.18), 5, Paint()..color = const Color(0xFF1E70FF));
    canvas.drawCircle(Offset(size.width * 0.36, size.height * 0.78), 7, Paint()..color = const Color(0xFF1E70FF));
  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _MiniTrackingPainter extends CustomPainter {
  const _MiniTrackingPainter({this.lightMode = false});
  final bool lightMode;
  @override
  void paint(Canvas canvas, Size size) {
    final bg = Paint()..color = lightMode ? const Color(0xFFBCCBB2) : const Color(0xFF2D6783);
    canvas.drawRRect(RRect.fromRectAndRadius(Offset.zero & size, const Radius.circular(24)), bg);
    final grid = Paint()..color = Colors.white.withOpacity(lightMode ? 0.16 : 0.12)..style = PaintingStyle.stroke..strokeWidth = 1;
    for (double x = 0; x < size.width; x += 24) { canvas.drawLine(Offset(x, 0), Offset(x, size.height), grid); }
    for (double y = 0; y < size.height; y += 24) { canvas.drawLine(Offset(0, y), Offset(size.width, y), grid); }
    canvas.drawCircle(Offset(size.width * 0.55, size.height * 0.48), 14, Paint()..color = const Color(0xFFEAF1FD));
    canvas.drawCircle(Offset(size.width * 0.55, size.height * 0.48), 6, Paint()..color = const Color(0xFF2374FF));
  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
class SosHoldActivationScreen extends StatelessWidget {
  const SosHoldActivationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return PageScaffold(
      safeArea: false,
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(gradient: LinearGradient(colors: [Color(0xFF16283A), Color(0xFF091420)], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
              child: CustomPaint(painter: _GuardianMapPainter(darkMode: true)),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 14),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 0),
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                    decoration: const BoxDecoration(color: AppColors.emergencyRed),
                    child: Row(children: [const Icon(Icons.warning_amber_rounded, color: Colors.white), const SizedBox(width: 8), Text('Emergency Active', style: theme.textTheme.titleSmall?.copyWith(color: Colors.white, fontWeight: FontWeight.w700)), const Spacer(), const Icon(Icons.sensors_rounded, color: Colors.white, size: 18)]),
                  ),
                  const Spacer(),
                  Container(padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6), decoration: BoxDecoration(color: AppColors.emergencyRed.withOpacity(0.18), borderRadius: BorderRadius.circular(999)), child: Text('Live Location Broadcasting', style: theme.textTheme.labelSmall?.copyWith(color: AppColors.emergencyRed, fontWeight: FontWeight.w700))),
                  const SizedBox(height: 24),
                  Container(
                    width: 208,
                    height: 208,
                    decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: AppColors.emergencyRed, width: 4), color: const Color(0x66191F2A)),
                    child: Center(child: Text('*\nSOS', textAlign: TextAlign.center, style: theme.textTheme.headlineLarge?.copyWith(color: Colors.white, fontWeight: FontWeight.w800, height: 1.0))),
                  ),
                  const SizedBox(height: 24),
                  Text('Hold for SOS', style: theme.textTheme.headlineSmall?.copyWith(color: Colors.white, fontWeight: FontWeight.w700)),
                  const SizedBox(height: 10),
                  Text('Keep holding for 3 seconds to trigger emergency alert.', textAlign: TextAlign.center, style: theme.textTheme.bodyMedium?.copyWith(color: Colors.white70, height: 1.45)),
                  const SizedBox(height: 24),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(color: const Color(0xFF0E2033), borderRadius: BorderRadius.circular(18)),
                    child: Row(children: [const Icon(Icons.shield_outlined, color: Colors.white70), const SizedBox(width: 10), Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('Guardian Status', style: theme.textTheme.labelSmall?.copyWith(color: Colors.white54, fontWeight: FontWeight.w700)), const SizedBox(height: 4), Text('Local Authorities Ready', style: theme.textTheme.bodyMedium?.copyWith(color: Colors.white, fontWeight: FontWeight.w700))])), const Icon(Icons.more_horiz_rounded, color: Color(0xFF4BE090))]),
                  ),
                  const SizedBox(height: 14),
                  Row(children: [Expanded(child: FilledButton(onPressed: () => context.go('/trip-live'), style: FilledButton.styleFrom(backgroundColor: const Color(0xFF1A2433), foregroundColor: Colors.white), child: const Text('Cancel SOS'))), const SizedBox(width: 12), Expanded(child: FilledButton(onPressed: () => context.go('/emergency/priority-contact-auto-call'), style: FilledButton.styleFrom(backgroundColor: AppColors.emergencyRed), child: const Text('Contact Police')))]),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SosCountdownScreen extends StatelessWidget {
  const SosCountdownScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return PageScaffold(
      backgroundColor: const Color(0xFFF6F7FA),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              color: AppColors.emergencyRed,
              child: Row(children: [const Icon(Icons.warning_amber_rounded, color: Colors.white), const SizedBox(width: 8), Text('Emergency Active', style: theme.textTheme.titleSmall?.copyWith(color: Colors.white, fontWeight: FontWeight.w700)), const Spacer(), const Icon(Icons.sensors_rounded, color: Colors.white, size: 18)]),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 16),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(22)),
                      child: Row(children: [const Expanded(child: Text('North Bridge Road, SG', style: TextStyle(color: AppColors.textMuted))), Container(width: 34, height: 34, decoration: BoxDecoration(color: const Color(0xFFF3F6FB), borderRadius: BorderRadius.circular(12)), child: const Icon(Icons.location_on_outlined, size: 18, color: AppColors.textMuted))]),
                    ),
                    const Spacer(),
                    Text('Alerting in...', style: theme.textTheme.labelLarge?.copyWith(color: AppColors.textMuted, fontWeight: FontWeight.w700)),
                    const SizedBox(height: 16),
                    Container(width: 210, height: 210, decoration: const BoxDecoration(shape: BoxShape.circle, gradient: RadialGradient(colors: [Color(0xFFFFEFEF), Color(0xFFFFFFFF)]), boxShadow: [BoxShadow(color: Color(0x33FF3B30), blurRadius: 24, offset: Offset(0, 12))]), child: Center(child: Text('2', style: theme.textTheme.displayLarge?.copyWith(color: AppColors.emergencyRed, fontWeight: FontWeight.w800)))),
                    const SizedBox(height: 18),
                    Text('Release to cancel. Hold to confirm emergency.', textAlign: TextAlign.center, style: theme.textTheme.bodyMedium?.copyWith(color: AppColors.textSecondary, height: 1.45)),
                    const Spacer(),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
                      decoration: BoxDecoration(color: const Color(0xFF10182B), borderRadius: BorderRadius.circular(22)),
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [const _EmergencyMeta(icon: Icons.shield_outlined, label: 'Local Authorities'), const _EmergencyMeta(icon: Icons.people_outline, label: '3 Guardians')]),
                    ),
                    const SizedBox(height: 12),
                    Row(children: [Expanded(child: FilledButton(onPressed: () => context.go('/emergency/priority-contact-auto-call'), style: FilledButton.styleFrom(backgroundColor: const Color(0xFF111A2B), foregroundColor: Colors.white), child: const Text('Contact Police'))), const SizedBox(width: 12), Expanded(child: FilledButton(onPressed: () => context.go('/emergency/alert-sent'), style: FilledButton.styleFrom(backgroundColor: AppColors.emergencyRed), child: const Text('Cancel SOS')))]),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _EmergencyMeta extends StatelessWidget {
  const _EmergencyMeta({required this.icon, required this.label});
  final IconData icon;
  final String label;
  @override
  Widget build(BuildContext context) => Row(children: [Icon(icon, color: Colors.white70, size: 18), const SizedBox(width: 8), Text(label, style: Theme.of(context).textTheme.labelMedium?.copyWith(color: Colors.white70, fontWeight: FontWeight.w700))]);
}
