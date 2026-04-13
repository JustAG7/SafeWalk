import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../shared/widgets/page_scaffold.dart';

class ServerMaintenanceScreen extends StatelessWidget {
  const ServerMaintenanceScreen({super.key});

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
              Row(children: [const CircleAvatar(radius: 14, backgroundColor: Color(0xFFEAF1FD), child: Icon(Icons.shield_outlined, size: 16, color: AppColors.skyBlue)), const SizedBox(width: 8), Text('SafeWalk', style: theme.textTheme.titleMedium?.copyWith(color: AppColors.trustNavy, fontWeight: FontWeight.w700)), const Spacer(), const CircleAvatar(radius: 14, backgroundColor: Color(0xFFEAF1FD), child: Icon(Icons.build_outlined, size: 16, color: AppColors.skyBlue))]),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.only(top: 16),
                  children: [
                    const CircleAvatar(radius: 36, backgroundColor: Color(0xFFEAF1FD), child: Icon(Icons.memory_rounded, size: 34, color: AppColors.trustNavy)),
                    const SizedBox(height: 18),
                    Text('System\nMaintenance', textAlign: TextAlign.center, style: theme.textTheme.headlineMedium?.copyWith(color: AppColors.trustNavy, fontWeight: FontWeight.w700, height: 1.0)),
                    const SizedBox(height: 12),
                    Text('We\'re upgrading our Guardian AI to better protect you. We\'ll be back online shortly.', textAlign: TextAlign.center, style: theme.textTheme.bodyLarge?.copyWith(color: AppColors.textSecondary, height: 1.45)),
                    const SizedBox(height: 20),
                    Container(padding: const EdgeInsets.all(18), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24)), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('ESTIMATED RETURN', style: theme.textTheme.labelSmall?.copyWith(color: AppColors.textMuted, fontWeight: FontWeight.w700)), const SizedBox(height: 10), RichText(text: TextSpan(style: theme.textTheme.headlineLarge?.copyWith(color: AppColors.trustNavy, fontWeight: FontWeight.w800), children: const [TextSpan(text: '14'), TextSpan(text: ' MIN', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700))])), const SizedBox(height: 12), const LinearProgressIndicator(value: 0.72, minHeight: 8), const SizedBox(height: 18), Container(padding: const EdgeInsets.all(14), decoration: BoxDecoration(color: const Color(0xFFF5F8FC), borderRadius: BorderRadius.circular(18)), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('Manual Guardian Line', style: theme.textTheme.labelMedium?.copyWith(color: AppColors.textMuted, fontWeight: FontWeight.w700)), const SizedBox(height: 10), const _SupportRow(title: 'National SOS', value: '911'), const SizedBox(height: 10), const _SupportRow(title: 'SafeWalk Help', value: '1-800-SAFE-WLK')]))])),
                    const SizedBox(height: 14),
                    Container(padding: const EdgeInsets.all(16), decoration: BoxDecoration(color: const Color(0xFFF3F6FB), borderRadius: BorderRadius.circular(22)), child: Row(children: [Expanded(child: Text('v4.2.0 Deploying\nNeural engine optimizations in progress...', style: theme.textTheme.bodyMedium?.copyWith(color: AppColors.textSecondary, height: 1.4))), OutlinedButton(onPressed: () { showModalBottomSheet<void>(context: context, builder: (context) => SafeArea(child: Padding(padding: const EdgeInsets.fromLTRB(20, 12, 20, 24), child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [Text('Deployment Logs', style: Theme.of(context).textTheme.titleLarge?.copyWith(color: AppColors.trustNavy, fontWeight: FontWeight.w700)), const SizedBox(height: 12), Text('12:41 - Edge nodes draining\n12:43 - Guardian AI patch rolling out\n12:46 - Notification workers restarting', style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.textSecondary, height: 1.5))])))); }, child: const Text('View Logs'))])),
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

class _SupportRow extends StatelessWidget {
  const _SupportRow({required this.title, required this.value});
  final String title;
  final String value;
  @override
  Widget build(BuildContext context) => Row(children: [CircleAvatar(radius: 16, backgroundColor: const Color(0xFFEAF1FD), child: Icon(title.contains('National') ? Icons.local_police_outlined : Icons.support_agent_outlined, size: 16, color: AppColors.skyBlue)), const SizedBox(width: 10), Expanded(child: Text(title, style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.trustNavy, fontWeight: FontWeight.w600))), Text(value, style: Theme.of(context).textTheme.titleMedium?.copyWith(color: AppColors.trustNavy, fontWeight: FontWeight.w700))]);
}

