import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_colors.dart';
import '../../../shared/widgets/page_scaffold.dart';

class PermissionDeniedScreen extends StatelessWidget {
  const PermissionDeniedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    void showPermissionWhySheet() {
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
                Text('Why these permissions matter', style: theme.textTheme.titleLarge?.copyWith(color: AppColors.trustNavy, fontWeight: FontWeight.w700)),
                const SizedBox(height: 8),
                Text('Location keeps route monitoring accurate, while notifications ensure that check-ins and SOS confirmations still reach you when the app is not in front.', style: theme.textTheme.bodyMedium?.copyWith(color: AppColors.textSecondary, height: 1.45)),
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
              Row(children: [const CircleAvatar(radius: 14, backgroundColor: Color(0xFFEAF1FD), child: Icon(Icons.shield_outlined, size: 16, color: AppColors.skyBlue)), const SizedBox(width: 8), Text('SafeWalk', style: theme.textTheme.titleMedium?.copyWith(color: AppColors.trustNavy, fontWeight: FontWeight.w700)), const Spacer(), const Icon(Icons.close_rounded, color: AppColors.textMuted)]),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.only(top: 20),
                  children: [
                    const CircleAvatar(radius: 30, backgroundColor: Color(0xFFFFF0F0), child: Icon(Icons.shield_outlined, color: AppColors.emergencyRed)),
                    const SizedBox(height: 18),
                    Text('Permissions Required', textAlign: TextAlign.center, style: theme.textTheme.headlineMedium?.copyWith(color: AppColors.trustNavy, fontWeight: FontWeight.w700)),
                    const SizedBox(height: 10),
                    Text('To keep you safe, SafeWalk needs access to your Location and Notifications.', textAlign: TextAlign.center, style: theme.textTheme.bodyLarge?.copyWith(color: AppColors.textSecondary, height: 1.45)),
                    const SizedBox(height: 18),
                    const _PermissionRow(title: 'Location Services', subtitle: 'Always Allow'),
                    const SizedBox(height: 12),
                    const _PermissionRow(title: 'Notifications', subtitle: 'Push Alerts'),
                    const SizedBox(height: 18),
                    InkWell(onTap: showPermissionWhySheet, borderRadius: BorderRadius.circular(22), child: Container(padding: const EdgeInsets.all(16), decoration: BoxDecoration(color: const Color(0xFFF3F6FB), borderRadius: BorderRadius.circular(22)), child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [const CircleAvatar(radius: 18, backgroundColor: Color(0xFFEAF1FD), child: Icon(Icons.info_outline_rounded, color: AppColors.skyBlue)), const SizedBox(width: 12), Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('Why this matters', style: theme.textTheme.titleMedium?.copyWith(color: AppColors.trustNavy, fontWeight: FontWeight.w700)), const SizedBox(height: 6), Text('Background tracking ensures help reaches you even if you can\'t reach your phone. We only monitor your location during an active trip or if an SOS is triggered.', style: theme.textTheme.bodyMedium?.copyWith(color: AppColors.textSecondary, height: 1.4))]))]))),
                    const SizedBox(height: 20),
                    SizedBox(width: double.infinity, height: 54, child: FilledButton(onPressed: () => context.go('/setup/permissions'), child: const Text('Open System Settings'))),
                    const SizedBox(height: 10),
                    Center(child: TextButton(onPressed: () => context.go('/home'), child: const Text('Maybe Later'))),
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

class _PermissionRow extends StatelessWidget {
  const _PermissionRow({required this.title, required this.subtitle});
  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) => Container(padding: const EdgeInsets.all(16), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(22)), child: Row(children: [CircleAvatar(radius: 18, backgroundColor: const Color(0xFFEAF1FD), child: Icon(title.contains('Location') ? Icons.location_on_outlined : Icons.notifications_none_rounded, size: 18, color: AppColors.skyBlue)), const SizedBox(width: 12), Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(title, style: Theme.of(context).textTheme.titleMedium?.copyWith(color: AppColors.trustNavy, fontWeight: FontWeight.w700)), const SizedBox(height: 4), Text(subtitle, style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColors.textSecondary))])), const Icon(Icons.close_rounded, color: AppColors.emergencyRed)]));
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
