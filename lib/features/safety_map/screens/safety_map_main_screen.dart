import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_colors.dart';
import '../../../shared/widgets/page_scaffold.dart';
import '../mock/safety_map_mock_data.dart';

class SafetyMapMainScreen extends StatefulWidget {
  const SafetyMapMainScreen({super.key});

  @override
  State<SafetyMapMainScreen> createState() => _SafetyMapMainScreenState();
}

class _SafetyMapMainScreenState extends State<SafetyMapMainScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _activeMode = kSafetyMapModeOptions.first.id;

  @override
  void initState() {
    super.initState();
    _searchController.text = kSafetyMapSearchSuggestions.first;
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _showSearchSuggestions() {
    showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      builder: (context) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Search destination',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: AppColors.trustNavy,
                      fontWeight: FontWeight.w700,
                    ),
              ),
              const SizedBox(height: 10),
              for (final suggestion in kSafetyMapSearchSuggestions)
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: const Icon(Icons.place_outlined),
                  title: Text(suggestion),
                  onTap: () {
                    setState(() => _searchController.text = suggestion);
                    Navigator.of(context).pop();
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleModeChange(String modeId) {
    setState(() => _activeMode = modeId);
    if (modeId == 'safe_points') {
      context.go('/safety-map/safe-points-nearby');
    } else {
      context.go('/safety-map/incident-heatmap');
    }
  }

  void _showMapControlMessage(String label) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text('$label updated locally.')));
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
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF0F2030), Color(0xFF09131F)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: CustomPaint(painter: _SafetyMapPainter()),
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
                  child: Row(
                    children: [
                      const Icon(Icons.menu_rounded, color: Colors.white),
                      const SizedBox(width: 12),
                      Text(
                        'SAFEWALK',
                        style: theme.textTheme.titleMedium?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 1,
                        ),
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: _showSearchSuggestions,
                        child: const Text('Search'),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                  child: InkWell(
                    onTap: _showSearchSuggestions,
                    borderRadius: BorderRadius.circular(18),
                    child: Ink(
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.96),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.search_rounded, color: AppColors.textMuted),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              _searchController.text,
                              style: const TextStyle(color: AppColors.textSecondary),
                            ),
                          ),
                          const Icon(Icons.mic_none_rounded, color: AppColors.textMuted),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (final mode in kSafetyMapModeOptions) ...[
                      _ToggleChip(
                        label: mode.label,
                        active: _activeMode == mode.id,
                        onTap: () => _handleModeChange(mode.id),
                      ),
                      if (mode != kSafetyMapModeOptions.last) const SizedBox(width: 8),
                    ],
                  ],
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: FilledButton.icon(
                      onPressed: () => context.go('/safety-map/report-incident'),
                      icon: const Icon(Icons.report_gmailerrorred_rounded),
                      label: const Text('Report Incident'),
                    ),
                  ),
                ),
                const SizedBox(height: 14),
                const _MapBottomBar(active: _MapTab.map),
                const SizedBox(height: 10),
              ],
            ),
          ),
          Positioned(
            right: 18,
            bottom: 150,
            child: Column(
              children: [
                _MapAction(
                  icon: Icons.layers_outlined,
                  onTap: () => _showMapControlMessage('Layer mode'),
                ),
                const SizedBox(height: 10),
                _MapAction(
                  icon: Icons.gps_fixed_rounded,
                  onTap: () => _showMapControlMessage('Live location'),
                ),
              ],
            ),
          ),
          const Positioned(
            left: 144,
            top: 316,
            child: _MapMarker(label: 'SAFE ZONE'),
          ),
          Positioned(
            right: 26,
            bottom: 72,
            child: GestureDetector(
              onTap: () => context.go('/trip-live/need-help'),
              child: Container(
                width: 52,
                height: 52,
                decoration: const BoxDecoration(
                  color: Color(0xFFFFE6E6),
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: Text(
                    'SOS',
                    style: TextStyle(
                      color: AppColors.emergencyRed,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ToggleChip extends StatelessWidget {
  const _ToggleChip({
    required this.label,
    required this.active,
    required this.onTap,
  });

  final String label;
  final bool active;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: active ? AppColors.trustNavy : Colors.white.withValues(alpha: 0.16),
      borderRadius: BorderRadius.circular(999),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(999),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Text(
            label,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
          ),
        ),
      ),
    );
  }
}

class _MapAction extends StatelessWidget {
  const _MapAction({required this.icon, required this.onTap});

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
          width: 46,
          height: 46,
          child: Icon(icon, color: AppColors.trustNavy, size: 20),
        ),
      ),
    );
  }
}

class _MapMarker extends StatelessWidget {
  const _MapMarker({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CircleAvatar(
          radius: 12,
          backgroundColor: Color(0xFF4BE090),
          child: Icon(Icons.place_outlined, size: 14, color: Colors.white),
        ),
        const SizedBox(height: 4),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(999),
          ),
          child: Text(
            label,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: AppColors.trustNavy,
                  fontWeight: FontWeight.w700,
                ),
          ),
        ),
      ],
    );
  }
}

enum _MapTab { home, map, trips, settings }

class _MapBottomBar extends StatelessWidget {
  const _MapBottomBar({required this.active});

  final _MapTab active;

  @override
  Widget build(BuildContext context) {
    final items = const [
      (_MapTab.home, Icons.home_filled, 'HOME', '/home'),
      (_MapTab.map, Icons.map_outlined, 'MAP', '/safety-map/main'),
      (_MapTab.trips, Icons.route_outlined, 'TRIPS', '/trips'),
      (_MapTab.settings, Icons.settings_outlined, 'SETTINGS', '/settings/dashboard'),
    ];

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          for (final item in items)
            InkWell(
              onTap: () => context.go(item.$4),
              borderRadius: BorderRadius.circular(12),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 34,
                      height: 34,
                      decoration: BoxDecoration(
                        color: active == item.$1 ? AppColors.trustNavy : Colors.transparent,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        item.$2,
                        size: 18,
                        color: active == item.$1 ? Colors.white : AppColors.textMuted,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item.$3,
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            color: active == item.$1
                                ? AppColors.trustNavy
                                : AppColors.textMuted,
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _SafetyMapPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final grid = Paint()
      ..color = const Color(0xFF1F5E92)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;
    for (double x = 0; x < size.width; x += 24) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), grid);
    }
    for (double y = 0; y < size.height; y += 24) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), grid);
    }
    final route = Paint()
      ..color = const Color(0xFF38A8FF)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    final path = Path()
      ..moveTo(size.width * 0.1, size.height * 0.22)
      ..cubicTo(
        size.width * 0.42,
        size.height * 0.18,
        size.width * 0.58,
        size.height * 0.56,
        size.width * 0.86,
        size.height * 0.48,
      );
    canvas.drawPath(path, route);
    canvas.drawCircle(
      Offset(size.width * 0.48, size.height * 0.62),
      8,
      Paint()..color = const Color(0x5538FFB1),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

