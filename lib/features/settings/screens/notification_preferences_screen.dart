import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_colors.dart';
import '../../../shared/widgets/page_scaffold.dart';

class NotificationPreferencesScreen extends StatefulWidget {
  const NotificationPreferencesScreen({super.key});

  @override
  State<NotificationPreferencesScreen> createState() => _NotificationPreferencesScreenState();
}

class _NotificationPreferencesScreenState extends State<NotificationPreferencesScreen> {
  bool _highRiskNearby = true;
  bool _communityIncidents = true;
  bool _guardianWatching = true;
  bool _checkInRequests = true;
  bool _arrivalConfirmations = true;
  bool _batteryWarnings = true;
  bool _newFeatures = true;
  bool _monthlySummary = false;

  Future<void> _showBatteryModeInfo() {
    return showModalBottomSheet<void>(
      context: context,
      builder: (context) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Battery Saving Mode',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: AppColors.trustNavy,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'This mode reduces background refresh while keeping emergency actions, check-ins, and SOS triggers available.',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: AppColors.textSecondary,
                  height: 1.45,
                ),
              ),
              const SizedBox(height: 18),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Got it'),
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
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 10),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () => context.go('/settings/dashboard'),
                    icon: const Icon(
                      Icons.arrow_back_rounded,
                      color: AppColors.trustNavy,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Settings',
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: AppColors.trustNavy,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const CircleAvatar(
                    radius: 15,
                    backgroundColor: Color(0xFFEAD3B8),
                    child: Icon(
                      Icons.person,
                      size: 15,
                      color: AppColors.trustNavy,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.only(top: 12),
                  children: [
                    Text(
                      'PREFERENCES',
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: AppColors.skyBlue,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Notification\nPreferences',
                      style: theme.textTheme.headlineMedium?.copyWith(
                        color: AppColors.trustNavy,
                        fontWeight: FontWeight.w700,
                        height: 1.0,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Customize how you receive alerts for community safety, guardian activities, and trip updates.',
                      style: theme.textTheme.bodyLarge?.copyWith(
                        color: AppColors.textSecondary,
                        height: 1.45,
                      ),
                    ),
                    const SizedBox(height: 20),
                    _Category(
                      title: 'Safety Alerts',
                      icon: Icons.shield_outlined,
                      children: [
                        _PrefCard(
                          title: 'High-risk area nearby',
                          subtitle: 'Immediate alerts when entering zones with recent safety reports.',
                          value: _highRiskNearby,
                          onChanged: (value) => setState(() => _highRiskNearby = value),
                        ),
                        const SizedBox(height: 12),
                        _PrefCard(
                          title: 'Community reported incidents',
                          subtitle: 'Notifications for nearby incidents shared by the SafeWalk community.',
                          value: _communityIncidents,
                          onChanged: (value) => setState(() => _communityIncidents = value),
                        ),
                      ],
                    ),
                    const SizedBox(height: 18),
                    _Category(
                      title: 'Guardian Activity',
                      icon: Icons.groups_outlined,
                      children: [
                        _PrefCard(
                          title: 'When a guardian starts watching',
                          subtitle: 'Confirmation when a trusted contact accepts your watch request.',
                          value: _guardianWatching,
                          onChanged: (value) => setState(() => _guardianWatching = value),
                        ),
                        const SizedBox(height: 12),
                        _PrefCard(
                          title: 'Check-in requests',
                          subtitle: 'Periodic pings to confirm you are still safe during a trip.',
                          value: _checkInRequests,
                          onChanged: (value) => setState(() => _checkInRequests = value),
                        ),
                      ],
                    ),
                    const SizedBox(height: 18),
                    _Category(
                      title: 'Trip Updates',
                      icon: Icons.check_circle_outline_rounded,
                      children: [
                        _PrefCard(
                          title: 'Arrival confirmations',
                          subtitle: 'Let your guardians know automatically when you reach your destination.',
                          value: _arrivalConfirmations,
                          onChanged: (value) => setState(() => _arrivalConfirmations = value),
                        ),
                        const SizedBox(height: 12),
                        _PrefCard(
                          title: 'Battery level warnings',
                          subtitle: 'Alerts for you and your guardians if your phone battery drops below 10%.',
                          value: _batteryWarnings,
                          onChanged: (value) => setState(() => _batteryWarnings = value),
                        ),
                      ],
                    ),
                    const SizedBox(height: 18),
                    _Category(
                      title: 'App Updates',
                      icon: Icons.settings_outlined,
                      children: [
                        _PrefCard(
                          title: 'New features',
                          subtitle: 'Stay informed about new safety tools and community enhancements.',
                          value: _newFeatures,
                          onChanged: (value) => setState(() => _newFeatures = value),
                        ),
                        const SizedBox(height: 12),
                        _PrefCard(
                          title: 'Monthly safety summary',
                          subtitle: 'A digest of your activity, protected walks, and local stats.',
                          value: _monthlySummary,
                          onChanged: (value) => setState(() => _monthlySummary = value),
                        ),
                      ],
                    ),
                    const SizedBox(height: 18),
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: AppColors.trustNavy,
                        borderRadius: BorderRadius.circular(28),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'PRO TIP',
                            style: theme.textTheme.labelSmall?.copyWith(
                              color: const Color(0xFF7FE3B0),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Battery Saving Mode',
                            style: theme.textTheme.headlineSmall?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'When enabled, SafeWalk reduces background updates while maintaining real-time emergency triggers.',
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: Colors.white70,
                              height: 1.45,
                            ),
                          ),
                          const SizedBox(height: 16),
                          FilledButton(
                            onPressed: _showBatteryModeInfo,
                            style: FilledButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: AppColors.trustNavy,
                            ),
                            child: const Text('Learn More'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const _SettingsBottomBar(activeIndex: 3),
            ],
          ),
        ),
      ),
    );
  }
}

class _Category extends StatelessWidget {
  const _Category({required this.title, required this.icon, required this.children});

  final String title;
  final IconData icon;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, color: AppColors.skyBlue),
            const SizedBox(width: 8),
            Text(
              title,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: AppColors.trustNavy,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        ...children,
      ],
    );
  }
}

class _PrefCard extends StatelessWidget {
  const _PrefCard({
    required this.title,
    required this.subtitle,
    required this.value,
    required this.onChanged,
  });

  final String title;
  final String subtitle;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: AppColors.trustNavy,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  subtitle,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.textSecondary,
                    height: 1.35,
                  ),
                ),
              ],
            ),
          ),
          Switch(value: value, onChanged: onChanged),
        ],
      ),
    );
  }
}

class _SettingsBottomBar extends StatelessWidget {
  const _SettingsBottomBar({required this.activeIndex});

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
