import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../core/constants/app_radius.dart';
import '../../../core/constants/app_spacing.dart';
import '../entry_tokens.dart';

enum EntryBackdropStyle { light, dark }

class EntryScaffold extends StatelessWidget {
  const EntryScaffold({
    super.key,
    required this.child,
    this.maxWidth = 420,
    this.backdropStyle = EntryBackdropStyle.light,
    this.padding = const EdgeInsets.symmetric(
      horizontal: AppSpacing.page,
      vertical: AppSpacing.xl,
    ),
  });

  final Widget child;
  final double maxWidth;
  final EntryBackdropStyle backdropStyle;
  final EdgeInsetsGeometry padding;

  bool get _isDark => backdropStyle == EntryBackdropStyle.dark;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _isDark ? EntryTokens.backgroundDark : EntryTokens.backgroundLight,
      body: DecoratedBox(
        decoration: BoxDecoration(
          gradient: _isDark ? EntryTokens.darkBackground : EntryTokens.lightBackground,
        ),
        child: Stack(
          children: [
            Positioned(
              top: -72,
              left: -72,
              child: _GlowOrb(
                size: 220,
                color: _isDark ? EntryTokens.sky.withOpacity(0.14) : const Color(0xFFDCE8FF),
              ),
            ),
            Positioned(
              right: -84,
              bottom: -110,
              child: _GlowOrb(
                size: 260,
                color: _isDark ? const Color(0xFF56E3AE).withOpacity(0.10) : const Color(0xFFCFF5E7),
              ),
            ),
            SafeArea(
              child: Center(
                child: SingleChildScrollView(
                  padding: padding,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: maxWidth),
                    child: child,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EntryGlassPanel extends StatelessWidget {
  const EntryGlassPanel({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(AppSpacing.xl),
    this.radius = 28,
    this.tint = const Color(0xCCFFFFFF),
    this.borderColor = const Color(0x66FFFFFF),
  });

  final Widget child;
  final EdgeInsetsGeometry padding;
  final double radius;
  final Color tint;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 14, sigmaY: 14),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: tint,
            borderRadius: BorderRadius.circular(radius),
            border: Border.all(color: borderColor),
            boxShadow: EntryTokens.glassShadow,
          ),
          child: Padding(
            padding: padding,
            child: child,
          ),
        ),
      ),
    );
  }
}

class EntrySurface extends StatelessWidget {
  const EntrySurface({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(AppSpacing.xl),
  });

  final Widget child;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.88),
        borderRadius: BorderRadius.circular(32),
        border: Border.all(color: const Color(0x1AC3C6CF)),
        boxShadow: EntryTokens.surfaceShadow,
      ),
      child: child,
    );
  }
}

class EntryBrandMark extends StatelessWidget {
  const EntryBrandMark({
    super.key,
    this.size = 84,
    this.showGlow = true,
  });

  final double size;
  final bool showGlow;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size * 0.3),
        gradient: EntryTokens.brandMark,
        boxShadow: showGlow
            ? [
                BoxShadow(
                  color: EntryTokens.sky.withOpacity(0.26),
                  blurRadius: 26,
                  spreadRadius: 1,
                ),
              ]
            : null,
      ),
      child: const Icon(Icons.shield_rounded, color: Colors.white, size: 34),
    );
  }
}

class EntryStatusBar extends StatelessWidget {
  const EntryStatusBar({super.key, required this.dark});

  final bool dark;

  @override
  Widget build(BuildContext context) {
    final color = dark ? Colors.white : EntryTokens.subtle;
    return Row(
      children: [
        Text('9:41', style: TextStyle(color: color, fontWeight: FontWeight.w700)),
        const Spacer(),
        Icon(Icons.network_wifi_rounded, color: color, size: 16),
        const SizedBox(width: 6),
        Icon(Icons.battery_6_bar_rounded, color: color, size: 16),
      ],
    );
  }
}

class EntryInlinePill extends StatelessWidget {
  const EntryInlinePill({
    super.key,
    required this.label,
    this.leading,
    this.foreground = EntryTokens.subtle,
    this.background = const Color(0xFFF1F5FF),
  });

  final String label;
  final Widget? leading;
  final Color foreground;
  final Color background;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(AppRadius.pill),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (leading != null) ...[
              leading!,
              const SizedBox(width: 6),
            ],
            Text(
              label,
              style: TextStyle(
                color: foreground,
                fontSize: 11,
                fontWeight: FontWeight.w700,
                letterSpacing: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EntrySectionLabel extends StatelessWidget {
  const EntrySectionLabel(this.text, {super.key, this.color = EntryTokens.muted});

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: 11,
        fontWeight: FontWeight.w700,
        letterSpacing: 1.4,
      ),
    );
  }
}

