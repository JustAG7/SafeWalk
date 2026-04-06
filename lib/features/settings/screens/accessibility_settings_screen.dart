import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_colors.dart';
import '../../../shared/widgets/page_scaffold.dart';

class AccessibilitySettingsScreen extends StatelessWidget {
  const AccessibilitySettingsScreen({super.key});

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
              Row(children: [IconButton(onPressed: () => context.go('/settings/dashboard'), icon: const Icon(Icons.arrow_back_rounded, color: AppColors.trustNavy)), Text('SafeWalk', style: theme.textTheme.titleMedium?.copyWith(color: AppColors.trustNavy, fontWeight: FontWeight.w700))]),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.only(top: 10),
                  children: [
                    Text('SETTINGS • PHASE 11', style: theme.textTheme.labelSmall?.copyWith(color: AppColors.skyBlue, fontWeight: FontWeight.w700)),
                    const SizedBox(height: 8),
                    Text('Accessibility Center', style: theme.textTheme.headlineMedium?.copyWith(color: AppColors.trustNavy, fontWeight: FontWeight.w700)),
                    const SizedBox(height: 10),
                    Text('Customize your SafeWalk experience to fit your specific needs. We believe safety should be effortless and accessible for everyone.', style: theme.textTheme.bodyLarge?.copyWith(color: AppColors.textSecondary, height: 1.45)),
                    const SizedBox(height: 20),
                    _SectionCard(
                      title: 'Visual Interface',
                      icon: Icons.visibility_outlined,
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Row(children: [Text('TEXT SIZE', style: theme.textTheme.labelSmall?.copyWith(color: AppColors.textMuted, fontWeight: FontWeight.w700)), const Spacer(), Text('Large (120%)', style: theme.textTheme.labelMedium?.copyWith(color: AppColors.trustNavy, fontWeight: FontWeight.w700))]),
                        Slider(value: 0.72, onChanged: (_) {}),
                        const _ToggleRow(title: 'High Contrast Mode', subtitle: 'Boosts color contrast for maximum legibility.', value: false),
                        const SizedBox(height: 12),
                        const _ToggleRow(title: 'Dark Mode', subtitle: 'Reduces eye strain in low-light environments.', value: true),
                      ]),
                    ),
                    const SizedBox(height: 16),
                    _SectionCard(
                      title: 'Physical',
                      icon: Icons.accessibility_new_rounded,
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Text('HAPTIC FEEDBACK', style: theme.textTheme.labelSmall?.copyWith(color: AppColors.textMuted, fontWeight: FontWeight.w700)),
                        const SizedBox(height: 10),
                        Row(children: const [_ChoiceChip(text: 'SOFT'), SizedBox(width: 8), _ChoiceChip(text: 'MED', active: true), SizedBox(width: 8), _ChoiceChip(text: 'STRICT')]),
                        const SizedBox(height: 16),
                        Text('SOS BUTTON SENSITIVITY', style: theme.textTheme.labelSmall?.copyWith(color: AppColors.textMuted, fontWeight: FontWeight.w700)),
                        const SizedBox(height: 10),
                        Container(padding: const EdgeInsets.all(14), decoration: BoxDecoration(color: const Color(0xFFF4F7FB), borderRadius: BorderRadius.circular(18)), child: Text('Require a 3-second hold to prevent accidental activation during walks.', style: theme.textTheme.bodyMedium?.copyWith(color: AppColors.textSecondary, height: 1.35))),
                        const SizedBox(height: 16),
                        ListTile(contentPadding: EdgeInsets.zero, title: const Text('Button Press Intensity'), trailing: const Icon(Icons.chevron_right_rounded, color: AppColors.textMuted)),
                      ]),
                    ),
                    const SizedBox(height: 16),
                    _SectionCard(
                      title: 'Audio & Guidance',
                      icon: Icons.record_voice_over_outlined,
                      child: const Column(children: [
                        _ToggleRow(title: 'Voice-Guided Navigation', subtitle: 'Step-by-step audio instructions for safer walking paths.', value: true),
                        SizedBox(height: 12),
                        _ToggleRow(title: 'Companion Audio Prompts', subtitle: 'Subtle whispers notifying you of safety zone exits.', value: false),
                        SizedBox(height: 12),
                        _ToggleRow(title: 'Screen Reader Support', subtitle: 'Optimized semantics for TalkBack and VoiceOver users.', value: true),
                      ]),
                    ),
                    const SizedBox(height: 16),
                    Container(padding: const EdgeInsets.all(20), decoration: BoxDecoration(borderRadius: BorderRadius.circular(24), gradient: const LinearGradient(colors: [Color(0xFF6A7C8F), Color(0xFFE7EDF5)])), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('Designed for Every Walk', style: theme.textTheme.headlineSmall?.copyWith(color: Colors.white, fontWeight: FontWeight.w700)), const SizedBox(height: 8), Text('SafeWalk adaptively learns from your accessibility preferences to optimize safety alerts.', style: theme.textTheme.bodyMedium?.copyWith(color: Colors.white70, height: 1.4))])),
                    const SizedBox(height: 20),
                    SizedBox(width: double.infinity, height: 56, child: FilledButton(onPressed: () => context.go('/settings/dashboard'), child: const Text('Save & Apply Changes'))),
                    const SizedBox(height: 8),
                    Center(child: TextButton(onPressed: () {}, child: const Text('Restore Default Settings'))),
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

class _SectionCard extends StatelessWidget {
  const _SectionCard({required this.title, required this.icon, required this.child});
  final String title;
  final IconData icon;
  final Widget child;
  @override
  Widget build(BuildContext context) => Container(padding: const EdgeInsets.all(16), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24)), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Row(children: [CircleAvatar(radius: 18, backgroundColor: const Color(0xFFEAF1FD), child: Icon(icon, size: 18, color: AppColors.skyBlue)), const SizedBox(width: 10), Text(title, style: Theme.of(context).textTheme.titleLarge?.copyWith(color: AppColors.trustNavy, fontWeight: FontWeight.w700))]), const SizedBox(height: 16), child]));
}

class _ToggleRow extends StatelessWidget {
  const _ToggleRow({required this.title, required this.subtitle, required this.value});
  final String title;
  final String subtitle;
  final bool value;
  @override
  Widget build(BuildContext context) => Container(padding: const EdgeInsets.all(14), decoration: BoxDecoration(color: const Color(0xFFF9FBFD), borderRadius: BorderRadius.circular(18)), child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(title, style: Theme.of(context).textTheme.titleMedium?.copyWith(color: AppColors.trustNavy, fontWeight: FontWeight.w700)), const SizedBox(height: 4), Text(subtitle, style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.textSecondary, height: 1.35))])), Switch(value: value, onChanged: (_) {})]));
}

class _ChoiceChip extends StatelessWidget {
  const _ChoiceChip({required this.text, this.active = false});
  final String text;
  final bool active;
  @override
  Widget build(BuildContext context) => Container(padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12), decoration: BoxDecoration(color: active ? AppColors.trustNavy : const Color(0xFFF3F6FB), borderRadius: BorderRadius.circular(14)), child: Text(text, style: Theme.of(context).textTheme.labelMedium?.copyWith(color: active ? Colors.white : AppColors.trustNavy, fontWeight: FontWeight.w700)));
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
