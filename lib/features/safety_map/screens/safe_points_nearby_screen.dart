import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_colors.dart';
import '../../../shared/widgets/page_scaffold.dart';

class SafePointsNearbyScreen extends StatelessWidget {
  const SafePointsNearbyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return PageScaffold(
      safeArea: false,
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [Color(0xFF92A96B), Color(0xFF5E7747)], begin: Alignment.topCenter, end: Alignment.bottomCenter),
              ),
              child: CustomPaint(painter: _GridPainter()),
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
                  child: Row(children: [const Icon(Icons.menu_rounded, color: AppColors.trustNavy), const SizedBox(width: 12), Text('SAFEWALK', style: theme.textTheme.titleMedium?.copyWith(color: AppColors.trustNavy, fontWeight: FontWeight.w800, letterSpacing: 1)), const Spacer(), const CircleAvatar(radius: 15, backgroundColor: Color(0xFFEAD3B8), child: Icon(Icons.person, size: 15, color: AppColors.trustNavy))]),
                ),
                const Spacer(),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  padding: const EdgeInsets.fromLTRB(18, 14, 18, 18),
                  decoration: const BoxDecoration(color: Color(0xFFF7FBFD), borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(child: Container(width: 44, height: 4, decoration: BoxDecoration(color: const Color(0xFFD7E1EC), borderRadius: BorderRadius.circular(999)))),
                      const SizedBox(height: 16),
                      Row(children: [Expanded(child: Text('Safe Points Nearby', style: theme.textTheme.headlineSmall?.copyWith(color: AppColors.trustNavy, fontWeight: FontWeight.w700))), OutlinedButton.icon(onPressed: () {}, icon: const Icon(Icons.filter_alt_outlined), label: const Text('Filter'))]),
                      const SizedBox(height: 6),
                      Text('3 Verified Guardians Active', style: theme.textTheme.bodySmall?.copyWith(color: AppColors.safeGreen, fontWeight: FontWeight.w700)),
                      const SizedBox(height: 14),
                      const _SafePlaceCard(name: '24-Hour Police Station', subtitle: 'Open • Always Open', distance: '0.4 mi', eta: '8 min', icon: Icons.shield_outlined, verified: true),
                      const SizedBox(height: 12),
                      const _SafePlaceCard(name: 'BlueLine SafeWalk Cafe', subtitle: 'SafeWalk Safe Space', distance: '0.6 mi', eta: '12 min', icon: Icons.local_cafe_outlined),
                      const SizedBox(height: 12),
                      const _SafePlaceCard(name: 'CVS Pharmacy', subtitle: '24/7 Pharmacy • Traffic Security', distance: '1.1 mi', eta: '14 min', icon: Icons.local_hospital_outlined, verified: true),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                const _BottomBar(activeIndex: 1),
                const SizedBox(height: 12),
              ],
            ),
          ),
          Positioned(right: 18, top: 110, child: Column(children: const [_Fab(icon: Icons.gps_fixed_rounded), SizedBox(height: 10), _Fab(icon: Icons.layers_outlined)])),
          Positioned(right: 22, bottom: 70, child: GestureDetector(onTap: () => context.go('/trip-live/need-help'), child: Container(width: 52, height: 52, decoration: const BoxDecoration(color: AppColors.emergencyRed, shape: BoxShape.circle), child: const Icon(Icons.sos_outlined, color: Colors.white)))),
        ],
      ),
    );
  }
}

class _SafePlaceCard extends StatelessWidget {
  const _SafePlaceCard({required this.name, required this.subtitle, required this.distance, required this.eta, required this.icon, this.verified = false});

  final String name;
  final String subtitle;
  final String distance;
  final String eta;
  final IconData icon;
  final bool verified;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24)),
      child: Row(
        children: [
          Container(width: 54, height: 54, decoration: BoxDecoration(color: const Color(0xFFEAF1FD), borderRadius: BorderRadius.circular(18)), child: Icon(icon, color: AppColors.skyBlue)),
          const SizedBox(width: 12),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Row(children: [Expanded(child: Text(name, style: Theme.of(context).textTheme.titleMedium?.copyWith(color: AppColors.trustNavy, fontWeight: FontWeight.w700))), if (verified) Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4), decoration: BoxDecoration(color: const Color(0xFFE8FAF1), borderRadius: BorderRadius.circular(999)), child: const Text('VERIFIED', style: TextStyle(fontSize: 10, color: AppColors.safeGreen, fontWeight: FontWeight.w700)))]), const SizedBox(height: 4), Text(subtitle, style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColors.textSecondary)), const SizedBox(height: 10), Row(children: [Text(distance, style: Theme.of(context).textTheme.labelSmall?.copyWith(color: AppColors.textMuted, fontWeight: FontWeight.w700)), const SizedBox(width: 16), Text(eta, style: Theme.of(context).textTheme.labelSmall?.copyWith(color: AppColors.textMuted, fontWeight: FontWeight.w700))])])),
          const SizedBox(width: 12),
          FilledButton(onPressed: () {}, style: FilledButton.styleFrom(shape: const CircleBorder(), padding: const EdgeInsets.all(12)), child: const Icon(Icons.navigation_outlined)),
        ],
      ),
    );
  }
}

class _Fab extends StatelessWidget {
  const _Fab({required this.icon});
  final IconData icon;
  @override
  Widget build(BuildContext context) => Container(width: 44, height: 44, decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle), child: Icon(icon, color: AppColors.trustNavy));
}

class _GridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final p = Paint()..color = Colors.white.withOpacity(0.14)..style = PaintingStyle.stroke..strokeWidth = 1;
    for (double x = 0; x < size.width; x += 24) { canvas.drawLine(Offset(x, 0), Offset(x, size.height), p); }
    for (double y = 0; y < size.height; y += 24) { canvas.drawLine(Offset(0, y), Offset(size.width, y), p); }
  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _BottomBar extends StatelessWidget {
  const _BottomBar({required this.activeIndex});
  final int activeIndex;
  @override
  Widget build(BuildContext context) {
    final items = const [
      ('HOME', Icons.home_filled, '/home'),
      ('MAP', Icons.map_outlined, '/safety-map/main'),
      ('TRIPS', Icons.route_outlined, '/trips'),
      ('SETTINGS', Icons.settings_outlined, '/settings'),
    ];
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24)),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [for (var i = 0; i < items.length; i++) InkWell(onTap: () => context.go(items[i].$3), child: Column(mainAxisSize: MainAxisSize.min, children: [Container(width: 34, height: 34, decoration: BoxDecoration(color: activeIndex == i ? AppColors.trustNavy : Colors.transparent, borderRadius: BorderRadius.circular(12)), child: Icon(items[i].$2, size: 18, color: activeIndex == i ? Colors.white : AppColors.textMuted)), const SizedBox(height: 4), Text(items[i].$1, style: Theme.of(context).textTheme.labelSmall?.copyWith(color: activeIndex == i ? AppColors.trustNavy : AppColors.textMuted, fontWeight: FontWeight.w700))]))]),
    );
  }
}
