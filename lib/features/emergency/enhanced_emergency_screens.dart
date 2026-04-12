import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/constants/app_colors.dart';
import '../../shared/widgets/page_scaffold.dart';

class EmergencyAlertSentScreen extends StatelessWidget {
  const EmergencyAlertSentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    void showDispatchStatus() {
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
                Text('Police dispatch status', style: theme.textTheme.titleLarge?.copyWith(color: AppColors.trustNavy, fontWeight: FontWeight.w700)),
                const SizedBox(height: 8),
                Text('Unit 4823-B acknowledged your alert and is moving through the closest verified response corridor.', style: theme.textTheme.bodyMedium?.copyWith(color: AppColors.textSecondary, height: 1.45)),
              ],
            ),
          ),
        ),
      );
    }
    void showTransmissionDetails() {
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
                Text('Transmission details', style: theme.textTheme.titleLarge?.copyWith(color: AppColors.trustNavy, fontWeight: FontWeight.w700)),
                const SizedBox(height: 8),
                Text('Emergency packet delivered to local responders, guardian network, and evidence logging stream.', style: theme.textTheme.bodyMedium?.copyWith(color: AppColors.textSecondary, height: 1.45)),
                const SizedBox(height: 18),
                const _InfoRow(icon: Icons.location_searching_outlined, title: 'Location Ping', subtitle: 'Last updated 14 seconds ago'),
                const SizedBox(height: 12),
                const _InfoRow(icon: Icons.people_outline, title: 'Guardian Reach', subtitle: '5 guardians acknowledged alert'),
              ],
            ),
          ),
        ),
      );
    }

    return PageScaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              color: AppColors.emergencyRed,
              child: Row(children: [const Icon(Icons.warning_amber_rounded, color: Colors.white), const SizedBox(width: 8), Text('Emergency Active', style: theme.textTheme.titleSmall?.copyWith(color: Colors.white, fontWeight: FontWeight.w700)), const Spacer(), const Icon(Icons.sensors_rounded, color: Colors.white, size: 18)]),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.fromLTRB(18, 18, 18, 16),
                children: [
                  const Center(child: CircleAvatar(radius: 62, backgroundColor: AppColors.emergencyRed, child: Icon(Icons.check_rounded, color: Colors.white, size: 44))),
                  const SizedBox(height: 18),
                  Text('Transmission Confirmed', textAlign: TextAlign.center, style: theme.textTheme.labelLarge?.copyWith(color: AppColors.emergencyRed, fontWeight: FontWeight.w700)),
                  const SizedBox(height: 6),
                  Text('SOS Sent', textAlign: TextAlign.center, style: theme.textTheme.displaySmall?.copyWith(color: AppColors.trustNavy, fontWeight: FontWeight.w800)),
                  const SizedBox(height: 12),
                  Text('Emergency services and your 5 guardians have been notified of your live location.', textAlign: TextAlign.center, style: theme.textTheme.bodyLarge?.copyWith(color: AppColors.textSecondary, height: 1.45)),
                  const SizedBox(height: 20),
                  InkWell(
                    onTap: showDispatchStatus,
                    borderRadius: BorderRadius.circular(22),
                    child: Container(
                      padding: const EdgeInsets.all(18),
                      decoration: BoxDecoration(color: const Color(0xFFFDEAEA), borderRadius: BorderRadius.circular(22)),
                      child: Row(children: [const Icon(Icons.local_police_outlined, color: AppColors.emergencyRed), const SizedBox(width: 12), Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('Police Dispatched', style: theme.textTheme.titleMedium?.copyWith(color: AppColors.emergencyRed, fontWeight: FontWeight.w700)), const SizedBox(height: 4), Text('ETA: 4 minutes • Unit 4823-B', style: theme.textTheme.bodySmall?.copyWith(color: AppColors.textSecondary))]))]),
                    ),
                  ),
                  const SizedBox(height: 14),
                  InkWell(onTap: showTransmissionDetails, borderRadius: BorderRadius.circular(22), child: const _InfoRow(icon: Icons.mic_none_rounded, title: 'Audio Recording', subtitle: 'Uploading live evidence')),
                  const SizedBox(height: 12),
                  InkWell(onTap: showTransmissionDetails, borderRadius: BorderRadius.circular(22), child: const _InfoRow(icon: Icons.shield_outlined, title: 'Guardian Tracking', subtitle: '5 active viewers')),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 14),
              child: Row(children: [Expanded(child: FilledButton(onPressed: () => context.go('/trip-live'), style: FilledButton.styleFrom(backgroundColor: const Color(0xFF111A2B), foregroundColor: Colors.white), child: const Text('Cancel SOS'))), const SizedBox(width: 12), Expanded(child: FilledButton(onPressed: () => context.go('/emergency/hotline'), style: FilledButton.styleFrom(backgroundColor: AppColors.emergencyRed), child: const Text('Contact Police')))]),
            ),
          ],
        ),
      ),
    );
  }
}

