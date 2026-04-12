import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../app/router/app_routes.dart';
import '../entry_tokens.dart';
import '../mock/entry_mock_data.dart';
import '../widgets/entry_scaffold.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;
  bool _didNavigate = false;

  @override
  void initState() {
    super.initState();
    _timer = Timer(const Duration(milliseconds: 1600), _continue);
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _continue() {
    if (!mounted || _didNavigate) {
      return;
    }
    _didNavigate = true;
    context.go(AppRoutePaths.onboarding);
  }

  @override
  Widget build(BuildContext context) {
    return EntryScaffold(
      backdropStyle: EntryBackdropStyle.dark,
      child: SizedBox(
        height: 760,
        child: Column(
          children: [
            const EntryStatusBar(dark: true),
            const Spacer(),
            const EntryBrandMark(size: 104),
            const SizedBox(height: 28),
            const Text(
              EntryMockCopy.brandName,
              style: TextStyle(
                color: Colors.white,
                fontSize: 42,
                fontWeight: FontWeight.w800,
                height: 1,
              ),
            ),
            const SizedBox(height: 14),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.circle, size: 8, color: EntryTokens.success),
                SizedBox(width: 10),
                Text(
                  'ACTIVE GUARDIAN',
                  style: TextStyle(
                    color: Color(0xFF8CA1BC),
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 3,
                  ),
                ),
              ],
            ),
            const Spacer(),
            const SizedBox(
              width: 56,
              child: EntryProgressDots(currentIndex: 0, count: 2),
            ),
            const SizedBox(height: 28),
            const Text(
              EntryMockCopy.splashFooter,
              style: TextStyle(
                color: Color(0xFF5C7696),
                fontSize: 12,
                fontWeight: FontWeight.w600,
                letterSpacing: 2.2,
              ),
            ),
            const SizedBox(height: 28),
            TextButton(
              onPressed: _continue,
              child: const Text('Continue', style: TextStyle(color: Colors.white70)),
            ),
          ],
        ),
      ),
    );
  }
}
