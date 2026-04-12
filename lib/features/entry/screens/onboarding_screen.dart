import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../app/router/app_routes.dart';
import '../../../core/constants/app_spacing.dart';
import '../entry_tokens.dart';
import '../mock/entry_mock_data.dart';
import '../models/onboarding_slide.dart';
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
      maxWidth: 430,
      child: Column(
        children: [
          const EntryStatusBar(dark: false),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () => context.go(AppRoutePaths.welcome),
              child: const Text('SKIP'),
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          SizedBox(
            height: 720,
            child: PageView.builder(
              controller: _controller,
              itemCount: onboardingSlides.length,
              onPageChanged: (index) => setState(() => _currentIndex = index),
              itemBuilder: (context, index) {
                return _OnboardingSlideCard(
                  slide: onboardingSlides[index],
                  currentIndex: _currentIndex,
                  onNext: _advance,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _OnboardingSlideCard extends StatelessWidget {
  const _OnboardingSlideCard({
    required this.slide,
    required this.currentIndex,
    required this.onNext,
  });

  final OnboardingSlideData slide;
  final int currentIndex;
  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(36),
        color: Colors.white,
        boxShadow: EntryTokens.surfaceShadow,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(36),
        child: Stack(
          children: [
            Positioned.fill(child: _OnboardingArtwork(tone: slide.tone)),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: EntryGlassPanel(
                radius: 34,
                padding: const EdgeInsets.fromLTRB(28, 28, 28, 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        EntryProgressDots(
                          currentIndex: currentIndex,
                          count: onboardingSlides.length,
                        ),
                        const Spacer(),
                        Text(
                          slide.eyebrow,
                          style: const TextStyle(
                            color: Color(0xFF7A8394),
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1.2,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text(
                      slide.title,
                      style: const TextStyle(
                        color: EntryTokens.heading,
                        fontSize: 28,
                        height: 1.1,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 14),
                    Text(
                      slide.body,
                      style: const TextStyle(
                        color: EntryTokens.text,
                        fontSize: 16,
                        height: 1.6,
                      ),
                    ),
                    const SizedBox(height: 28),
                    EntryPrimaryButton(label: slide.actionLabel, onPressed: onNext),
                    const SizedBox(height: 10),
                    Center(
                      child: TextButton(
                        onPressed: () => context.go(AppRoutePaths.welcome),
                        child: const Text('Skip'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OnboardingArtwork extends StatelessWidget {
  const _OnboardingArtwork({required this.tone});

  final EntryArtworkTone tone;

  @override
  Widget build(BuildContext context) {
    switch (tone) {
      case EntryArtworkTone.city:
        return DecoratedBox(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFFDDE6F4), Color(0xFFB8C7DB), Color(0xFFF4F6FB)],
            ),
          ),
          child: Stack(
            children: [
              Positioned.fill(
                child: Opacity(opacity: 0.35, child: CustomPaint(painter: _CityPainter())),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 160,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0x00FFFFFF), Color(0xFFFFFFFF)],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      case EntryArtworkTone.map:
        return DecoratedBox(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFFF2F6FF), Color(0xFFD9E1EE)],
            ),
          ),
          child: Stack(
            children: [
              Positioned.fill(
                child: Opacity(opacity: 0.55, child: CustomPaint(painter: _MapPainter())),
              ),
              Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    EntryGlassPanel(
                      radius: 18,
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CircleAvatar(radius: 15, child: Icon(Icons.person, size: 16)),
                          SizedBox(width: 12),
                          Text(
                            'SHARING WITH\nSarah Miller',
                            style: TextStyle(fontSize: 11, fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 22),
                    Container(
                      width: 78,
                      height: 78,
                      decoration: BoxDecoration(
                        color: EntryTokens.primaryAlt,
                        borderRadius: BorderRadius.circular(999),
                      ),
                      child: const Icon(Icons.location_searching_rounded, color: Colors.white, size: 34),
                    ),
                    const SizedBox(height: 22),
                    const EntryInlinePill(
                      label: 'LIVE TRACKING ACTIVE',
                      leading: Icon(Icons.radio_button_checked_rounded, color: EntryTokens.success, size: 12),
                      foreground: EntryTokens.primaryAlt,
                      background: Color(0xEEFFFFFF),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      case EntryArtworkTone.sos:
        return DecoratedBox(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFFF7F9FF), Color(0xFFF9F9FF)],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const EntryInlinePill(
                label: 'ACTIVE PROTECTION',
                leading: Icon(Icons.verified_user_outlined, color: EntryTokens.success, size: 14),
                foreground: EntryTokens.subtle,
                background: Color(0xFFFFFFFF),
              ),
              const SizedBox(height: 28),
              Container(
                width: 164,
                height: 164,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: EntryTokens.primaryAlt.withOpacity(0.22),
                      blurRadius: 34,
                      spreadRadius: 4,
                    ),
                  ],
                ),
                child: const DecoratedBox(
                  decoration: BoxDecoration(shape: BoxShape.circle, color: EntryTokens.primaryAlt),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.sos_rounded, color: Colors.white, size: 40),
                      SizedBox(height: 8),
                      Text(
                        'SOS',
                        style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w800),
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
}

class _CityPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final buildingPaint = Paint()..color = const Color(0xFF8FA3BC);
    double x = 0;
    final widths = <double>[38, 24, 54, 30, 72, 28, 44];
    for (final width in widths) {
      final height = 150 + (x % 70);
      canvas.drawRect(Rect.fromLTWH(x, size.height - height - 90, width, height), buildingPaint);
      x += width + 14;
    }

    final roadPaint = Paint()
      ..shader = const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFFFFE7B5), Color(0xFFFFD07B)],
      ).createShader(Rect.fromLTWH(0, size.height - 130, size.width, 130));

    final road = Path()
      ..moveTo(0, size.height)
      ..quadraticBezierTo(size.width * 0.35, size.height - 90, size.width, size.height - 40)
      ..lineTo(size.width, size.height)
      ..close();
    canvas.drawPath(road, roadPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _MapPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFFFFFFF)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.15;

    for (double x = -20; x < size.width + 30; x += 34) {
      final path = Path()..moveTo(x, 0);
      path.cubicTo(x + 18, size.height * 0.18, x - 12, size.height * 0.68, x + 10, size.height);
      canvas.drawPath(path, paint);
    }

    for (double y = 18; y < size.height; y += 36) {
      final path = Path()..moveTo(0, y);
      path.quadraticBezierTo(size.width * 0.55, y + 20, size.width, y - 4);
      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
