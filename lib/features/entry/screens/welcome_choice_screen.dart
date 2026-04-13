import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../app/router/app_routes.dart';
import '../mock/entry_mock_data.dart';
import '../widgets/entry_scaffold.dart';

class WelcomeChoiceScreen extends StatelessWidget {
  const WelcomeChoiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return EntryScaffold(
      backdropStyle: EntryBackdropStyle.dark,
      padding: EdgeInsets.zero,
      child: EntryPhoneShell(
        screenGradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF072341), Color(0xFF0C3158), Color(0xFF081F38)],
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: IgnorePointer(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.white.withValues(alpha: 0.06),
                        Colors.transparent,
                        const Color(0xFF56E3AE).withValues(alpha: 0.04),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              right: -34,
              bottom: 90,
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withValues(alpha: 0.04),
                ),
              ),
            ),
            Positioned(
              left: -54,
              bottom: -6,
              child: Container(
                width: 240,
                height: 240,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xFF58D9B0).withValues(alpha: 0.06),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 72, 32, 44),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Center(child: EntryBrandMark(size: 80, showGlow: true)),
                  const SizedBox(height: 28),
                  const Text(
                    EntryMockCopy.brandName,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 48,
                      fontWeight: FontWeight.w800,
                      height: 1,
                      letterSpacing: -2.4,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    EntryMockCopy.brandTagline,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF8EA2BC),
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.3,
                    ),
                  ),
                  const SizedBox(height: 110),
                  const Text(
                    EntryMockCopy.welcomeHeadline,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      height: 1.25,
                      letterSpacing: -0.6,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    EntryMockCopy.welcomeBody,
                    style: TextStyle(
                      color: Color(0xFF9EB1C8),
                      fontSize: 16,
                      height: 1.6,
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    height: 64,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFF2E86FF), Color(0xFF0058BE)],
                        ),
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x802170E4),
                            blurRadius: 24,
                            offset: Offset(0, 12),
                            spreadRadius: -10,
                          ),
                        ],
                      ),
                      child: FilledButton(
                        onPressed: () => context.go(AppRoutePaths.signUp),
                        style: FilledButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          disabledBackgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          surfaceTintColor: Colors.transparent,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: Row(
                          children: [
                            const Expanded(
                              child: Text(
                                'Create Account',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.white.withValues(alpha: 0.12),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Icon(Icons.arrow_forward_rounded, size: 18),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 64,
                    child: OutlinedButton(
                      onPressed: () => context.go(AppRoutePaths.signIn),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.white.withValues(alpha: 0.04),
                        side: BorderSide(color: Colors.white.withValues(alpha: 0.2), width: 1.5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: const Text(
                        'Log In',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  const Text(
                    EntryMockCopy.welcomeFooter,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF7D91AA),
                      fontSize: 11,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 1.1,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

