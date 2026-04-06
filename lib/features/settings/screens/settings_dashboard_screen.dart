import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_colors.dart';
import '../../../shared/widgets/page_scaffold.dart';

class SettingsDashboardScreen extends StatelessWidget {
  const SettingsDashboardScreen({super.key});

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
                    onPressed: () => context.go('/home'),
                    icon: const Icon(Icons.arrow_back_rounded, color: AppColors.trustNavy),
                  ),
                  Text('SafeWalk', style: theme.textTheme.titleMedium?.copyWith(color: AppColors.trustNavy, fontWeight: FontWeight.w700)),
                  const Spacer(),
                  Text('Settings', style: theme.textTheme.labelMedium?.copyWith(color: AppColors.textMuted, fontWeight: FontWeight.w700)),
                ],
              ),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.only(top: 8),
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(26)),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              const CircleAvatar(radius: 26, backgroundColor: Color(0xFFEAD3B8), child: Icon(Icons.person, color: AppColors.trustNavy, size: 28)),
                              const SizedBox(width: 12),
                              Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('Alex Guardian', style: theme.textTheme.titleLarge?.copyWith(color: AppColors.trustNavy, fontWeight: FontWeight.w700)), const SizedBox(height: 4), RichText(text: TextSpan(style: theme.textTheme.bodySmall?.copyWith(color: AppColors.textSecondary), children: const [TextSpan(text: 'Safety Status: '), TextSpan(text: 'Protected', style: TextStyle(color: AppColors.safeGreen, fontWeight: FontWeight.w700))]))])),
                            ],
                          ),
                          const SizedBox(height: 14),
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(14),
                            decoration: BoxDecoration(color: AppColors.trustNavy, borderRadius: BorderRadius.circular(18)),
                            child: Row(children: [const CircleAvatar(radius: 16, backgroundColor: Color(0x1AFFFFFF), child: Icon(Icons.workspace_premium_outlined, color: Colors.white, size: 18)), const SizedBox(width: 10), Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('Current Plan', style: theme.textTheme.labelSmall?.copyWith(color: Colors.white70, fontWeight: FontWeight.w700)), const SizedBox(height: 4), Text('Premium Guardian', style: theme.textTheme.titleMedium?.copyWith(color: Colors.white, fontWeight: FontWeight.w700))]))]),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    _SectionCard(
                      title: 'Account',
                      items: [
                        _SettingsItem(icon: Icons.person_outline_rounded, label: 'Profile'),
                        _SettingsItem(icon: Icons.card_membership_outlined, label: 'Membership'),
                        _SettingsItem(icon: Icons.key_outlined, label: 'Password'),
                      ],
                    ),
                    const SizedBox(height: 14),
                    _SectionCard(
                      title: 'Security',
                      items: [
                        _SettingsItem(icon: Icons.sos_outlined, label: 'SOS Triggers', route: '/settings/sos-customization'),
                        _SettingsItem(icon: Icons.group_outlined, label: 'Trusted Circles', route: '/settings/privacy'),
                        _SettingsItem(icon: Icons.contact_phone_outlined, label: 'Emergency Contacts'),
                      ],
                    ),
                    const SizedBox(height: 14),
                    _SectionCard(
                      title: 'Preferences',
                      items: [
                        _SettingsItem(icon: Icons.notifications_none_rounded, label: 'Notifications', route: '/settings/notification-preferences'),
                        _SettingsItem(icon: Icons.shield_outlined, label: 'Privacy', route: '/settings/privacy'),
                        _SettingsItem(icon: Icons.accessibility_new_rounded, label: 'Accessibility', route: '/settings/accessibility'),
                      ],
                    ),
                    const SizedBox(height: 14),
                    _SectionCard(
                      title: 'Support',
                      items: const [
                        _SettingsItem(icon: Icons.help_outline_rounded, label: 'Help Center'),
                        _SettingsItem(icon: Icons.bug_report_outlined, label: 'Report a Bug'),
                        _SettingsItem(icon: Icons.info_outline_rounded, label: 'About SafeWalk'),
                      ],
                    ),
                    const SizedBox(height: 16),
                    OutlinedButton.icon(
                      onPressed: () => context.go('/entry/welcome'),
                      icon: const Icon(Icons.logout_rounded, color: AppColors.emergencyRed),
                      label: const Text('Logout', style: TextStyle(color: AppColors.emergencyRed)),
                    ),
                  ],
                ),
              ),
              const _SettingsBottomBar(active: _SettingsTab.settings),
            ],
          ),
        ),
      ),
    );
  }
}

class _SectionCard extends StatelessWidget {
  const _SectionCard({required this.title, required this.items});

  final String title;
  final List<_SettingsItem> items;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.titleMedium?.copyWith(color: AppColors.trustNavy, fontWeight: FontWeight.w700)),
          const SizedBox(height: 10),
          for (var i = 0; i < items.length; i++) ...[
            _SettingsRow(item: items[i]),
            if (i != items.length - 1) const Divider(height: 18),
          ],
        ],
      ),
    );
  }
}

class _SettingsItem {
  const _SettingsItem({required this.icon, required this.label, this.route});

  final IconData icon;
  final String label;
  final String? route;
}

class _SettingsRow extends StatelessWidget {
  const _SettingsRow({required this.item});

  final _SettingsItem item;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: item.route == null ? null : () => context.go(item.route!),
      child: Row(
        children: [
          CircleAvatar(radius: 18, backgroundColor: const Color(0xFFEAF1FD), child: Icon(item.icon, size: 18, color: AppColors.skyBlue)),
          const SizedBox(width: 12),
          Expanded(child: Text(item.label, style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: AppColors.trustNavy, fontWeight: FontWeight.w600))),
          const Icon(Icons.chevron_right_rounded, color: AppColors.textMuted),
        ],
      ),
    );
  }
}

enum _SettingsTab { home, map, trips, settings }

class _SettingsBottomBar extends StatelessWidget {
  const _SettingsBottomBar({required this.active});

  final _SettingsTab active;

  @override
  Widget build(BuildContext context) {
    final items = const [
      (_SettingsTab.home, Icons.home_filled, 'HOME', '/home'),
      (_SettingsTab.map, Icons.map_outlined, 'MAP', '/safety-map/main'),
      (_SettingsTab.trips, Icons.route_outlined, 'TRIPS', '/trips'),
      (_SettingsTab.settings, Icons.settings_outlined, 'SETTINGS', '/settings/dashboard'),
    ];
    return Container(
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24)),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [for (final item in items) InkWell(onTap: () => context.go(item.$4), child: Column(mainAxisSize: MainAxisSize.min, children: [Container(width: 34, height: 34, decoration: BoxDecoration(color: active == item.$1 ? AppColors.trustNavy : Colors.transparent, borderRadius: BorderRadius.circular(12)), child: Icon(item.$2, size: 18, color: active == item.$1 ? Colors.white : AppColors.textMuted)), const SizedBox(height: 4), Text(item.$3, style: Theme.of(context).textTheme.labelSmall?.copyWith(color: active == item.$1 ? AppColors.trustNavy : AppColors.textMuted, fontWeight: FontWeight.w700))]))]),
    );
  }
}