class PriorityContactAutoCallScreen extends StatelessWidget {
  const PriorityContactAutoCallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    void showGuardianProtocol() {
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
                Text('Primary guardian protocol', style: theme.textTheme.titleLarge?.copyWith(color: AppColors.trustNavy, fontWeight: FontWeight.w700)),
                const SizedBox(height: 8),
                Text('Sarah is first in your escalation chain, so the app tries her secure line before switching to public dispatch if needed.', style: theme.textTheme.bodyMedium?.copyWith(color: AppColors.textSecondary, height: 1.45)),
              ],
            ),
          ),
        ),
      );
    }
    void showFeedback(String message) {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(SnackBar(content: Text(message)));
    }

    return PageScaffold(
      safeArea: false,
      body: Container(
        decoration: const BoxDecoration(gradient: LinearGradient(colors: [Color(0xFF180406), Color(0xFF090103)], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: SafeArea(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                color: AppColors.emergencyRed,
                child: Row(children: [const Icon(Icons.warning_amber_rounded, color: Colors.white), const SizedBox(width: 8), Text('Emergency Active', style: theme.textTheme.titleSmall?.copyWith(color: Colors.white, fontWeight: FontWeight.w700)), const Spacer(), const Icon(Icons.sensors_rounded, color: Colors.white, size: 18)]),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 24, 20, 16),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: showGuardianProtocol,
                        customBorder: const CircleBorder(),
                        child: Container(width: 144, height: 144, decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: AppColors.emergencyRed, width: 3), gradient: const LinearGradient(colors: [Color(0xFF4A2B22), Color(0xFF1A0A08)], begin: Alignment.topCenter, end: Alignment.bottomCenter)), child: const Center(child: CircleAvatar(radius: 52, backgroundColor: Color(0xFFEAD3B8), child: Icon(Icons.person, size: 54, color: AppColors.trustNavy)))),
                      ),
                      const SizedBox(height: 18),
                      Text('Calling', style: theme.textTheme.labelLarge?.copyWith(color: AppColors.emergencyRed, fontWeight: FontWeight.w700)),
                      const SizedBox(height: 8),
                      InkWell(
                        onTap: showGuardianProtocol,
                        borderRadius: BorderRadius.circular(12),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          child: Text('Sarah Jenkins', style: theme.textTheme.headlineMedium?.copyWith(color: Colors.white, fontWeight: FontWeight.w700)),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text('(Primary Guardian)', style: theme.textTheme.bodyLarge?.copyWith(color: Colors.white70)),
                      const SizedBox(height: 16),
                      Text('Connecting secure line...', style: theme.textTheme.bodySmall?.copyWith(color: Colors.white54, letterSpacing: 0.4)),
                      const Spacer(),
                      Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                        _CallAction(icon: Icons.volume_up_outlined, label: 'Speaker', onTap: () => showFeedback('Speakerphone enabled.')),
                        _CallAction(icon: Icons.mic_off_outlined, label: 'Mute', onTap: () => showFeedback('Microphone muted.')),
                        _CallAction(icon: Icons.videocam_outlined, label: 'Video', onTap: () => showFeedback('Video call is not available right now.')),
                      ]),
                      const SizedBox(height: 20),
                      SizedBox(width: double.infinity, height: 52, child: OutlinedButton.icon(onPressed: () => context.go('/emergency/hotline'), icon: const Icon(Icons.local_police_outlined), label: const Text('Switch to Police Dispatch'), style: OutlinedButton.styleFrom(foregroundColor: Colors.white, side: const BorderSide(color: Colors.white24)))),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 14),
                child: Row(children: [Expanded(child: FilledButton(onPressed: () => context.go('/emergency/hotline'), style: FilledButton.styleFrom(backgroundColor: const Color(0xFF111A2B), foregroundColor: Colors.white), child: const Text('Contact Police'))), const SizedBox(width: 12), Expanded(child: FilledButton(onPressed: () => context.go('/trip-live'), style: FilledButton.styleFrom(backgroundColor: AppColors.emergencyRed), child: const Text('Cancel SOS')))]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class NearbySafePointsScreen extends StatefulWidget {
  const NearbySafePointsScreen({super.key});

  @override
  State<NearbySafePointsScreen> createState() => _NearbySafePointsScreenState();
}

class _NearbySafePointsScreenState extends State<NearbySafePointsScreen> {
  String _selectedPoint = 'Central Station';

  void _showDirections(String destination) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text('Routing to $destination now.')));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return PageScaffold(
      safeArea: false,
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(gradient: LinearGradient(colors: [Color(0xFF143048), Color(0xFF0D1C2D)], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
              child: CustomPaint(painter: _EmergencyGridPainter()),
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                  color: AppColors.emergencyRed,
                  child: Row(children: [const Icon(Icons.warning_amber_rounded, color: Colors.white), const SizedBox(width: 8), Text('Emergency Active', style: theme.textTheme.titleSmall?.copyWith(color: Colors.white, fontWeight: FontWeight.w700)), const Spacer(), const Icon(Icons.sensors_rounded, color: Colors.white, size: 18)]),
                ),
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.fromLTRB(18, 18, 18, 16),
                    children: [
                      Container(
                        padding: const EdgeInsets.all(18),
                        decoration: BoxDecoration(color: Colors.white.withOpacity(0.92), borderRadius: BorderRadius.circular(24)),
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('Nearby Safe Points', style: theme.textTheme.headlineSmall?.copyWith(color: AppColors.trustNavy, fontWeight: FontWeight.w700)), const SizedBox(height: 6), Text('Routes to safety', style: theme.textTheme.bodySmall?.copyWith(color: AppColors.textSecondary)), const SizedBox(height: 10), Text('Selected: $_selectedPoint', style: theme.textTheme.labelMedium?.copyWith(color: AppColors.skyBlue, fontWeight: FontWeight.w700))]),
                      ),
                      const SizedBox(height: 16),
                      _SafePointCard(name: 'Central Station', detail: '24/7 Police Presence • Secure Zone', distance: '0.2 miles', primary: _selectedPoint == 'Central Station', onSelected: () => setState(() => _selectedPoint = 'Central Station'), onDirections: () => _showDirections('Central Station')),
                      const SizedBox(height: 12),
                      _SafePointCard(name: 'City General ER', detail: 'Emergency Medical • Well-lit Area', distance: '0.8 miles', primary: _selectedPoint == 'City General ER', onSelected: () => setState(() => _selectedPoint = 'City General ER'), onDirections: () => _showDirections('City General ER')),
                      const SizedBox(height: 12),
                      _SafePointCard(name: 'Safeway 24/7', detail: 'Safe-Haven Partner • Open Now', distance: '1.1 miles', primary: _selectedPoint == 'Safeway 24/7', onSelected: () => setState(() => _selectedPoint = 'Safeway 24/7'), onDirections: () => _showDirections('Safeway 24/7')),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 14),
                  child: Row(children: [Expanded(child: FilledButton(onPressed: () => context.go('/trip-live'), style: FilledButton.styleFrom(backgroundColor: const Color(0xFF111A2B), foregroundColor: Colors.white), child: const Text('Cancel SOS'))), const SizedBox(width: 12), Expanded(child: FilledButton(onPressed: () => context.go('/emergency/priority-contact-auto-call'), style: FilledButton.styleFrom(backgroundColor: AppColors.emergencyRed), child: const Text('Contact Police')))]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class EmergencyHotlineScreen extends StatelessWidget {
  const EmergencyHotlineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    void showDialFeedback(String message) {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(SnackBar(content: Text(message)));
    }
    void showNotifiedContacts() {
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
                Text('Emergency contacts notified', style: theme.textTheme.titleLarge?.copyWith(color: AppColors.trustNavy, fontWeight: FontWeight.w700)),
                const SizedBox(height: 8),
                const Text('Sarah Jenkins, Dad, Marcus, and 2 nearby guardians have received the active emergency broadcast.'),
              ],
            ),
          ),
        ),
      );
    }

    return PageScaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              color: AppColors.emergencyRed,
              child: Row(children: [const Icon(Icons.warning_amber_rounded, color: Colors.white), const SizedBox(width: 8), Text('Emergency Active', style: theme.textTheme.titleSmall?.copyWith(color: Colors.white, fontWeight: FontWeight.w700)), const Spacer(), const Icon(Icons.sensors_rounded, color: Colors.white, size: 18)]),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.fromLTRB(18, 18, 18, 16),
                children: [
                  Text('Quick Response', style: theme.textTheme.labelSmall?.copyWith(color: AppColors.skyBlue, fontWeight: FontWeight.w700)),
                  const SizedBox(height: 6),
                  Text('Emergency Hotlines', style: theme.textTheme.headlineMedium?.copyWith(color: AppColors.trustNavy, fontWeight: FontWeight.w700)),
                  const SizedBox(height: 18),
                  SizedBox(width: double.infinity, height: 96, child: FilledButton.icon(onPressed: () { showDialFeedback('Dialing emergency services...'); context.go('/emergency/alert-sent'); }, style: FilledButton.styleFrom(backgroundColor: AppColors.emergencyRed, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24))), icon: const Icon(Icons.call_rounded), label: const Text('Call 911'))),
                  const SizedBox(height: 18),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(22)),
                    child: Row(children: [const CircleAvatar(radius: 18, backgroundColor: Color(0xFFEAF1FD), child: Icon(Icons.place_outlined, color: AppColors.skyBlue)), const SizedBox(width: 12), Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('Your Current Location', style: theme.textTheme.labelSmall?.copyWith(color: AppColors.textMuted, fontWeight: FontWeight.w700)), const SizedBox(height: 4), Text('Central District, Sector 4', style: theme.textTheme.titleMedium?.copyWith(color: AppColors.trustNavy, fontWeight: FontWeight.w700))])), IconButton(onPressed: () => showDialFeedback('Opening map snapshot...'), icon: const Icon(Icons.map_outlined, size: 18, color: AppColors.textMuted))]),
                  ),
                  const SizedBox(height: 18),
                  Text('Secondary Support', style: theme.textTheme.labelSmall?.copyWith(color: AppColors.skyBlue, fontWeight: FontWeight.w700)),
                  const SizedBox(height: 12),
                  _HotlineTile(title: 'Non-Emergency Police', subtitle: 'General inquiries & reporting', onTap: () => showDialFeedback('Connecting to non-emergency police line...')),
                  const SizedBox(height: 10),
                  _HotlineTile(title: 'Crisis Hotline', subtitle: 'Immediate mental health support', onTap: () => showDialFeedback('Connecting to crisis hotline...')),
                  const SizedBox(height: 10),
                  _HotlineTile(title: 'Poison Control', subtitle: 'Toxic exposure guidance', onTap: () => showDialFeedback('Connecting to poison control...')),
                  const SizedBox(height: 18),
                  InkWell(
                    onTap: showNotifiedContacts,
                    borderRadius: BorderRadius.circular(22),
                    child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(color: const Color(0xFFF1F5FE), borderRadius: BorderRadius.circular(22)),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('Emergency Contacts Notified', style: theme.textTheme.labelSmall?.copyWith(color: AppColors.textMuted, fontWeight: FontWeight.w700)), const SizedBox(height: 10), const Row(children: [CircleAvatar(radius: 14, backgroundColor: Color(0xFFEAD3B8), child: Icon(Icons.person, size: 14, color: AppColors.trustNavy)), SizedBox(width: 6), CircleAvatar(radius: 14, backgroundColor: Color(0xFFEAD3B8), child: Icon(Icons.person, size: 14, color: AppColors.trustNavy)), SizedBox(width: 6), CircleAvatar(radius: 14, backgroundColor: Color(0xFFEAF1FD), child: Text('+2', style: TextStyle(fontSize: 10, color: AppColors.skyBlue, fontWeight: FontWeight.w700)))])]),
                  ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 14),
              child: Row(children: [Expanded(child: FilledButton(onPressed: () => context.go('/trip-live'), style: FilledButton.styleFrom(backgroundColor: const Color(0xFF111A2B), foregroundColor: Colors.white), child: const Text('Cancel SOS'))), const SizedBox(width: 12), Expanded(child: FilledButton(onPressed: () => context.go('/emergency/priority-contact-auto-call'), style: FilledButton.styleFrom(backgroundColor: AppColors.emergencyRed), child: const Text('Contact Police')))]),
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({required this.icon, required this.title, required this.subtitle});
  final IconData icon;
  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) => Container(padding: const EdgeInsets.all(16), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(22)), child: Row(children: [CircleAvatar(radius: 18, backgroundColor: const Color(0xFFEAF1FD), child: Icon(icon, size: 18, color: AppColors.skyBlue)), const SizedBox(width: 12), Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(title, style: Theme.of(context).textTheme.titleMedium?.copyWith(color: AppColors.trustNavy, fontWeight: FontWeight.w700)), const SizedBox(height: 4), Text(subtitle, style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColors.textSecondary))]))]));
}

