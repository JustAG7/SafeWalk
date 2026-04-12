import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_colors.dart';
import '../../../shared/widgets/page_scaffold.dart';

class PrivacySettingsScreen extends StatefulWidget {
  const PrivacySettingsScreen({super.key});

  @override
  State<PrivacySettingsScreen> createState() => _PrivacySettingsScreenState();
}

class _PrivacySettingsScreenState extends State<PrivacySettingsScreen> {
  bool _liveTracking = true;
  bool _backgroundHistory = false;
  bool _incidentData = true;
  bool _diagnosticData = false;
  String _visibility = 'trusted';

  Future<void> _showInfo(String title, String body) {
    return showModalBottomSheet<void>(
      context: context,
      builder: (context) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700)),
              const SizedBox(height: 12),
              Text(body, style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: AppColors.textSecondary, height: 1.45)),
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
              Row(children: [IconButton(onPressed: () => context.go('/settings/dashboard'), icon: const Icon(Icons.arrow_back_rounded, color: AppColors.trustNavy)), Text('Privacy Settings', style: theme.textTheme.titleMedium?.copyWith(color: AppColors.trustNavy, fontWeight: FontWeight.w700)), const Spacer(), const CircleAvatar(radius: 15, backgroundColor: Color(0xFFEAF1FD), child: Icon(Icons.lock_outline_rounded, size: 16, color: AppColors.skyBlue))]),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.only(top: 8),
                  children: [
                    Text('Your Shield,\nYour Control.', style: theme.textTheme.headlineMedium?.copyWith(color: AppColors.trustNavy, fontWeight: FontWeight.w700, height: 1.0)),
                    const SizedBox(height: 10),
                    Text('Manage how SafeWalk handles your data and who can view your active security status.', style: theme.textTheme.bodyLarge?.copyWith(color: AppColors.textSecondary, height: 1.45)),
                    const SizedBox(height: 20),
                    Text('LOCATION SHARING', style: theme.textTheme.labelSmall?.copyWith(color: AppColors.skyBlue, fontWeight: FontWeight.w700)),
                    const SizedBox(height: 10),
                    _ToggleCard(title: 'Live Tracking', subtitle: 'Share your precise coordinates in real-time with emergency contacts during active walks.', value: _liveTracking, onChanged: (value) => setState(() => _liveTracking = value)),
                    const SizedBox(height: 12),
                    _ToggleCard(title: 'Background History', subtitle: 'Allow the app to log your routes while inactive to improve safety patterns and response times.', value: _backgroundHistory, onChanged: (value) => setState(() => _backgroundHistory = value)),
                    const SizedBox(height: 18),
                    Text('STATUS VISIBILITY', style: theme.textTheme.labelSmall?.copyWith(color: AppColors.skyBlue, fontWeight: FontWeight.w700)),
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24)),
                      child: Column(children: [
                        _RadioRow(title: 'Trusted Circles', subtitle: 'Only members of your created circles', selected: _visibility == 'trusted', onTap: () => setState(() => _visibility = 'trusted')),
                        const Divider(height: 18),
                        _RadioRow(title: 'Only Contacts', subtitle: 'Visible in your phone address book', selected: _visibility == 'contacts', onTap: () => setState(() => _visibility = 'contacts')),
                        const Divider(height: 18),
                        _RadioRow(title: 'Public', subtitle: 'Visible to nearby users for community safety', selected: _visibility == 'public', onTap: () => setState(() => _visibility = 'public')),
                      ]),
                    ),
                    const SizedBox(height: 18),
                    Text('DATA USAGE', style: theme.textTheme.labelSmall?.copyWith(color: AppColors.skyBlue, fontWeight: FontWeight.w700)),
                    const SizedBox(height: 10),
                    _ToggleCard(title: 'Anonymized Incident Data', subtitle: 'Help us identify high-risk zones by sharing non-identifiable incident reports.', value: _incidentData, onChanged: (value) => setState(() => _incidentData = value)),
                    const SizedBox(height: 12),
                    _ToggleCard(title: 'Diagnostic Data', subtitle: 'Automatically send crash reports and performance metrics to our engineering team.', value: _diagnosticData, onChanged: (value) => setState(() => _diagnosticData = value)),
                    const SizedBox(height: 18),
                    Container(
                      padding: const EdgeInsets.all(18),
                      decoration: BoxDecoration(color: AppColors.trustNavy, borderRadius: BorderRadius.circular(26)),
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('Privacy Center', style: theme.textTheme.headlineSmall?.copyWith(color: Colors.white, fontWeight: FontWeight.w700)), const SizedBox(height: 10), Text('Review our full Data Policy, request a Data Export, or delete your account permanently.', style: theme.textTheme.bodyMedium?.copyWith(color: Colors.white70, height: 1.45)), const SizedBox(height: 16), Row(children: [Expanded(child: FilledButton(onPressed: () => _showInfo('Privacy Policy', 'This area explains retention, sharing, and emergency data rules for your account.'), style: FilledButton.styleFrom(backgroundColor: Colors.white, foregroundColor: AppColors.trustNavy), child: const Text('Explore Policies'))), const SizedBox(width: 12), Expanded(child: OutlinedButton(onPressed: () => _showInfo('Export Data', 'Export packages your profile, route history, and safety events into a shareable file.'), style: OutlinedButton.styleFrom(foregroundColor: Colors.white, side: const BorderSide(color: Colors.white24)), child: const Text('Export Data')))])]),
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

