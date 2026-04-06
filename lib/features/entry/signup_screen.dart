import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'widgets/entry_scaffold.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return EntryScaffold(
      maxWidth: 420,
      child: EntrySurface(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () => context.go('/entry/welcome'),
                  icon: const Icon(Icons.arrow_back_rounded),
                ),
                const Spacer(),
              ],
            ),
            Text(
              'Create Account',
              style: theme.textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.w700,
                color: const Color(0xFF113054),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'Join SafeWalk to start your journey with more peace of mind.',
              style: theme.textTheme.bodyMedium,
            ),
            const SizedBox(height: 24),
            const EntryTextField(
              label: 'FULL NAME',
              hint: 'John Doe',
              icon: Icons.person_outline_rounded,
            ),
            const SizedBox(height: 16),
            const EntryTextField(
              label: 'EMAIL ADDRESS',
              hint: 'john@example.com',
              icon: Icons.alternate_email_rounded,
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16),
            const EntryTextField(
              label: 'PASSWORD',
              hint: '••••••••',
              icon: Icons.lock_outline_rounded,
              obscureText: true,
            ),
            const SizedBox(height: 16),
            const EntryTextField(
              label: 'CONFIRM PASSWORD',
              hint: '••••••••',
              icon: Icons.verified_outlined,
              obscureText: true,
            ),
            const SizedBox(height: 24),
            SizedBox(
              height: 52,
              child: FilledButton(
                onPressed: () => context.go('/home'),
                child: const Text('Create Account'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