class _CallAction extends StatelessWidget {
  const _CallAction({required this.icon, required this.label, this.onTap});
  final IconData icon;
  final String label;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) => Material(color: Colors.white.withOpacity(0.08), borderRadius: BorderRadius.circular(20), child: InkWell(onTap: onTap, borderRadius: BorderRadius.circular(20), child: SizedBox(width: 76, height: 76, child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(icon, color: Colors.white), const SizedBox(height: 8), Text(label, style: Theme.of(context).textTheme.labelSmall?.copyWith(color: Colors.white70, fontWeight: FontWeight.w700))]))));
}

class _SafePointCard extends StatelessWidget {
  const _SafePointCard({required this.name, required this.detail, required this.distance, this.primary = false, this.onSelected, this.onDirections});
  final String name;
  final String detail;
  final String distance;
  final bool primary;
  final VoidCallback? onSelected;
  final VoidCallback? onDirections;
  @override
  Widget build(BuildContext context) => Material(color: Colors.white, borderRadius: BorderRadius.circular(24), child: InkWell(onTap: onSelected, borderRadius: BorderRadius.circular(24), child: Container(padding: const EdgeInsets.all(16), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24), border: Border.all(color: primary ? const Color(0xFF43D49A) : const Color(0xFFDDE5F0), width: primary ? 2 : 1)), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Row(children: [CircleAvatar(radius: 18, backgroundColor: primary ? const Color(0xFFE8FAF1) : const Color(0xFFEAF1FD), child: Icon(primary ? Icons.shield_outlined : Icons.local_hospital_outlined, color: primary ? AppColors.safeGreen : AppColors.skyBlue)), const Spacer(), Container(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5), decoration: BoxDecoration(color: const Color(0xFFEAF1FD), borderRadius: BorderRadius.circular(999)), child: Text(distance, style: const TextStyle(color: AppColors.skyBlue, fontWeight: FontWeight.w700, fontSize: 10)))]), const SizedBox(height: 12), Text(name, style: Theme.of(context).textTheme.titleLarge?.copyWith(color: AppColors.trustNavy, fontWeight: FontWeight.w700)), const SizedBox(height: 4), Text(detail, style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColors.textSecondary)), const SizedBox(height: 14), SizedBox(width: double.infinity, height: 48, child: FilledButton.icon(onPressed: onDirections, style: FilledButton.styleFrom(backgroundColor: primary ? AppColors.trustNavy : const Color(0xFFEAF1FD), foregroundColor: primary ? Colors.white : AppColors.trustNavy), icon: const Icon(Icons.navigation_outlined), label: const Text('Get Directions')))]))));
}

