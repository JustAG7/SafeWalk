import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/constants/app_radius.dart';
import '../../core/constants/app_spacing.dart';
import 'widgets/entry_scaffold.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _index = 0;

  static const _slides = [
    _OnboardingSlide(
      title: 'Navigate with Confidence',
      body: 'Our AI finds the safest, most well-lit routes for your journey at any hour.',
      eyebrow: 'Slide 1 of 3',
      actionLabel: 'Next',
      icon: Icons.route_rounded,
      tone: _SlideTone.mist,
    ),
    _OnboardingSlide(
      title: 'Share your Journey',
      body: 'Let trusted contacts follow your progress in real time until you arrive safely.',
      eyebrow: 'Live tracking active',
      actionLabel: 'Next',
      icon: Icons.share_location_rounded,
      tone: _SlideTone.map,
    ),
    _OnboardingSlide(
      title: 'Instant SOS Protection',
      body: 'One tap can alert emergency services and your contacts if you ever feel unsafe.',
      eyebrow: 'Active protection',
      actionLabel: 'Get Started',
      icon: Icons.sos_rounded,
      tone: _SlideTone.clean,
    ),
  ];

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _next(BuildContext context) {
    if (_index < _slides.length - 1) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 280),
        curve: Curves.easeOut,
      );
      return;
    }
    context.go('/entry/welcome');
  }

  @override
  Widget build(BuildContext context) {
    return EntryScaffold(
      maxWidth: 420,
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () => context.go('/entry/welcome'),
              child: const Text('SKIP'),
            ),
          ),
          SizedBox(
            height: 680,
            child: PageView.builder(
              controller: _controller,
              onPageChanged: (value) => setState(() => _index = value),
              itemCount: _slides.length,
              itemBuilder: (context, index) {
                final slide = _slides[index];
                return _OnboardingSlideView(
                  slide: slide,
                  currentIndex: _index,
                  count: _slides.length,
                  onNext: () => _next(context),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _OnboardingSlideView extends StatelessWidget {
  const _OnboardingSlideView({
    required this.slide,
    required this.currentIndex,
    required this.count,
    required this.onNext,
  });

  final _OnboardingSlide slide;
  final int currentIndex;
  final int count;
  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Column(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(34),
              border: Border.all(color: colorScheme.outlineVariant),
              boxShadow: [
                BoxShadow(
                  color: colorScheme.shadow.withOpacity(0.12),
                  blurRadius: 26,
                  offset: const Offset(0, 14),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  flex: 11,
                  child: _OnboardingArtwork(slide: slide),
                ),
                Expanded(
                  flex: 9,
                  child: Container(
                    margin: const EdgeInsets.all(14),
                    padding: const EdgeInsets.fromLTRB(20, 18, 20, 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(28),
                      boxShadow: [
                        BoxShadow(
                          color: colorScheme.shadow.withOpacity(0.08),
                          blurRadius: 18,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          slide.eyebrow.toUpperCase(),
                          style: theme.textTheme.labelSmall?.copyWith(
                            letterSpacing: 1.2,
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                        const SizedBox(height: 14),
                        Text(
                          slide.title,
                          style: theme.textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.w700,
                            color: const Color(0xFF113054),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          slide.body,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                            height: 1.5,
                          ),
                        ),
                        const Spacer(),
                        EntryCarouselDots(currentIndex: currentIndex, count: count),
                        const SizedBox(height: 18),
                        SizedBox(
                          width: double.infinity,
                          height: 52,
                          child: FilledButton(
                            onPressed: onNext,
                            child: Text('${slide.actionLabel}  ?'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _OnboardingArtwork extends StatelessWidget {
  const _OnboardingArtwork({required this.slide});

  final _OnboardingSlide slide;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    BoxDecoration decoration;
    Widget foreground;

    switch (slide.tone) {
      case _SlideTone.mist:
        decoration = BoxDecoration(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(34)),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              const Color(0xFFE9EEF7),
              colorScheme.surface,
            ],
          ),
        );
        foreground = Stack(
          children: [
            Positioned.fill(
              child: Opacity(
                opacity: 0.26,
                child: CustomPaint(painter: _SkylinePainter()),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                width: 86,
                height: 86,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.88),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.route_rounded, size: 40, color: Color(0xFF103359)),
              ),
            ),
          ],
        );
      case _SlideTone.map:
        decoration = BoxDecoration(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(34)),
          color: const Color(0xFFD7DEE8),
        );
        foreground = Stack(
          children: [
            Positioned.fill(
              child: Opacity(
                opacity: 0.55,
                child: CustomPaint(painter: _MapPainter()),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.92),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircleAvatar(radius: 12, child: Icon(Icons.person, size: 14)),
                        SizedBox(width: 10),
                        Text('Sharing with\nSarah Miller'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 22),
                  Container(
                    width: 86,
                    height: 86,
                    decoration: const BoxDecoration(
                      color: Color(0xFF113054),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.location_searching_rounded, color: Colors.white, size: 36),
                  ),
                ],
              ),
            ),
          ],
        );
      case _SlideTone.clean:
        decoration = const BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(34)),
          color: Color(0xFFF7F9FC),
        );
        foreground = Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const EntryChip(label: 'ACTIVE PROTECTION', icon: Icons.verified_user_outlined),
            const SizedBox(height: 24),
            Container(
              width: 140,
              height: 140,
              decoration: BoxDecoration(
                color: const Color(0xFF113054),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF113054).withOpacity(0.18),
                    blurRadius: 28,
                    offset: const Offset(0, 16),
                  ),
                ],
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.sos_rounded, color: Colors.white, size: 34),
                  SizedBox(height: 8),
                  Text('SOS', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 24)),
                ],
              ),
            ),
          ],
        );
    }

    return Container(
      decoration: decoration,
      child: foreground,
    );
  }
}

class _OnboardingSlide {
  const _OnboardingSlide({
    required this.title,
    required this.body,
    required this.eyebrow,
    required this.actionLabel,
    required this.icon,
    required this.tone,
  });

  final String title;
  final String body;
  final String eyebrow;
  final String actionLabel;
  final IconData icon;
  final _SlideTone tone;
}

enum _SlideTone { mist, map, clean }

class _SkylinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = const Color(0xFF8DA0B6);
    final widths = [24.0, 40.0, 34.0, 56.0, 42.0, 28.0];
    double x = 14;
    for (final width in widths) {
      final height = 120 + (x % 60);
      canvas.drawRect(Rect.fromLTWH(x, size.height - height, width, height), paint);
      x += width + 18;
    }
    final roadPaint = Paint()
      ..shader = const LinearGradient(
        colors: [Color(0xFFFFE9B2), Color(0xFFFFC86B)],
      ).createShader(Rect.fromLTWH(0, size.height - 80, size.width, 80));
    final path = Path()
      ..moveTo(0, size.height)
      ..quadraticBezierTo(size.width * 0.35, size.height - 100, size.width, size.height - 20)
      ..lineTo(size.width, size.height)
      ..close();
    canvas.drawPath(path, roadPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _MapPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.55)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.2;
    for (double x = 0; x < size.width; x += 34) {
      final path = Path()..moveTo(x, 0);
      path.cubicTo(x + 18, size.height * 0.2, x - 8, size.height * 0.6, x + 10, size.height);
      canvas.drawPath(path, paint);
    }
    for (double y = 18; y < size.height; y += 38) {
      canvas.drawArc(Rect.fromLTWH(-20, y, size.width + 40, 32), 0.1, 2.8, false, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

