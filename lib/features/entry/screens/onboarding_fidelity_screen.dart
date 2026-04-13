import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../app/router/app_routes.dart';
import '../entry_tokens.dart';
import '../mock/entry_mock_data.dart';
import '../widgets/entry_scaffold.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late final PageController _controller;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = PageController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _advance() {
    if (_currentIndex == onboardingSlides.length - 1) {
      context.go(AppRoutePaths.welcome);
      return;
    }
    _controller.nextPage(
      duration: const Duration(milliseconds: 280),
      curve: Curves.easeOutCubic,
    );
  }

  @override
  Widget build(BuildContext context) {
    return EntryScaffold(
      padding: EdgeInsets.zero,
      child: SizedBox(
        width: 390,
        height: 844,
        child: PageView(
          controller: _controller,
          onPageChanged: (index) => setState(() => _currentIndex = index),
          children: [
            _CitySlide(currentIndex: _currentIndex, onNext: _advance),
            _MapSlide(currentIndex: _currentIndex, onNext: _advance),
            _SosSlide(currentIndex: _currentIndex, onNext: _advance),
          ],
        ),
      ),
    );
  }
}

class _CitySlide extends StatelessWidget {
  const _CitySlide({required this.currentIndex, required this.onNext});

  final int currentIndex;
  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    final slide = onboardingSlides[0];
    return EntryPhoneShell(
      screenColor: const Color(0xFFF4F7FF),
      child: Stack(
        children: [
          Positioned.fill(child: CustomPaint(painter: _CitySlidePainter())),
          Positioned(
            left: 40,
            right: 40,
            bottom: 94,
            child: EntryGlassPanel(
              radius: 34,
              tint: const Color(0xEBFFFFFF),
              padding: const EdgeInsets.fromLTRB(26, 24, 26, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      EntryProgressDots(currentIndex: currentIndex, count: onboardingSlides.length),
                      const Spacer(),
                      const Text('SLIDE 1 OF 3', style: TextStyle(color: Color(0xFF808791), fontSize: 11, fontWeight: FontWeight.w700, letterSpacing: 1.4)),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Text(slide.title, style: const TextStyle(color: EntryTokens.heading, fontSize: 31, fontWeight: FontWeight.w800, height: 1.1)),
                  const SizedBox(height: 14),
                  Text(slide.body, style: const TextStyle(color: EntryTokens.text, fontSize: 16, height: 1.65)),
                  const SizedBox(height: 28),
                  EntryPrimaryButton(label: slide.actionLabel, onPressed: onNext),
                  const SizedBox(height: 12),
                  Center(
                    child: TextButton(
                      onPressed: () => context.go(AppRoutePaths.welcome),
                      child: const Text('SKIP', style: TextStyle(fontWeight: FontWeight.w700, letterSpacing: 1.1)),
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

class _MapSlide extends StatelessWidget {
  const _MapSlide({required this.currentIndex, required this.onNext});

  final int currentIndex;
  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    final slide = onboardingSlides[1];
    return EntryPhoneShell(
      screenColor: const Color(0xFFF4F7FF),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(26, 28, 26, 26),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () => context.go(AppRoutePaths.welcome),
                child: const Text('SKIP', style: TextStyle(fontWeight: FontWeight.w700, letterSpacing: 1.1)),
              ),
            ),
            Container(
              width: 310,
              height: 380,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(28),
                gradient: const LinearGradient(colors: [Color(0xFFC2CCD9), Color(0xFFB2BECC)]),
              ),
              child: Stack(
                children: [
                  Positioned.fill(child: Opacity(opacity: 0.6, child: CustomPaint(painter: _MapGridPainter()))),
                  const Positioned(
                    top: 40,
                    left: 24,
                    right: 24,
                    child: EntryGlassPanel(
                      radius: 18,
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      child: Row(
                        children: [
                          CircleAvatar(radius: 18, child: Icon(Icons.person, size: 18)),
                          SizedBox(width: 12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('SHARING WITH', style: TextStyle(fontSize: 10, fontWeight: FontWeight.w700, color: EntryTokens.subtle, letterSpacing: 0.8)),
                              Text('Sarah Miller', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800, color: EntryTokens.heading)),
                            ],
                          ),
                          Spacer(),
                          Icon(Icons.circle, size: 9, color: EntryTokens.success),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    top: 144,
                    child: Center(
                      child: Container(
                        width: 78,
                        height: 78,
                        decoration: BoxDecoration(color: EntryTokens.primary, borderRadius: BorderRadius.circular(999)),
                        child: const Icon(Icons.route_rounded, color: Colors.white, size: 34),
                      ),
                    ),
                  ),
                  const Positioned(
                    left: 0,
                    right: 0,
                    bottom: 42,
                    child: Center(
                      child: EntryInlinePill(
                        label: 'LIVE TRACKING ACTIVE',
                        leading: Icon(Icons.radio_button_checked_rounded, color: EntryTokens.sky, size: 12),
                        foreground: EntryTokens.primaryAlt,
                        background: Color(0xEFFFFFFF),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            EntryProgressDots(currentIndex: currentIndex, count: onboardingSlides.length),
            const SizedBox(height: 28),
            Text(slide.title, textAlign: TextAlign.center, style: const TextStyle(color: EntryTokens.heading, fontSize: 31, fontWeight: FontWeight.w800, height: 1.12)),
            const SizedBox(height: 14),
            Text(slide.body, textAlign: TextAlign.center, style: const TextStyle(color: EntryTokens.text, fontSize: 16, height: 1.65)),
            const Spacer(),
            EntryPrimaryButton(label: slide.actionLabel, onPressed: onNext),
            const SizedBox(height: 22),
          ],
        ),
      ),
    );
  }
}

class _SosSlide extends StatelessWidget {
  const _SosSlide({required this.currentIndex, required this.onNext});

  final int currentIndex;
  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    final slide = onboardingSlides[2];
    return EntryPhoneShell(
      screenColor: const Color(0xFFF9FAFF),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(28, 28, 28, 28),
        child: Column(
          children: [
            const Align(
              alignment: Alignment.topCenter,
              child: EntryInlinePill(
                label: 'ACTIVE PROTECTION',
                leading: Icon(Icons.shield_outlined, color: EntryTokens.success, size: 13),
                foreground: EntryTokens.subtle,
                background: Colors.white,
              ),
            ),
            const SizedBox(height: 28),
            Stack(
              alignment: Alignment.center,
              children: [
                Container(width: 208, height: 208, decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: const Color(0xFFE5EAF2)))),
                Container(
                  width: 160,
                  height: 160,
                  decoration: BoxDecoration(shape: BoxShape.circle, color: EntryTokens.primary, boxShadow: [BoxShadow(color: EntryTokens.primary.withValues(alpha: 0.18), blurRadius: 28, spreadRadius: 2)]),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.warning_amber_rounded, color: Colors.white, size: 40),
                      SizedBox(height: 8),
                      Text('SOS', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w800)),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),
            const Align(
              alignment: Alignment.centerLeft,
              child: EntryInlinePill(
                label: 'REAL-TIME LOCATION',
                leading: Icon(Icons.location_on_outlined, color: EntryTokens.sky, size: 13),
                foreground: EntryTokens.subtle,
                background: Colors.white,
              ),
            ),
            const SizedBox(height: 70),
            Text(slide.title, textAlign: TextAlign.center, style: const TextStyle(color: EntryTokens.heading, fontSize: 31, fontWeight: FontWeight.w800, height: 1.16)),
            const SizedBox(height: 16),
            Text(slide.body, textAlign: TextAlign.center, style: const TextStyle(color: EntryTokens.text, fontSize: 16, height: 1.65)),
            const SizedBox(height: 24),
            EntryProgressDots(currentIndex: currentIndex, count: onboardingSlides.length),
            const Spacer(),
            EntryPrimaryButton(label: slide.actionLabel, onPressed: onNext),
            const SizedBox(height: 18),
            const Text('STEP 3 OF 3 - FULLY ENCRYPTED', style: TextStyle(color: Color(0xFF8A909C), fontSize: 11, fontWeight: FontWeight.w700, letterSpacing: 1.4)),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}

class _CitySlidePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final sky = Paint()..shader = const LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Color(0xFFDCE7F6), Color(0xFFBFCCDA), Color(0xFFF7F8FB)]).createShader(Offset.zero & size);
    canvas.drawRect(Offset.zero & size, sky);
    final buildings = Paint()..color = const Color(0xFFB7C5D4);
    final towers = <Rect>[
      const Rect.fromLTWH(18, 92, 52, 260),
      const Rect.fromLTWH(92, 130, 34, 210),
      const Rect.fromLTWH(150, 70, 58, 270),
      const Rect.fromLTWH(228, 88, 104, 260),
    ];
    for (final tower in towers) {
      canvas.drawRect(tower, buildings);
    }
    final road = Path()
      ..moveTo(0, size.height)
      ..quadraticBezierTo(size.width * 0.32, size.height - 84, size.width, size.height - 30)
      ..lineTo(size.width, size.height)
      ..close();
    final roadPaint = Paint()..shader = const LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Color(0xFFF6D189), Color(0xFFF1BD67)]).createShader(Rect.fromLTWH(0, size.height - 180, size.width, 180));
    canvas.drawPath(road, roadPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _MapGridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xE8FFFFFF)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.1;
    for (double x = -18; x < size.width + 24; x += 34) {
      final path = Path()..moveTo(x, 0);
      path.cubicTo(x + 18, size.height * 0.18, x - 12, size.height * 0.68, x + 10, size.height);
      canvas.drawPath(path, paint);
    }
    for (double y = 14; y < size.height; y += 38) {
      final path = Path()..moveTo(0, y);
      path.quadraticBezierTo(size.width * 0.55, y + 18, size.width, y - 6);
      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

