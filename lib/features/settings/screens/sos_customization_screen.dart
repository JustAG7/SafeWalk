import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_colors.dart';
import '../../../shared/widgets/page_scaffold.dart';

class SosCustomizationScreen extends StatelessWidget {
  const SosCustomizationScreen({super.key});

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
              Row(children: [IconButton(onPressed: () => context.go('/settings/dashboard'), icon: const Icon(Icons.arrow_back_rounded, color: AppColors.trustNavy)), Text('SOS Customization', style: theme.textTheme.titleMedium?.copyWith(color: AppColors.trustNavy, fontWeight: FontWeight.w700)), const Spacer(), const CircleAvatar(radius: 15, backgroundColor: Color(0xFFEAF1FD), child: Icon(Icons.shield_outlined, size: 16, color: AppColors.skyBlue))]),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.only(top: 8),
                  children: [
                    Text('Critical Response Setup', style: theme.textTheme.headlineMedium?.copyWith(color: AppColors.trustNavy, fontWeight: FontWeight.w700)),
                    const SizedBox(height: 10),
                    Text('Customize how SafeWalk responds during an emergency. These settings bridge the gap between detection and immediate action.', style: theme.textTheme.bodyLarge?.copyWith(color: AppColors.textSecondary, height: 1.45)),
                    const SizedBox(height: 20),
                    Text('ACTIVATION FLOW', style: theme.textTheme.labelSmall?.copyWith(color: AppColors.skyBlue, fontWeight: FontWeight.w700)),
                    const SizedBox(height: 10),
                    Container(padding: const EdgeInsets.all(16), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24)), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('Countdown Timer', style: theme.textTheme.titleMedium?.copyWith(color: AppColors.trustNavy, fontWeight: FontWeight.w700)), const SizedBox(height: 6), Text('Delay before SOS protocol initiates', style: theme.textTheme.bodySmall?.copyWith(color: AppColors.textSecondary)), const SizedBox(height: 12), Row(children: const [_TimeChip(text: '3s', active: true), SizedBox(width: 8), _TimeChip(text: '5s'), SizedBox(width: 8), _TimeChip(text: '10s')])])),
                    const SizedBox(height: 12),
                    const _ToggleTile(title: 'Double-tap Volume', subtitle: 'Triggers even when screen is off', value: true),
                    const SizedBox(height: 12),
                    const _ToggleTile(title: 'Triple-tap Lock', subtitle: 'Discreet mechanical trigger', value: false),
                    const SizedBox(height: 18),
                    Text('ALERT BEHAVIOR', style: theme.textTheme.labelSmall?.copyWith(color: AppColors.skyBlue, fontWeight: FontWeight.w700)),
                    const SizedBox(height: 10),
                    const _ToggleTile(title: 'Silent Alarm', subtitle: 'No visual or audio cues on device', value: false),
                    const SizedBox(height: 12),
                    const _ToggleTile(title: 'Siren Sound', subtitle: 'Max-volume high-frequency deterrent', value: true),
                    const SizedBox(height: 12),
                    const _ToggleTile(title: 'Flashlight Strobe', subtitle: 'Pulsing light to attract attention', value: true),
                    const SizedBox(height: 18),
                    Text('AUTOMATED NETWORKING', style: theme.textTheme.labelSmall?.copyWith(color: AppColors.skyBlue, fontWeight: FontWeight.w700)),
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(color: AppColors.trustNavy, borderRadius: BorderRadius.circular(24)),
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Row(children: [CircleAvatar(radius: 18, backgroundColor: Colors.white.withOpacity(0.1), child: const Icon(Icons.call_outlined, color: Colors.white, size: 18)), const SizedBox(width: 10), Expanded(child: Text('Auto-call Primary Guardian', style: theme.textTheme.titleMedium?.copyWith(color: Colors.white, fontWeight: FontWeight.w700))), Switch(value: true, onChanged: (_) {})]), const SizedBox(height: 6), Text('Initiates a hands-free call to Alex Guardian', style: theme.textTheme.bodySmall?.copyWith(color: Colors.white70)), const SizedBox(height: 14), Container(padding: const EdgeInsets.all(14), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(18)), child: Row(children: [const Icon(Icons.location_on_outlined, color: AppColors.skyBlue), const SizedBox(width: 10), Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('Auto-SMS Circle', style: theme.textTheme.titleMedium?.copyWith(color: AppColors.trustNavy, fontWeight: FontWeight.w700)), const SizedBox(height: 4), Text('Live location sent to "Night Owl" circle', style: theme.textTheme.bodySmall?.copyWith(color: AppColors.textSecondary))])), Switch(value: true, onChanged: (_) {})]))]),
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

class _TimeChip extends StatelessWidget {
  const _TimeChip({required this.text, this.active = false});
  final String text;
  final bool active;
  @override
  Widget build(BuildContext context) => Container(padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10), decoration: BoxDecoration(color: active ? AppColors.trustNavy : const Color(0xFFF3F6FB), borderRadius: BorderRadius.circular(14)), child: Text(text, style: Theme.of(context).textTheme.labelMedium?.copyWith(color: active ? Colors.white : AppColors.trustNavy, fontWeight: FontWeight.w700)));
}

class _ToggleTile extends StatelessWidget {
  const _ToggleTile({required this.title, required this.subtitle, required this.value});
  final String title;
  final String subtitle;
  final bool value;
  @override
  Widget build(BuildContext context) => Container(padding: const EdgeInsets.all(16), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24)), child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(title, style: Theme.of(context).textTheme.titleMedium?.copyWith(color: AppColors.trustNavy, fontWeight: FontWeight.w700)), const SizedBox(height: 6), Text(subtitle, style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.textSecondary, height: 1.35))])), Switch(value: value, onChanged: (_) {})]));
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
