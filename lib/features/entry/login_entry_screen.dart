import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'widgets/entry_scaffold.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return EntryScaffold(
      child: EntrySurface(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Welcome Back',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 16),
            const EntryTextField(label: 'Email', hint: 'name@example.com'),
            const SizedBox(height: 12),
            const EntryTextField(label: 'Password', hint: 'password', obscureText: true),
            const SizedBox(height: 20),
            FilledButton(
              onPressed: () => context.go('/home'),
              child: const Text('Log In'),
            ),
          ],
        ),
      ),
    );
  }
}
