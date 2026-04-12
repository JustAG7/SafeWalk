import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../app/router/app_routes.dart';
import '../entry_tokens.dart';
import '../mock/entry_mock_data.dart';
import '../widgets/entry_scaffold.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController(text: 'demo@safewalk.app');
  final _passwordController = TextEditingController(text: 'guardian123');

  bool _obscurePassword = true;
  bool _isSubmitting = false;
  String? _errorText;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    FocusScope.of(context).unfocus();
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _errorText = null;
      _isSubmitting = true;
    });

    await Future<void>.delayed(const Duration(milliseconds: 900));
    if (!mounted) {
      return;
    }

    if (_emailController.text.trim().contains('error')) {
      setState(() {
        _isSubmitting = false;
        _errorText = 'Mock sign-in failed. Use any normal email to continue.';
      });
      return;
    }

    setState(() => _isSubmitting = false);
    await _showSuccessDialog(
      title: 'Signed in locally',
      body: 'You are signed in. We will continue into the permission setup next.',
      primaryLabel: 'Continue to Setup',
      onPrimaryPressed: () => context.go(AppRoutePaths.setupPermissions),
    );
  }

  Future<void> _showForgotDialog() {
    return showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Forgot password?'),
          content: const Text(
            'Password recovery is not available yet. Normally we would send a reset link here.',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _showProviderSheet(MockAuthProviderOption provider) {
    return showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      builder: (sheetContext) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(provider.icon, size: 28),
                    const SizedBox(width: 10),
                    Text(
                      provider.title,
                      style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  provider.message,
                  style: const TextStyle(color: EntryTokens.text, height: 1.5),
                ),
                const SizedBox(height: 20),
                EntryPrimaryButton(
                  label: 'Continue',
                  onPressed: () {
                    Navigator.of(sheetContext).pop();
                    _showSuccessDialog(
                      title: '${provider.title} sign-in',
                      body: 'Provider login is ready. We will move into permission setup next.',
                      primaryLabel: 'Continue to Setup',
                      onPrimaryPressed: () => context.go(AppRoutePaths.setupPermissions),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _showSuccessDialog({
    required String title,
    required String body,
    required String primaryLabel,
    required VoidCallback onPrimaryPressed,
  }) {
    return showDialog<void>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: Text(title),
          content: Text(body),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(),
              child: const Text('Stay Here'),
            ),
            FilledButton(
              onPressed: () {
                Navigator.of(dialogContext).pop();
                onPrimaryPressed();
              },
              child: Text(primaryLabel),
            ),
          ],
        );
      },
    );
  }

  String? _validateEmail(String? value) {
    final text = value?.trim() ?? '';
    if (text.isEmpty) {
      return 'Enter your email.';
    }
    if (!text.contains('@')) {
      return 'Use a valid email address.';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    final text = value ?? '';
    if (text.isEmpty) {
      return 'Enter your password.';
    }
    if (text.length < 6) {
      return 'Use at least 6 characters.';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return EntryScaffold(
      child: EntrySurface(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const EntryStatusBar(dark: false),
              const SizedBox(height: 30),
              const SizedBox(
                width: 52,
                height: 52,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: EntryBrandMark(size: 42, showGlow: false),
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                'Welcome Back',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                  color: EntryTokens.heading,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Sign in to continue your safe journey.',
                style: TextStyle(color: EntryTokens.text, fontSize: 16, height: 1.5),
              ),
              const SizedBox(height: 30),
              EntryInputField(
                label: 'EMAIL ADDRESS',
                controller: _emailController,
                hint: 'name@example.com',
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                validator: _validateEmail,
              ),
              const SizedBox(height: 18),
              Row(
                children: [
                  const EntrySectionLabel('PASSWORD'),
                  const Spacer(),
                  TextButton(
                    onPressed: () => _showForgotDialog(),
                    child: const Text('FORGOT?'),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _passwordController,
                obscureText: _obscurePassword,
                validator: _validatePassword,
                decoration: InputDecoration(
                  hintText: 'password',
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.8),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(color: EntryTokens.fieldBorder),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(color: EntryTokens.fieldBorder),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(color: EntryTokens.focus, width: 1.4),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
                    icon: Icon(_obscurePassword ? Icons.visibility_outlined : Icons.visibility_off_outlined),
                  ),
                ),
              ),
              if (_errorText != null) ...[
                const SizedBox(height: 12),
                Text(
                  _errorText!,
                  style: const TextStyle(color: EntryTokens.danger, fontWeight: FontWeight.w600),
                ),
              ],
              const SizedBox(height: 24),
              EntryPrimaryButton(
                label: 'Log In',
                onPressed: () => _submit(),
                isLoading: _isSubmitting,
              ),
              const SizedBox(height: 28),
              const EntryDividerLabel(label: 'Or continue with'),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: EntrySocialButton(
                      label: 'Apple',
                      icon: mockAuthProviders[0].icon,
                      onPressed: () => _showProviderSheet(mockAuthProviders[0]),
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: EntrySocialButton(
                      label: 'Google',
                      icon: Icons.g_mobiledata_rounded,
                      onPressed: () => _showProviderSheet(mockAuthProviders[1]),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 28),
              EntryFooterPrompt(
                leadingText: 'New to SafeWalk?',
                actionText: 'Create Account',
                onPressed: () => context.go(AppRoutePaths.signUp),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
