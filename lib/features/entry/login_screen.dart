import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'widgets/entry_scaffold.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return EntryScaffold(
      maxWidth: 420,
      child: EntrySurface(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Welcome Back',
              style: theme.textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.w700,
                color: const Color(0xFF113054),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'Sign in to continue your safe journey.',
              style: theme.textTheme.bodyMedium,
            ),
            const SizedBox(height: 24),
            const EntryTextField(
              label: 'EMAIL ADDRESS',
              hint: 'name@example.com',
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16),
            const EntryTextField(
              label: 'PASSWORD',
              hint: '••••••••',
              obscureText: true,
            ),
            const SizedBox(height: 24),
            SizedBox(
              height: 52,
              child: FilledButton(
                onPressed: () => context.go('/home'),
                child: const Text('Log In'),
              ),
            ),
            const SizedBox(height: 12),
            TextButton(
              onPressed: () => context.go('/auth/sign-up'),
              child: const Text('Create account'),
            ),
          ],
        ),
      ),
    );
  }
}
