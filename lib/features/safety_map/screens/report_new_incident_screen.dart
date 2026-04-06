import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_colors.dart';
import '../../../shared/widgets/page_scaffold.dart';

class ReportNewIncidentScreen extends StatelessWidget {
  const ReportNewIncidentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return PageScaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
          child: Column(
            children: [
              Row(children: [IconButton(onPressed: () => context.go('/safety-map/main'), icon: const Icon(Icons.close_rounded, color: AppColors.trustNavy)), Expanded(child: Text('SAFEWALK', textAlign: TextAlign.center, style: theme.textTheme.titleMedium?.copyWith(color: AppColors.trustNavy, fontWeight: FontWeight.w800, letterSpacing: 1))), const CircleAvatar(radius: 15, backgroundColor: Color(0xFFEAD3B8), child: Icon(Icons.person, size: 15, color: AppColors.trustNavy))]),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.only(top: 10),
                  children: [
                    Text('SAFETY REPORTING', style: theme.textTheme.labelSmall?.copyWith(color: AppColors.skyBlue, fontWeight: FontWeight.w700)),
                    const SizedBox(height: 8),
                    Text('Report New Incident', style: theme.textTheme.headlineMedium?.copyWith(color: AppColors.trustNavy, fontWeight: FontWeight.w700)),
                    const SizedBox(height: 10),
                    Text('Help keep the community safe by sharing real-time updates. Your report contributes to our collective safety map.', style: theme.textTheme.bodyLarge?.copyWith(color: AppColors.textSecondary, height: 1.45)),
                    const SizedBox(height: 20),
                    Text('TYPE OF INCIDENT', style: theme.textTheme.labelSmall?.copyWith(color: AppColors.textMuted, fontWeight: FontWeight.w700)),
                    const SizedBox(height: 10),
                    const Wrap(spacing: 12, runSpacing: 12, children: [
                      _IncidentType(text: 'Poor Lighting', icon: Icons.lightbulb_outline),
                      _IncidentType(text: 'Suspicious Activity', icon: Icons.visibility_outlined, active: true),
                      _IncidentType(text: 'Construction', icon: Icons.construction_outlined),
                      _IncidentType(text: 'Obstacle', icon: Icons.warning_amber_rounded),
                      _IncidentType(text: 'Crowd', icon: Icons.groups_outlined),
                      _IncidentType(text: 'Other', icon: Icons.more_horiz_rounded),
                    ]),
                    const SizedBox(height: 20),
                    Text('LOCATION', style: theme.textTheme.labelSmall?.copyWith(color: AppColors.textMuted, fontWeight: FontWeight.w700)),
                    const SizedBox(height: 10),
                    Container(height: 138, decoration: BoxDecoration(color: const Color(0xFFE6EBF3), borderRadius: BorderRadius.circular(24)), child: const Center(child: CircleAvatar(radius: 18, backgroundColor: Color(0xFFEAF1FD), child: Icon(Icons.place_outlined, color: AppColors.skyBlue)))),
                    const SizedBox(height: 10),
                    Row(children: [Expanded(child: Text('Valencia St & 16th St, San Francisco', style: theme.textTheme.bodyMedium?.copyWith(color: AppColors.trustNavy, fontWeight: FontWeight.w600))), Text('CHANGE', style: theme.textTheme.labelSmall?.copyWith(color: AppColors.skyBlue, fontWeight: FontWeight.w700))]),
                    const SizedBox(height: 20),
                    Text('DESCRIPTION', style: theme.textTheme.labelSmall?.copyWith(color: AppColors.textMuted, fontWeight: FontWeight.w700)),
                    const SizedBox(height: 10),
                    Container(padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 18), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(22)), child: const Text('Tell us more about what you see...', style: TextStyle(color: AppColors.textMuted))),
                    const SizedBox(height: 20),
                    Text('ADD PHOTOS', style: theme.textTheme.labelSmall?.copyWith(color: AppColors.textMuted, fontWeight: FontWeight.w700)),
                    const SizedBox(height: 10),
                    Row(children: const [_UploadTile(), SizedBox(width: 12), _PreviewTile()]),
                  ],
                ),
              ),
              SizedBox(width: double.infinity, height: 56, child: FilledButton(onPressed: () => context.go('/safety-map/report-confirmation'), child: const Text('Submit Report'))),
              const SizedBox(height: 8),
              Text('Reports are shared anonymously by default', style: theme.textTheme.labelSmall?.copyWith(color: AppColors.textMuted)),
              const SizedBox(height: 8),
              const _BottomBar(activeIndex: 1),
            ],
          ),
        ),
      ),
    );
  }
}

class _IncidentType extends StatelessWidget {
  const _IncidentType({required this.text, required this.icon, this.active = false});
  final String text;
  final IconData icon;
  final bool active;
  @override
  Widget build(BuildContext context) => Container(width: 140, padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14), decoration: BoxDecoration(color: active ? const Color(0xFFEAF1FD) : Colors.white, borderRadius: BorderRadius.circular(18), border: Border.all(color: active ? AppColors.skyBlue : const Color(0xFFE1E8F2))), child: Column(children: [Icon(icon, color: active ? AppColors.skyBlue : AppColors.textSecondary), const SizedBox(height: 8), Text(text, textAlign: TextAlign.center, style: Theme.of(context).textTheme.labelMedium?.copyWith(color: AppColors.trustNavy, fontWeight: FontWeight.w700))]));
}

class _UploadTile extends StatelessWidget {
  const _UploadTile();
  @override
  Widget build(BuildContext context) => Container(width: 78, height: 78, decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(18), border: Border.all(color: const Color(0xFFDDE5F0), style: BorderStyle.solid)), child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [const Icon(Icons.add_a_photo_outlined, color: AppColors.textMuted), const SizedBox(height: 6), Text('Upload', style: Theme.of(context).textTheme.labelSmall?.copyWith(color: AppColors.textMuted, fontWeight: FontWeight.w700))]));
}

class _PreviewTile extends StatelessWidget {
  const _PreviewTile();
  @override
  Widget build(BuildContext context) => Container(width: 78, height: 78, decoration: BoxDecoration(borderRadius: BorderRadius.circular(18), gradient: const LinearGradient(colors: [Color(0xFF161A20), Color(0xFF3B342A)])));
}

class _BottomBar extends StatelessWidget {
  const _BottomBar({required this.activeIndex});
  final int activeIndex;
  @override
  Widget build(BuildContext context) {
    final items = const [('HOME', Icons.home_filled, '/home'), ('MAP', Icons.map_outlined, '/safety-map/main'), ('TRIPS', Icons.route_outlined, '/trips'), ('SETTINGS', Icons.settings_outlined, '/settings')];
    return Container(margin: const EdgeInsets.symmetric(horizontal: 12), padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24)), child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [for (var i = 0; i < items.length; i++) InkWell(onTap: () => context.go(items[i].$3), child: Column(mainAxisSize: MainAxisSize.min, children: [Container(width: 34, height: 34, decoration: BoxDecoration(color: activeIndex == i ? AppColors.trustNavy : Colors.transparent, borderRadius: BorderRadius.circular(12)), child: Icon(items[i].$2, size: 18, color: activeIndex == i ? Colors.white : AppColors.textMuted)), const SizedBox(height: 4), Text(items[i].$1, style: Theme.of(context).textTheme.labelSmall?.copyWith(color: activeIndex == i ? AppColors.trustNavy : AppColors.textMuted, fontWeight: FontWeight.w700))]))]));
  }
}
