import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'widgets/entry_scaffold.dart';

class WelcomeChoiceScreen extends StatelessWidget {
  const WelcomeChoiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return EntryScaffold(
      maxWidth: 420,
      child: Container(
        padding: const EdgeInsets.fromLTRB(24, 26, 24, 28),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(34),
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF0B2A4D),
              Color(0xFF123B6A),
              Color(0xFF0E2744),
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.18),
              blurRadius: 28,
              offset: const Offset(0, 16),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 10),
            const _WelcomeStatusBar(),
            const SizedBox(height: 48),
            Center(
              child: Container(
                width: 82,
                height: 82,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF2F8CFF), Color(0xFF1957C4)],
                  ),
                  borderRadius: BorderRadius.circular(26),
                ),
                child: const Icon(Icons.shield_outlined, color: Colors.white, size: 38),
              ),
            ),
            const SizedBox(height: 26),
            Text(
              'SafeWalk',
              textAlign: TextAlign.center,
              style: theme.textTheme.displaySmall?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Welcome to Your\nSafety Companion',
              textAlign: TextAlign.center,
              style: theme.textTheme.headlineSmall?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                height: 1.2,
              ),
            ),
            const SizedBox(height: 14),
            Text(
              'Experience peace of mind with real-time guardianship and intelligent route monitoring.',
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: Colors.white.withOpacity(0.78),
                height: 1.55,
              ),
            ),
            const SizedBox(height: 36),
            SizedBox(
              height: 54,
              child: FilledButton(
                onPressed: () => context.go('/auth/sign-up'),
                child: const Text('Create Account'),
              ),
            ),
            const SizedBox(height: 14),
            SizedBox(
              height: 54,
              child: OutlinedButton(
                onPressed: () => context.go('/auth/sign-in'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white,
                  side: BorderSide(color: Colors.white.withOpacity(0.28)),
                ),
                child: const Text('Log In'),
              ),
            ),
            const SizedBox(height: 12),
            TextButton(
              onPressed: () => context.go('/home'),
              child: const Text('Enter Demo Mode'),
            ),
            const SizedBox(height: 22),
            Text(
              'SECURED BY GUARDIAN NETWORK',
              textAlign: TextAlign.center,
              style: theme.textTheme.labelSmall?.copyWith(
                color: Colors.white.withOpacity(0.42),
                letterSpacing: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _WelcomeStatusBar extends StatelessWidget {
  const _WelcomeStatusBar();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text('9:41', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
        const Spacer(),
        Container(
          width: 16,
          height: 10,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(999),
            border: Border.all(color: Colors.white70),
          ),
        ),
        const SizedBox(width: 8),
        const Icon(Icons.network_wifi_rounded, color: Colors.white, size: 16),
      ],
    );
  }
}

