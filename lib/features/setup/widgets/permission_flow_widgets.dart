import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_radius.dart';
import '../../../core/constants/app_spacing.dart';
import '../../../shared/widgets/primary_button.dart';
import '../../../shared/widgets/secondary_button.dart';
import '../models/permission_step.dart';

class PermissionStepTemplate extends StatelessWidget {
  const PermissionStepTemplate({
    super.key,
    required this.stepData,
    required this.onBack,
    required this.onPrimaryPressed,
    required this.onSecondaryPressed,
    required this.onLearnMorePressed,
    required this.isSubmitting,
  });

  final PermissionStepData stepData;
  final VoidCallback onBack;
  final VoidCallback onPrimaryPressed;
  final VoidCallback onSecondaryPressed;
  final VoidCallback onLearnMorePressed;
  final bool isSubmitting;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            const Color(0xFFF8FAFF),
            _toneBase(stepData.visualTone).withValues(alpha: 0.08),
            Colors.white,
          ],
        ),
      ),
      child: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(18, 12, 18, 24),
              child: Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: 430,
                    minHeight: constraints.maxHeight,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _PermissionTopBar(
                        currentStep: stepData.step,
                        totalSteps: stepData.totalSteps,
                        onBack: onBack,
                      ),
                      const SizedBox(height: AppSpacing.lg),
                      _PermissionHeroCard(stepData: stepData),
                      const SizedBox(height: AppSpacing.xl),
                      Text(
                        stepData.title,
                        style: theme.textTheme.headlineMedium?.copyWith(
                          color: AppColors.trustNavy,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: AppSpacing.sm),
                      Text(
                        stepData.description,
                        style: theme.textTheme.bodyLarge?.copyWith(
                          color: AppColors.textSecondary,
                        ),
                      ),
                      const SizedBox(height: AppSpacing.lg),
                      ...stepData.highlights.map(
                        (item) => Padding(
                          padding: const EdgeInsets.only(bottom: AppSpacing.sm),
                          child: _PermissionBenefitCard(
                            benefit: item,
                            accentColor: _toneBase(stepData.visualTone),
                          ),
                        ),
                      ),
                      if (stepData.privacyFootnote != null) ...[
                        const SizedBox(height: AppSpacing.xs),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: _SupportPill(
                            label: stepData.privacyFootnote!,
                            icon: Icons.verified_user_outlined,
                          ),
                        ),
                      ],
                      const SizedBox(height: AppSpacing.lg),
                      _InfoActionCard(
                        title: 'Why this matters',
                        subtitle: 'See how this permission affects your safety flow.',
                        onTap: onLearnMorePressed,
                      ),
                      const SizedBox(height: AppSpacing.xxl),
                      PrimaryButton(
                        label: stepData.primaryLabel,
                        icon: Icons.arrow_forward_rounded,
                        onPressed: onPrimaryPressed,
                        isLoading: isSubmitting,
                        expanded: true,
                        height: 54,
                      ),
                      const SizedBox(height: AppSpacing.md),
                      SecondaryButton(
                        label: stepData.secondaryLabel,
                        onPressed: isSubmitting ? null : onSecondaryPressed,
                        expanded: true,
                        height: 54,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class PermissionLearnMoreSheet extends StatelessWidget {
  const PermissionLearnMoreSheet({
    super.key,
    required this.stepData,
  });

  final PermissionStepData stepData;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: _toneBase(stepData.visualTone).withValues(alpha: 0.14),
                    borderRadius: BorderRadius.circular(AppRadius.md),
                  ),
                  child: Icon(stepData.icon, color: _toneBase(stepData.visualTone)),
                ),
                const SizedBox(width: AppSpacing.md),
                Expanded(
                  child: Text(
                    stepData.learnMoreTitle,
                    style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800),
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.lg),
            Text(
              stepData.learnMoreBody,
              style: theme.textTheme.bodyLarge?.copyWith(
                color: AppColors.textSecondary,
                height: 1.55,
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
            ...stepData.highlights.map(
              (item) => Padding(
                padding: const EdgeInsets.only(bottom: AppSpacing.sm),
                child: _PermissionBenefitCard(
                  benefit: item,
                  accentColor: _toneBase(stepData.visualTone),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SuccessSummaryCard extends StatelessWidget {
  const SuccessSummaryCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(22),
      child: Ink(
        padding: const EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(
          color: const Color(0xFFEFF3FB),
          borderRadius: BorderRadius.circular(22),
          border: Border.all(color: const Color(0xFFD9E3F1)),
        ),
        child: Row(
          children: [
            Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Icon(icon, color: AppColors.safeGreen, size: 20),
            ),
            const SizedBox(width: AppSpacing.md),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: theme.textTheme.labelMedium?.copyWith(
                      color: AppColors.textMuted,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: theme.textTheme.titleSmall?.copyWith(
                      color: AppColors.trustNavy,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(Icons.chevron_right_rounded, color: AppColors.textMuted),
          ],
        ),
      ),
    );
  }
}

class PermissionSuccessSheet extends StatelessWidget {
  const PermissionSuccessSheet({
    super.key,
    required this.title,
    required this.body,
  });

  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: AppSpacing.md),
            Text(
              body,
              style: theme.textTheme.bodyLarge?.copyWith(
                color: AppColors.textSecondary,
                height: 1.55,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PermissionTopBar extends StatelessWidget {
  const _PermissionTopBar({
    required this.currentStep,
    required this.totalSteps,
    required this.onBack,
  });

  final int currentStep;
  final int totalSteps;
  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      children: [
        IconButton(
          onPressed: onBack,
          icon: const Icon(Icons.arrow_back_rounded),
        ),
        const SizedBox(width: 4),
        Text(
          'SafeWalk',
          style: theme.textTheme.titleMedium?.copyWith(
            color: AppColors.trustNavy,
            fontWeight: FontWeight.w800,
          ),
        ),
        const Spacer(),
        Text(
          'STEP $currentStep OF $totalSteps',
          style: theme.textTheme.labelSmall?.copyWith(
            color: AppColors.textMuted,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}

class _PermissionHeroCard extends StatelessWidget {
  const _PermissionHeroCard({
    required this.stepData,
  });

  final PermissionStepData stepData;

  @override
  Widget build(BuildContext context) {
    final accent = _toneBase(stepData.visualTone);
    final surface = accent.withValues(alpha: 0.08);

    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: const Color(0xFFE5EBF5)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x140B1220),
            blurRadius: 30,
            offset: Offset(0, 18),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: AppSpacing.sm),
            decoration: BoxDecoration(
              color: surface,
              borderRadius: BorderRadius.circular(AppRadius.lg),
            ),
            child: Row(
              children: [
                _SupportPill(label: stepData.eyebrow, icon: Icons.lock_outline_rounded),
                const Spacer(),
                if (stepData.visualTone == PermissionVisualTone.background)
                  const _SupportPill(label: 'Active Guardian', icon: Icons.shield_rounded),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          _PermissionIllustration(
            icon: stepData.icon,
            tone: stepData.visualTone,
          ),
        ],
      ),
    );
  }
}

class _PermissionIllustration extends StatelessWidget {
  const _PermissionIllustration({
    required this.icon,
    required this.tone,
  });

  final IconData icon;
  final PermissionVisualTone tone;

  @override
  Widget build(BuildContext context) {
    final accent = _toneBase(tone);

    return SizedBox(
      height: 150,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 132,
            height: 132,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [accent.withValues(alpha: 0.14), accent.withValues(alpha: 0.03)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          Container(
            width: 94,
            height: 94,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(28),
              boxShadow: [
                BoxShadow(
                  color: accent.withValues(alpha: 0.18),
                  blurRadius: 22,
                  offset: const Offset(0, 12),
                ),
              ],
            ),
            child: Icon(icon, size: 42, color: accent),
          ),
          Positioned(
            top: 20,
            right: 72,
            child: _PulseDot(color: accent),
          ),
          if (tone == PermissionVisualTone.notifications)
            Positioned(
              top: 26,
              right: 56,
              child: Container(
                width: 14,
                height: 14,
                decoration: const BoxDecoration(
                  color: AppColors.emergencyRed,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          if (tone == PermissionVisualTone.call)
            const Positioned(
              bottom: 18,
              left: 82,
              child: _SupportPill(label: 'Trusted line', icon: Icons.people_alt_rounded),
            ),
        ],
      ),
    );
  }
}

class _PermissionBenefitCard extends StatelessWidget {
  const _PermissionBenefitCard({
    required this.benefit,
    required this.accentColor,
  });

  final PermissionBenefit benefit;
  final Color accentColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppRadius.lg),
        border: Border.all(color: const Color(0xFFE8EDF5)),
      ),
      child: Row(
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: accentColor.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(benefit.icon, color: accentColor, size: 20),
          ),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  benefit.title,
                  style: theme.textTheme.titleSmall?.copyWith(
                    color: AppColors.trustNavy,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  benefit.subtitle,
                  style: theme.textTheme.bodySmall?.copyWith(color: AppColors.textSecondary),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoActionCard extends StatelessWidget {
  const _InfoActionCard({
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppRadius.lg),
      child: Ink(
        padding: const EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(
          color: const Color(0xFFF4F7FD),
          borderRadius: BorderRadius.circular(AppRadius.lg),
          border: Border.all(color: const Color(0xFFD9E3F1)),
        ),
        child: Row(
          children: [
            const Icon(Icons.info_outline_rounded, color: AppColors.trustNavy),
            const SizedBox(width: AppSpacing.md),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: theme.textTheme.bodySmall?.copyWith(color: AppColors.textSecondary),
                  ),
                ],
              ),
            ),
            const Icon(Icons.chevron_right_rounded, color: AppColors.textMuted),
          ],
        ),
      ),
    );
  }
}

class _SupportPill extends StatelessWidget {
  const _SupportPill({
    required this.label,
    required this.icon,
  });

  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppRadius.pill),
        border: Border.all(color: const Color(0xFFD9E3F1)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: AppColors.skyBlue),
          const SizedBox(width: 6),
          Text(
            label,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: AppColors.skyBlue,
                  fontWeight: FontWeight.w700,
                ),
          ),
        ],
      ),
    );
  }
}

class _PulseDot extends StatelessWidget {
  const _PulseDot({required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 12,
      height: 12,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: color.withValues(alpha: 0.4),
            blurRadius: 12,
            spreadRadius: 4,
          ),
        ],
      ),
    );
  }
}

Color _toneBase(PermissionVisualTone tone) {
  switch (tone) {
    case PermissionVisualTone.location:
      return AppColors.trustNavy;
    case PermissionVisualTone.notifications:
      return AppColors.skyBlue;
    case PermissionVisualTone.call:
      return AppColors.trustNavyDark;
    case PermissionVisualTone.background:
      return AppColors.safeGreen;
  }
}