class EntryPrimaryButton extends StatelessWidget {
  const EntryPrimaryButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.isLoading = false,
    this.icon = Icons.arrow_forward_rounded,
    this.height = 56,
  });

  final String label;
  final VoidCallback? onPressed;
  final bool isLoading;
  final IconData icon;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: EntryTokens.primaryButton,
          borderRadius: BorderRadius.circular(18),
          boxShadow: EntryTokens.buttonShadow,
        ),
        child: FilledButton(
          onPressed: isLoading ? null : onPressed,
          style: FilledButton.styleFrom(
            backgroundColor: Colors.transparent,
            disabledBackgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            surfaceTintColor: Colors.transparent,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
          ),
          child: isLoading
              ? const SizedBox(
                  width: 22,
                  height: 22,
                  child: CircularProgressIndicator(strokeWidth: 2.2, color: Colors.white),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(label, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
                    const SizedBox(width: 8),
                    Icon(icon, size: 20),
                  ],
                ),
        ),
      ),
    );
  }
}

class EntryOutlineButton extends StatelessWidget {
  const EntryOutlineButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.height = 56,
  });

  final String label;
  final VoidCallback? onPressed;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          foregroundColor: Colors.white,
          side: BorderSide(color: Colors.white.withOpacity(0.22)),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        ),
        child: Text(label, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
      ),
    );
  }
}

class EntryDividerLabel extends StatelessWidget {
  const EntryDividerLabel({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: Divider(color: EntryTokens.line)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            label,
            style: const TextStyle(color: EntryTokens.muted, fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ),
        const Expanded(child: Divider(color: EntryTokens.line)),
      ],
    );
  }
}

class EntrySocialButton extends StatelessWidget {
  const EntrySocialButton({
    super.key,
    required this.label,
    required this.icon,
    required this.onPressed,
  });

  final String label;
  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: OutlinedButton.icon(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.white.withOpacity(0.75),
          foregroundColor: const Color(0xFF111C2D),
          side: const BorderSide(color: EntryTokens.line),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        ),
        icon: Icon(icon, size: 22),
        label: Text(label, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
      ),
    );
  }
}

class EntryInputField extends StatelessWidget {
  const EntryInputField({
    super.key,
    required this.label,
    required this.controller,
    this.hint,
    this.leading,
    this.trailing,
    this.keyboardType,
    this.obscureText = false,
    this.textInputAction,
    this.validator,
  });

  final String label;
  final TextEditingController controller;
  final String? hint;
  final Widget? leading;
  final Widget? trailing;
  final TextInputType? keyboardType;
  final bool obscureText;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        EntrySectionLabel(label),
        const SizedBox(height: 10),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          obscureText: obscureText,
          textInputAction: textInputAction,
          validator: validator,
          decoration: InputDecoration(
            hintText: hint,
            prefixIcon: leading == null
                ? null
                : Padding(
                    padding: const EdgeInsets.only(left: 14, right: 10),
                    child: leading,
                  ),
            prefixIconConstraints: const BoxConstraints(minWidth: 50),
            suffixIcon: trailing,
            fillColor: Colors.white.withOpacity(0.8),
            filled: true,
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
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: EntryTokens.danger),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: EntryTokens.danger, width: 1.4),
            ),
          ),
        ),
      ],
    );
  }
}

class EntryProgressDots extends StatelessWidget {
  const EntryProgressDots({super.key, required this.currentIndex, required this.count});

  final int currentIndex;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(count, (index) {
        final isActive = index == currentIndex;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 220),
          width: isActive ? 28 : 8,
          height: 6,
          margin: const EdgeInsets.symmetric(horizontal: 3),
          decoration: BoxDecoration(
            color: isActive ? EntryTokens.primaryAlt : const Color(0xFFD1D9E6),
            borderRadius: BorderRadius.circular(AppRadius.pill),
          ),
        );
      }),
    );
  }
}

class EntryFooterPrompt extends StatelessWidget {
  const EntryFooterPrompt({
    super.key,
    required this.leadingText,
    required this.actionText,
    required this.onPressed,
  });

  final String leadingText;
  final String actionText;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Text(leadingText, style: const TextStyle(color: EntryTokens.text, fontSize: 16)),
        TextButton(
          onPressed: onPressed,
          child: Text(actionText, style: const TextStyle(fontWeight: FontWeight.w700)),
        ),
      ],
    );
  }
}

class _GlowOrb extends StatelessWidget {
  const _GlowOrb({required this.size, required this.color});

  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: ClipOval(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(width: size, height: size, color: color),
        ),
      ),
    );
  }
}
