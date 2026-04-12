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
      child: Container(
        height: 760,
        padding: const EdgeInsets.fromLTRB(28, 22, 28, 26),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(36),
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF072341), Color(0xFF0B2D53), Color(0xFF081F38)],
          ),
          boxShadow: const [
            BoxShadow(
              color: Color(0x26000000),
              blurRadius: 32,
              offset: Offset(0, 18),
            ),
          ],
        ),
        child: Stack(
          children: [
            Positioned(
              right: 8,
              top: 220,
              child: Container(
                width: 124,
                height: 124,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.05),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned(
              left: -40,
              bottom: -10,
              child: Container(
                width: 220,
                height: 220,
                decoration: BoxDecoration(
                  color: const Color(0xFF58D9B0).withOpacity(0.05),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const EntryStatusBar(dark: true),
                const SizedBox(height: 42),
                const Center(child: EntryBrandMark(size: 80, showGlow: false)),
                const SizedBox(height: 28),
                const Text(
                  EntryMockCopy.brandName,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.w800,
                    height: 1,
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  EntryMockCopy.brandTagline,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF8BA1BC),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1.3,
                  ),
                ),
                const SizedBox(height: 56),
                const Text(
                  EntryMockCopy.welcomeHeadline,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.w800,
                    height: 1.18,
                  ),
                ),
                const SizedBox(height: 18),
                const Text(
                  EntryMockCopy.welcomeBody,
                  style: TextStyle(
                    color: Color(0xFFA7B8CC),
                    fontSize: 17,
                    height: 1.6,
                  ),
                ),
                const Spacer(),
                EntryPrimaryButton(
                  label: 'Create Account',
                  onPressed: () => context.go(AppRoutePaths.signUp),
                ),
                const SizedBox(height: 14),
                EntryOutlineButton(
                  label: 'Log In',
                  onPressed: () => context.go(AppRoutePaths.signIn),
                ),
                const SizedBox(height: 18),
                const Text(
                  EntryMockCopy.welcomeFooter,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF7E93AE),
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 2,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
