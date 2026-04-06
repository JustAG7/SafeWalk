import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_colors.dart';
import '../../../shared/widgets/page_scaffold.dart';

class NoInternetConnectivityScreen extends StatelessWidget {
  const NoInternetConnectivityScreen({super.key});

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
              Row(children: [const CircleAvatar(radius: 14, backgroundColor: Color(0xFFEAF1FD), child: Icon(Icons.shield_outlined, size: 16, color: AppColors.skyBlue)), const SizedBox(width: 8), Text('SafeWalk', style: theme.textTheme.titleMedium?.copyWith(color: AppColors.trustNavy, fontWeight: FontWeight.w700)), const Spacer(), const Icon(Icons.more_vert_rounded, color: AppColors.textMuted)]),
              const SizedBox(height: 28),
              Expanded(
                child: ListView(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(22),
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(28)),
                      child: Column(children: [const CircleAvatar(radius: 34, backgroundColor: Color(0xFFEAF1FD), child: Icon(Icons.wifi_off_rounded, size: 30, color: AppColors.skyBlue)), const SizedBox(height: 18), Text('Connection Lost', style: theme.textTheme.headlineMedium?.copyWith(color: AppColors.trustNavy, fontWeight: FontWeight.w700)), const SizedBox(height: 12), Text('SafeWalk is currently offline. Don\'t worry, your SOS local triggers are still active.', textAlign: TextAlign.center, style: theme.textTheme.bodyLarge?.copyWith(color: AppColors.textSecondary, height: 1.45)), const SizedBox(height: 18), const Row(children: [Expanded(child: _StateBadge(title: 'LOCAL SOS', value: 'Active', good: true)), SizedBox(width: 10), Expanded(child: _StateBadge(title: 'OFFLINE GPS', value: 'Tracking', good: true))]), const SizedBox(height: 18), SizedBox(width: double.infinity, height: 52, child: FilledButton.icon(onPressed: () {}, icon: const Icon(Icons.refresh_rounded), label: const Text('Retry Connection'))), const SizedBox(height: 10), SizedBox(width: double.infinity, height: 50, child: OutlinedButton.icon(onPressed: () => context.go('/setup/contacts'), icon: const Icon(Icons.contact_phone_outlined), label: const Text('Emergency Contacts'))), const SizedBox(height: 16), Container(padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8), decoration: BoxDecoration(color: const Color(0xFFFFF1F1), borderRadius: BorderRadius.circular(999)), child: Text('Guardian Active Offline', style: theme.textTheme.labelSmall?.copyWith(color: AppColors.emergencyRed, fontWeight: FontWeight.w700)))]),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _StateBadge extends StatelessWidget {
  const _StateBadge({required this.title, required this.value, this.good = false});
  final String title;
  final String value;
  final bool good;
  @override
  Widget build(BuildContext context) => Container(padding: const EdgeInsets.all(14), decoration: BoxDecoration(color: const Color(0xFFF5F8FC), borderRadius: BorderRadius.circular(18)), child: Column(children: [Icon(good ? Icons.check_circle_rounded : Icons.info_outline_rounded, color: good ? AppColors.safeGreen : AppColors.textMuted, size: 18), const SizedBox(height: 8), Text(title, style: Theme.of(context).textTheme.labelSmall?.copyWith(color: AppColors.textMuted, fontWeight: FontWeight.w700)), const SizedBox(height: 4), Text(value, style: Theme.of(context).textTheme.titleSmall?.copyWith(color: AppColors.trustNavy, fontWeight: FontWeight.w700))]));
}
