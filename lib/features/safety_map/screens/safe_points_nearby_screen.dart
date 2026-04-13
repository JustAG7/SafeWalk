import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_colors.dart';
import '../../../shared/widgets/page_scaffold.dart';
import '../mock/safety_map_mock_data.dart';

class SafePointsNearbyScreen extends StatefulWidget {
  const SafePointsNearbyScreen({super.key});

  @override
  State<SafePointsNearbyScreen> createState() => _SafePointsNearbyScreenState();
}

class _SafePointsNearbyScreenState extends State<SafePointsNearbyScreen> {
  late final Set<String> _activeFilters;
  String _selectedPointId = kSafetyMapSafePoints.first.id;

  @override
  void initState() {
    super.initState();
    _activeFilters = {'verified'};
  }

  List<SafetyMapSafePoint> get _visiblePoints {
    return kSafetyMapSafePoints.where((point) {
      if (_activeFilters.contains('verified') && !point.verified) {
        return false;
      }
      return true;
    }).toList();
  }

  void _showFilterSheet() {
    showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      builder: (context) => SafeArea(
        child: StatefulBuilder(
          builder: (context, setSheetState) => Padding(
            padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Filter Safe Points',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: AppColors.trustNavy,
                        fontWeight: FontWeight.w700,
                      ),
                ),
                const SizedBox(height: 12),
                for (final filter in kSafePointFilters)
                  CheckboxListTile(
                    value: _activeFilters.contains(filter.id),
                    contentPadding: EdgeInsets.zero,
                    title: Text(filter.label),
                    secondary: filter.icon == null ? null : Icon(filter.icon),
                    onChanged: (value) {
                      setState(() {
                        if (value == true) {
                          _activeFilters.add(filter.id);
                        } else {
                          _activeFilters.remove(filter.id);
                        }
                      });
                      setSheetState(() {});
                    },
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _selectPoint(SafetyMapSafePoint point) {
    setState(() => _selectedPointId = point.id);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final selectedPoint = kSafetyMapSafePoints.firstWhere(
      (point) => point.id == _selectedPointId,
    );

    return PageScaffold(
      safeArea: false,
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF92A96B), Color(0xFF5E7747)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: CustomPaint(painter: _GridPainter()),
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
                  child: Row(
                    children: [
                      const Icon(Icons.menu_rounded, color: AppColors.trustNavy),
                      const SizedBox(width: 12),
                      Text(
                        'SAFEWALK',
                        style: theme.textTheme.titleMedium?.copyWith(
                          color: AppColors.trustNavy,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 1,
                        ),
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: _showFilterSheet,
                        child: const Text('Filter'),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  padding: const EdgeInsets.fromLTRB(18, 14, 18, 18),
                  decoration: const BoxDecoration(
                    color: Color(0xFFF7FBFD),
                    borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        child: Container(
                          width: 44,
                          height: 4,
                          decoration: BoxDecoration(
                            color: const Color(0xFFD7E1EC),
                            borderRadius: BorderRadius.circular(999),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Safe Points Nearby',
                              style: theme.textTheme.headlineSmall?.copyWith(
                                color: AppColors.trustNavy,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          OutlinedButton.icon(
                            onPressed: _showFilterSheet,
                            icon: const Icon(Icons.filter_alt_outlined),
                            label: const Text('Filter'),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Text(
                        '${_visiblePoints.length} locations match your current filters.',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: AppColors.safeGreen,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 14),
                      if (_visiblePoints.isEmpty)
                        const _EmptySafePointState()
                      else
                        ..._visiblePoints.map(
                          (point) => Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: _SafePlaceCard(
                              point: point,
                              selected: _selectedPointId == point.id,
                              onSelect: () => _selectPoint(point),
                            ),
                          ),
                        ),
                      const SizedBox(height: 8),
                      Text(
                        'Selected route: ${selectedPoint.name}',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: AppColors.textSecondary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                const _BottomBar(activeIndex: 1),
                const SizedBox(height: 12),
              ],
            ),
          ),
          Positioned(
            right: 18,
            top: 110,
            child: Column(
              children: [
                _Fab(
                  icon: Icons.gps_fixed_rounded,
                  onTap: () => ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Centered on your live location.')),
                  ),
                ),
                const SizedBox(height: 10),
                _Fab(
                  icon: Icons.layers_outlined,
                  onTap: () => ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Safe-zone layer toggled.')),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 22,
            bottom: 70,
            child: GestureDetector(
              onTap: () => context.go('/trip-live/need-help'),
              child: Container(
                width: 52,
                height: 52,
                decoration: const BoxDecoration(
                  color: AppColors.emergencyRed,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.sos_outlined, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SafePlaceCard extends StatelessWidget {
  const _SafePlaceCard({
    required this.point,
    required this.selected,
    required this.onSelect,
  });

  final SafetyMapSafePoint point;
  final bool selected;
  final VoidCallback onSelect;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: selected ? AppColors.skyBlue : Colors.transparent,
          width: 1.5,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 54,
            height: 54,
            decoration: BoxDecoration(
              color: const Color(0xFFEAF1FD),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Icon(point.icon, color: AppColors.skyBlue),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        point.name,
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              color: AppColors.trustNavy,
                              fontWeight: FontWeight.w700,
                            ),
                      ),
                    ),
                    if (point.verified)
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: const Color(0xFFE8FAF1),
                          borderRadius: BorderRadius.circular(999),
                        ),
                        child: const Text(
                          'VERIFIED',
                          style: TextStyle(
                            fontSize: 10,
                            color: AppColors.safeGreen,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  point.subtitle,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppColors.textSecondary,
                      ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      point.distance,
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            color: AppColors.textMuted,
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                    const SizedBox(width: 16),
                    Text(
                      point.eta,
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            color: AppColors.textMuted,
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          FilledButton(
            onPressed: onSelect,
            style: FilledButton.styleFrom(
              shape: const CircleBorder(),
              padding: const EdgeInsets.all(12),
            ),
            child: Icon(
              selected ? Icons.check_rounded : Icons.navigation_outlined,
            ),
          ),
        ],
      ),
    );
  }
}

class _EmptySafePointState extends StatelessWidget {
  const _EmptySafePointState();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Column(
        children: [
          const Icon(Icons.location_off_outlined, color: AppColors.textMuted, size: 34),
          const SizedBox(height: 8),
          Text(
            'No safe points match the current filters.',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.textSecondary,
                ),
          ),
        ],
      ),
    );
  }
}

class _Fab extends StatelessWidget {
  const _Fab({required this.icon, required this.onTap});

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      shape: const CircleBorder(),
      child: InkWell(
        onTap: onTap,
        customBorder: const CircleBorder(),
        child: SizedBox(
          width: 44,
          height: 44,
          child: Icon(icon, color: AppColors.trustNavy),
        ),
      ),
    );
  }
}

class _GridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final p = Paint()
      ..color = Colors.white.withValues(alpha: 0.14)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;
    for (double x = 0; x < size.width; x += 24) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), p);
    }
    for (double y = 0; y < size.height; y += 24) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), p);
    }
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
      ('SETTINGS', Icons.settings_outlined, '/settings/dashboard'),
    ];
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          for (var i = 0; i < items.length; i++)
            InkWell(
              onTap: () => context.go(items[i].$3),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 34,
                    height: 34,
                    decoration: BoxDecoration(
                      color: activeIndex == i ? AppColors.trustNavy : Colors.transparent,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      items[i].$2,
                      size: 18,
                      color: activeIndex == i ? Colors.white : AppColors.textMuted,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    items[i].$1,
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: activeIndex == i ? AppColors.trustNavy : AppColors.textMuted,
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

