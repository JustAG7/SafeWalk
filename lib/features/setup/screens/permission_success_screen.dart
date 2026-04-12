import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../app/router/app_routes.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_spacing.dart';
import '../../../shared/widgets/page_scaffold.dart';
import '../../../shared/widgets/primary_button.dart';
import '../mock/permission_mock_data.dart';
import '../widgets/permission_flow_widgets.dart';

class PermissionSuccessScreen extends StatefulWidget {
  const PermissionSuccessScreen({super.key});

  @override
  State<PermissionSuccessScreen> createState() => _PermissionSuccessScreenState();
}

class _PermissionSuccessScreenState extends State<PermissionSuccessScreen> {
  Future<void> _showPermissionDetail(String title, String body) {
    return showModalBottomSheet<void>(
      context: context,
      builder: (sheetContext) {
        return PermissionSuccessSheet(title: title, body: body);
      },
    );
  }

  Future<void> _showAllPermissions() {
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (sheetContext) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Granted permissions',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: AppSpacing.lg),
                ...grantedPermissionSummary.map(
                  (item) => Padding(
                    padding: const EdgeInsets.only(bottom: AppSpacing.sm),
                    child: SuccessSummaryCard(
                      title: item.title,
                      subtitle: item.subtitle,
                      icon: item.icon,
                      onTap: () {
                        Navigator.of(sheetContext).pop();
                        _showPermissionDetail(item.title, item.subtitle);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return PageScaffold(
      backgroundColor: const Color(0xFFF7F9FC),
      body: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFF7F9FC), Color(0xFFF0F4FB)],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(18, 12, 18, 24),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 430),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () => context.go(AppRoutePaths.setupBackgroundTracking),
                          icon: const Icon(Icons.arrow_back_rounded),
                        ),
                        Text(
                          'SafeWalk',
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w800,
                            color: AppColors.trustNavy,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          'STEP 5 OF 5',
                          style: theme.textTheme.labelSmall?.copyWith(
                            color: AppColors.textMuted,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 18),
                    const _SuccessRings(),
                    const SizedBox(height: 24),
                    Text(
                      'Permissions Granted',
                      textAlign: TextAlign.center,
                      style: theme.textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.w800,
                        color: AppColors.trustNavy,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Your safety companion is now fully equipped to protect you on your journey.',
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodyLarge?.copyWith(
                        color: AppColors.textSecondary,
                        height: 1.55,
                      ),
                    ),
                    const SizedBox(height: 22),
                    ...grantedPermissionSummary.map(
                      (item) => Padding(
                        padding: const EdgeInsets.only(bottom: AppSpacing.sm),
                        child: SuccessSummaryCard(
                          title: item.title,
                          subtitle: item.subtitle,
                          icon: item.icon,
                          onTap: () => _showPermissionDetail(item.title, item.subtitle),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextButton.icon(
                      onPressed: _showAllPermissions,
                      icon: const Icon(Icons.tune_rounded),
                      label: const Text('Review permissions'),
                    ),
                    const SizedBox(height: 20),
                    PrimaryButton(
                      label: 'Continue to Setup',
                      icon: Icons.arrow_forward_rounded,
                      onPressed: () => context.go(AppRoutePaths.setupProfile),
                      expanded: true,
                      height: 54,
                    ),
                    const SizedBox(height: 24),
                    Container(
                      height: 124,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        gradient: const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Color(0xFFE6F6EE), Color(0xFFD8E8F9)],
                        ),
                      ),
                      child: const Center(
                        child: Icon(Icons.verified_user_rounded, size: 52, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _SuccessRings extends StatelessWidget {
  const _SuccessRings();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 176,
        height: 176,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0x332D8CFF),
        ),
        child: Center(
          child: Container(
            width: 126,
            height: 126,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0x2238C793),
            ),
            child: const Center(
              child: _InnerSuccessCircle(),
            ),
          ),
        ),
      ),
    );
  }
}

class _InnerSuccessCircle extends StatelessWidget {
  const _InnerSuccessCircle();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 78,
      height: 78,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
      child: const Icon(Icons.check_rounded, color: AppColors.safeGreen, size: 38),
    );
  }
}
