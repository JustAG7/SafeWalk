import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../app/router/app_routes.dart';
import '../entry_tokens.dart';
import '../widgets/entry_scaffold.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  bool _isSubmitting = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  String? _required(String? value, String field) {
    if ((value ?? '').trim().isEmpty) {
      return 'Enter your $field.';
    }
    return null;
  }

  String? _emailValidator(String? value) {
    final required = _required(value, 'email');
    if (required != null) {
      return required;
    }
    if (!(value ?? '').contains('@')) {
      return 'Use a valid email address.';
    }
    return null;
  }

  String? _passwordValidator(String? value) {
    final required = _required(value, 'password');
    if (required != null) {
      return required;
    }
    if ((value ?? '').length < 6) {
      return 'Use at least 6 characters.';
    }
    return null;
  }

  String? _confirmPasswordValidator(String? value) {
    final required = _required(value, 'confirmation password');
    if (required != null) {
      return required;
    }
    if (value != _passwordController.text) {
      return 'Passwords do not match.';
    }
    return null;
  }

  Future<void> _submit() async {
    FocusScope.of(context).unfocus();
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() => _isSubmitting = true);
    await Future<void>.delayed(const Duration(milliseconds: 900));
    if (!mounted) {
      return;
    }
    setState(() => _isSubmitting = false);

    await showDialog<void>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('Account created'),
          content: Text(
            'Welcome, ${_nameController.text.trim().isEmpty ? 'Guardian' : _nameController.text.trim()}! Your account is ready. Next up is the permission setup.',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(dialogContext).pop();
                context.go(AppRoutePaths.welcome);
              },
              child: const Text('Back to Welcome'),
            ),
            FilledButton(
              onPressed: () {
                Navigator.of(dialogContext).pop();
                context.go(AppRoutePaths.setupPermissions);
              },
              child: const Text('Continue to Setup'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return EntryScaffold(
      padding: EdgeInsets.zero,
      child: EntryPhoneShell(
        screenColor: const Color(0xFFF8FAFF),
        child: Stack(
          children: [
            Positioned(
              right: -64,
              top: -110,
              child: Container(
                width: 230,
                height: 230,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xFFDCE7FF).withValues(alpha: 0.38),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 28, 24, 28),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () => context.go(AppRoutePaths.welcome),
                          icon: const Icon(Icons.arrow_back_rounded),
                        ),
                        const Spacer(),
                        const EntryInlinePill(
                          label: 'SECURE SESSION',
                          leading: Icon(Icons.circle, color: EntryTokens.success, size: 8),
                          background: Color(0xFFF8FCFF),
                        ),
                      ],
                    ),
                    const SizedBox(height: 18),
                    const Text(
                      'Create Your\nAccount',
                      style: TextStyle(color: EntryTokens.heading, fontSize: 30, fontWeight: FontWeight.w800, height: 1.12),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'Join SafeWalk to start your journey with the peace of mind you deserve.',
                      style: TextStyle(color: EntryTokens.text, fontSize: 16, height: 1.55),
                    ),
                    const SizedBox(height: 28),
                    EntryInputField(
                      label: 'FULL NAME',
                      controller: _nameController,
                      hint: 'John Doe',
                      leading: const Icon(Icons.person_outline_rounded, color: Color(0xFF7C93B3)),
                      textInputAction: TextInputAction.next,
                      validator: (value) => _required(value, 'full name'),
                    ),
                    const SizedBox(height: 16),
                    EntryInputField(
                      label: 'EMAIL ADDRESS',
                      controller: _emailController,
                      hint: 'john@example.com',
                      leading: const Icon(Icons.alternate_email_rounded, color: Color(0xFF7C93B3)),
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      validator: _emailValidator,
                    ),
                    const SizedBox(height: 16),
                    EntryInputField(
                      label: 'PASSWORD',
                      controller: _passwordController,
                      hint: 'password',
                      leading: const Icon(Icons.lock_outline_rounded, color: Color(0xFF7C93B3)),
                      obscureText: _obscurePassword,
                      textInputAction: TextInputAction.next,
                      validator: _passwordValidator,
                      trailing: IconButton(
                        onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
                        icon: Icon(_obscurePassword ? Icons.visibility_outlined : Icons.visibility_off_outlined),
                      ),
                    ),
                    const SizedBox(height: 16),
                    EntryInputField(
                      label: 'CONFIRM PASSWORD',
                      controller: _confirmPasswordController,
                      hint: 'password',
                      leading: const Icon(Icons.verified_user_outlined, color: Color(0xFF7C93B3)),
                      obscureText: _obscureConfirmPassword,
                      textInputAction: TextInputAction.done,
                      validator: _confirmPasswordValidator,
                      trailing: IconButton(
                        onPressed: () => setState(() => _obscureConfirmPassword = !_obscureConfirmPassword),
                        icon: Icon(_obscureConfirmPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined),
                      ),
                    ),
                    const SizedBox(height: 18),
                    const Text(
                      'By creating an account, you agree to our terms and privacy policy.',
                      style: TextStyle(color: EntryTokens.muted, fontSize: 13, height: 1.45),
                    ),
                    const SizedBox(height: 24),
                    EntryPrimaryButton(label: 'Create Account', onPressed: () => _submit(), isLoading: _isSubmitting),
                    const Spacer(),
                    EntryFooterPrompt(
                      leadingText: 'Already have an account?',
                      actionText: 'Log In',
                      onPressed: () => context.go(AppRoutePaths.signIn),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

