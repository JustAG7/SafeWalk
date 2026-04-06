import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_radius.dart';
import '../../../core/constants/app_spacing.dart';
import '../../../shared/widgets/page_scaffold.dart';

class HomeAddressSetupScreen extends StatelessWidget {
  const HomeAddressSetupScreen({super.key});

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
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFF314A5B), Color(0xFF223645)],
                ),
              ),
              child: CustomPaint(painter: _MapGridPainter()),
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 6, 10, 0),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () => context.go('/setup/contacts'),
                        icon: const Icon(Icons.arrow_back_rounded, color: Colors.white),
                      ),
                      const Spacer(),
                      Text(
                        'STEP 4 OF 4',
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: Colors.white70,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  'Set Home Address',
                  style: theme.textTheme.titleLarge?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          const Positioned(
            left: 0,
            right: 0,
            top: 150,
            bottom: 280,
            child: _MapPinCenter(),
          ),
          Positioned(
            right: 18,
            top: 330,
            child: Column(
              children: [
                _MapSideButton(icon: Icons.my_location_rounded),
                const SizedBox(height: 10),
                _MapSideButton(icon: Icons.add_rounded),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(20, 14, 20, 28),
              decoration: const BoxDecoration(
                color: Color(0xFFF8FAFC),
                borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                    child: Container(
                      width: 56,
                      height: 5,
                      decoration: BoxDecoration(
                        color: AppColors.outline,
                        borderRadius: BorderRadius.circular(999),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    height: 54,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: const Color(0xFFEFF3FB),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Row(
                      children: const [
                        Icon(Icons.search_rounded, color: AppColors.textMuted),
                        SizedBox(width: 10),
                        Text('221B Baker Street', style: TextStyle(color: AppColors.trustNavy, fontWeight: FontWeight.w600)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 14),
                  Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 38,
                          height: 38,
                          decoration: BoxDecoration(
                            color: const Color(0xFFEAF4FF),
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: const Icon(Icons.navigation_rounded, color: AppColors.skyBlue, size: 20),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Current Location', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700)),
                              const SizedBox(height: 3),
                              Text('HIGH ACCURACY ACTIVE', style: theme.textTheme.labelSmall?.copyWith(color: AppColors.textMuted, fontWeight: FontWeight.w700)),
                            ],
                          ),
                        ),
                        const Icon(Icons.arrow_forward_ios_rounded, size: 16, color: AppColors.textMuted),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text('SUGGESTED LOCATIONS', style: theme.textTheme.labelSmall?.copyWith(color: AppColors.textMuted, fontWeight: FontWeight.w700)),
                  const SizedBox(height: 10),
                  Text('1024 Guardian Way, San Francisco', style: theme.textTheme.bodyMedium?.copyWith(color: AppColors.textSecondary)),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 54,
                    child: FilledButton(
                      onPressed: () => context.go('/setup/address/work'),
                      child: const Text('Save Home Address'),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'This location is used for automatic safety triggers when you reach your destination.',
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodySmall?.copyWith(color: AppColors.textSecondary, height: 1.4),
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

class _MapSideButton extends StatelessWidget {
  const _MapSideButton({required this.icon});

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 42,
      height: 42,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Icon(icon, color: AppColors.trustNavy),
    );
  }
}

class _MapPinCenter extends StatelessWidget {
  const _MapPinCenter();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 58,
        height: 58,
        decoration: const BoxDecoration(
          color: AppColors.trustNavy,
          shape: BoxShape.circle,
        ),
        child: const Icon(Icons.home_rounded, color: Colors.white, size: 26),
      ),
    );
  }
}

class _MapGridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.14)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.1;
    for (double x = -20; x < size.width + 20; x += 40) {
      final path = Path()..moveTo(x, 0);
      path.cubicTo(x + 30, size.height * 0.25, x - 20, size.height * 0.6, x + 18, size.height);
      canvas.drawPath(path, paint);
    }
    for (double y = 20; y < size.height; y += 54) {
      final path = Path()..moveTo(0, y);
      path.cubicTo(size.width * 0.3, y - 20, size.width * 0.65, y + 18, size.width, y - 8);
      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
