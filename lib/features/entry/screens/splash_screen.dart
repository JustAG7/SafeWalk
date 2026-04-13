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
      padding: EdgeInsets.zero,
      child: EntryPhoneShell(
        screenGradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF0A2646), Color(0xFF103964), Color(0xFF0A2646)],
        ),
        child: Stack(
          children: [
            Positioned(
              top: 18,
              left: 18,
              child: Container(
                width: 180,
                height: 180,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xFF38D6B5).withValues(alpha: 0.06),
                ),
              ),
            ),
            Positioned(
              right: -60,
              bottom: -20,
              child: Container(
                width: 240,
                height: 240,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xFF57E2B0).withValues(alpha: 0.04),
                ),
              ),
            ),
            const Column(
              children: [
                SizedBox(height: 240),
                EntryBrandMark(size: 96),
                SizedBox(height: 30),
                Text(
                  EntryMockCopy.brandName,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 44,
                    fontWeight: FontWeight.w800,
                    height: 1,
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.circle, size: 7, color: EntryTokens.success),
                    SizedBox(width: 10),
                    Text(
                      'ACTIVE GUARDIAN',
                      style: TextStyle(
                        color: Color(0xFF8FA3C0),
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 3.2,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                SizedBox(
                  width: 34,
                  child: EntryProgressDots(currentIndex: 0, count: 2),
                ),
                SizedBox(height: 32),
                Text(
                  EntryMockCopy.splashFooter,
                  style: TextStyle(
                    color: Color(0xFF5D799C),
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 2.2,
                  ),
                ),
                SizedBox(height: 52),
              ],
            ),
            Positioned.fill(
              child: Material(
                color: Colors.transparent,
                child: InkWell(onTap: _continue),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