class _HotlineTile extends StatelessWidget {
  const _HotlineTile({required this.title, required this.subtitle, this.onTap});
  final String title;
  final String subtitle;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) => Material(color: Colors.white, borderRadius: BorderRadius.circular(22), child: InkWell(onTap: onTap, borderRadius: BorderRadius.circular(22), child: Padding(padding: const EdgeInsets.all(16), child: Row(children: [const CircleAvatar(radius: 18, backgroundColor: Color(0xFFEAF1FD), child: Icon(Icons.support_agent_outlined, size: 18, color: AppColors.skyBlue)), const SizedBox(width: 12), Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(title, style: Theme.of(context).textTheme.titleMedium?.copyWith(color: AppColors.trustNavy, fontWeight: FontWeight.w700)), const SizedBox(height: 4), Text(subtitle, style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColors.textSecondary))])), const Icon(Icons.chevron_right_rounded, color: AppColors.textMuted)]))));
}

class _EmergencyGridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final grid = Paint()..color = Colors.white.withOpacity(0.12)..style = PaintingStyle.stroke..strokeWidth = 1;
    for (double x = 0; x < size.width; x += 24) { canvas.drawLine(Offset(x, 0), Offset(x, size.height), grid); }
    for (double y = 0; y < size.height; y += 24) { canvas.drawLine(Offset(0, y), Offset(size.width, y), grid); }
    final route = Paint()..color = const Color(0x55FFFFFF)..style = PaintingStyle.stroke..strokeWidth = 2;
    canvas.drawLine(Offset(size.width * 0.5, 0), Offset(size.width * 0.5, size.height), route);
    canvas.drawLine(Offset(0, size.height * 0.5), Offset(size.width, size.height * 0.5), route);
  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}


