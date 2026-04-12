import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_colors.dart';
import '../../../shared/widgets/page_scaffold.dart';

class GpsSignalLostScreen extends StatelessWidget {
  const GpsSignalLostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    void showSignalRecoveryTips() {
      showModalBottomSheet<void>(
        context: context,
        showDragHandle: true,
        builder: (sheetContext) => SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Recovery tips', style: theme.textTheme.titleLarge?.copyWith(color: AppColors.trustNavy, fontWeight: FontWeight.w700)),
                const SizedBox(height: 8),
                Text('Move toward an open street edge, avoid dense cover, and keep the phone screen active for a few seconds so location can re-center.', style: theme.textTheme.bodyMedium?.copyWith(color: AppColors.textSecondary, height: 1.45)),
              ],
            ),
          ),
        ),
      );
    }
    return PageScaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 10),
          child: Column(
            children: [
              Row(children: [const CircleAvatar(radius: 14, backgroundColor: Color(0xFFEAF1FD), child: Icon(Icons.shield_outlined, size: 16, color: AppColors.skyBlue)), const SizedBox(width: 8), Text('SafeWalk', style: theme.textTheme.titleMedium?.copyWith(color: AppColors.trustNavy, fontWeight: FontWeight.w700)), const Spacer(), const Icon(Icons.notifications_none_rounded, color: AppColors.textMuted), const SizedBox(width: 8), const Icon(Icons.warning_amber_rounded, color: AppColors.textMuted)]),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.only(top: 14),
                  children: [
                    const CircleAvatar(radius: 32, backgroundColor: Color(0xFFFFE8E8), child: Icon(Icons.gps_off_rounded, color: AppColors.emergencyRed)),
                    const SizedBox(height: 14),
                    Text('GPS Signal Weak', textAlign: TextAlign.center, style: theme.textTheme.headlineMedium?.copyWith(color: AppColors.trustNavy, fontWeight: FontWeight.w700)),
                    const SizedBox(height: 10),
                    Text('We\'ve lost your precise location. Try moving to an open area or stay on well-lit streets.', textAlign: TextAlign.center, style: theme.textTheme.bodyLarge?.copyWith(color: AppColors.textSecondary, height: 1.45)),
                    const SizedBox(height: 18),
                    InkWell(
                      onTap: showSignalRecoveryTips,
                      borderRadius: BorderRadius.circular(24),
                      child: Container(height: 164, decoration: BoxDecoration(color: const Color(0xFFE1E5EA), borderRadius: BorderRadius.circular(24)), child: const Center(child: CircleAvatar(radius: 18, backgroundColor: Color(0xFFEAF1FD), child: Icon(Icons.place_outlined, color: AppColors.skyBlue)))),
                    ),
                    const SizedBox(height: 14),
                    Row(children: [Expanded(child: Text('Current Status\nRe-establishing connection...', style: theme.textTheme.bodyMedium?.copyWith(color: AppColors.textSecondary, height: 1.4))), Text('Signal\nLost', textAlign: TextAlign.right, style: theme.textTheme.titleMedium?.copyWith(color: AppColors.emergencyRed, fontWeight: FontWeight.w700))]),
                    const SizedBox(height: 18),
                    SizedBox(width: double.infinity, height: 54, child: FilledButton.icon(onPressed: () => context.go('/trip-live/im-fine'), icon: const Icon(Icons.check_circle_outline_rounded), label: const Text('I\'m Safe'))),
                    const SizedBox(height: 12),
                    SizedBox(width: double.infinity, height: 54, child: FilledButton(onPressed: () => context.go('/trip-live/need-help'), style: FilledButton.styleFrom(backgroundColor: AppColors.emergencyRed), child: const Text('Call Emergency'))),
                    const SizedBox(height: 14),
                    Row(children: [Expanded(child: _HintCard(title: 'Stay near light', subtitle: 'Better visibility and potential assistance.', onTap: showSignalRecoveryTips)), const SizedBox(width: 12), Expanded(child: _HintCard(title: 'Open spaces', subtitle: 'Helps satellite visibility for GPS reset.', onTap: showSignalRecoveryTips))]),
                  ],
                ),
              ),
              const _BottomBar(activeIndex: 1),
            ],
          ),
        ),
      ),
    );
  }
}

class _HintCard extends StatelessWidget {
  const _HintCard({required this.title, required this.subtitle, this.onTap});
  final String title;
  final String subtitle;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) => InkWell(onTap: onTap, borderRadius: BorderRadius.circular(18), child: Container(padding: const EdgeInsets.all(14), decoration: BoxDecoration(color: const Color(0xFFF2F5FA), borderRadius: BorderRadius.circular(18)), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(title, style: Theme.of(context).textTheme.titleSmall?.copyWith(color: AppColors.trustNavy, fontWeight: FontWeight.w700)), const SizedBox(height: 6), Text(subtitle, style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColors.textSecondary, height: 1.35))])));
}

class _BottomBar extends StatelessWidget {
  const _BottomBar({required this.activeIndex});
  final int activeIndex;
  @override
  Widget build(BuildContext context) {
    final items = const [('HOME', Icons.home_filled, '/home'), ('MAP', Icons.map_outlined, '/safety-map/main'), ('TRIPS', Icons.route_outlined, '/trips'), ('SETTINGS', Icons.settings_outlined, '/settings/dashboard')];
    return Container(margin: const EdgeInsets.only(top: 8), padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24)), child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [for (var i = 0; i < items.length; i++) InkWell(onTap: () => context.go(items[i].$3), child: Column(mainAxisSize: MainAxisSize.min, children: [Container(width: 34, height: 34, decoration: BoxDecoration(color: activeIndex == i ? AppColors.trustNavy : Colors.transparent, borderRadius: BorderRadius.circular(12)), child: Icon(items[i].$2, size: 18, color: activeIndex == i ? Colors.white : AppColors.textMuted)), const SizedBox(height: 4), Text(items[i].$1, style: Theme.of(context).textTheme.labelSmall?.copyWith(color: activeIndex == i ? AppColors.trustNavy : AppColors.textMuted, fontWeight: FontWeight.w700))]))]));
  }
}