class _ToggleCard extends StatelessWidget {
  const _ToggleCard({required this.title, required this.subtitle, required this.value, required this.onChanged});
  final String title;
  final String subtitle;
  final bool value;
  final ValueChanged<bool> onChanged;
  @override
  Widget build(BuildContext context) => Container(padding: const EdgeInsets.all(16), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24)), child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(title, style: Theme.of(context).textTheme.titleMedium?.copyWith(color: AppColors.trustNavy, fontWeight: FontWeight.w700)), const SizedBox(height: 6), Text(subtitle, style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.textSecondary, height: 1.35))])), Switch(value: value, onChanged: onChanged)]));
}

class _RadioRow extends StatelessWidget {
  const _RadioRow({required this.title, required this.subtitle, required this.selected, required this.onTap});
  final String title;
  final String subtitle;
  final bool selected;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) => InkWell(onTap: onTap, child: Row(children: [Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(title, style: Theme.of(context).textTheme.titleMedium?.copyWith(color: AppColors.trustNavy, fontWeight: FontWeight.w700)), const SizedBox(height: 4), Text(subtitle, style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColors.textSecondary))])), Icon(selected ? Icons.radio_button_checked_rounded : Icons.radio_button_off_rounded, color: selected ? AppColors.skyBlue : AppColors.textMuted)]));
}

class _SettingsBottomBar extends StatelessWidget {
  const _SettingsBottomBar({required this.activeIndex});
  final int activeIndex;
  @override
  Widget build(BuildContext context) {
    final items = const [('HOME', Icons.home_filled, '/home'), ('MAP', Icons.map_outlined, '/safety-map/main'), ('TRIPS', Icons.route_outlined, '/trips'), ('SETTINGS', Icons.settings_outlined, '/settings/dashboard')];
    return Container(margin: const EdgeInsets.only(top: 8), padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24)), child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [for (var i = 0; i < items.length; i++) InkWell(onTap: () => context.go(items[i].$3), child: Column(mainAxisSize: MainAxisSize.min, children: [Container(width: 34, height: 34, decoration: BoxDecoration(color: activeIndex == i ? AppColors.trustNavy : Colors.transparent, borderRadius: BorderRadius.circular(12)), child: Icon(items[i].$2, size: 18, color: activeIndex == i ? Colors.white : AppColors.textMuted)), const SizedBox(height: 4), Text(items[i].$1, style: Theme.of(context).textTheme.labelSmall?.copyWith(color: activeIndex == i ? AppColors.trustNavy : AppColors.textMuted, fontWeight: FontWeight.w700))]))]));
  }
}
