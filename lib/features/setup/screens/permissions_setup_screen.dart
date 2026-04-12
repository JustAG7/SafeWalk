import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../app/router/app_routes.dart';
import '../../../shared/widgets/page_scaffold.dart';
import '../mock/permission_mock_data.dart';
import '../models/permission_step.dart';
import '../widgets/permission_flow_widgets.dart';

class PermissionsSetupScreen extends StatelessWidget {
  const PermissionsSetupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return _PermissionStepRouteScreen(
      stepData: permissionStepForRoute(AppRoutePaths.setupPermissions),
      previousRoute: AppRoutePaths.signUp,
    );
  }
}

class NotificationPermissionScreen extends StatelessWidget {
  const NotificationPermissionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return _PermissionStepRouteScreen(
      stepData: permissionStepForRoute(AppRoutePaths.setupNotifications),
      previousRoute: AppRoutePaths.setupPermissions,
    );
  }
}

class CallPermissionScreen extends StatelessWidget {
  const CallPermissionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return _PermissionStepRouteScreen(
      stepData: permissionStepForRoute(AppRoutePaths.setupCallPermission),
      previousRoute: AppRoutePaths.setupNotifications,
    );
  }
}

class BackgroundTrackingPermissionScreen extends StatelessWidget {
  const BackgroundTrackingPermissionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return _PermissionStepRouteScreen(
      stepData: permissionStepForRoute(AppRoutePaths.setupBackgroundTracking),
      previousRoute: AppRoutePaths.setupCallPermission,
    );
  }
}

class _PermissionStepRouteScreen extends StatefulWidget {
  const _PermissionStepRouteScreen({
    required this.stepData,
    required this.previousRoute,
  });

  final PermissionStepData stepData;
  final String previousRoute;

  @override
  State<_PermissionStepRouteScreen> createState() => _PermissionStepRouteScreenState();
}

class _PermissionStepRouteScreenState extends State<_PermissionStepRouteScreen> {
  bool _isSubmitting = false;

  Future<void> _handlePrimaryAction() async {
    FocusScope.of(context).unfocus();
    setState(() => _isSubmitting = true);
    await Future<void>.delayed(const Duration(milliseconds: 750));
    if (!mounted) {
      return;
    }
    setState(() => _isSubmitting = false);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(widget.stepData.successMessage)),
    );
    context.go(widget.stepData.nextRoute);
  }

  Future<void> _handleSecondaryAction() async {
    final shouldContinue = await showDialog<bool>(
          context: context,
          builder: (dialogContext) {
            return AlertDialog(
              title: Text(widget.stepData.secondaryLabel),
              content: Text(widget.stepData.secondaryDecisionCopy),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(dialogContext).pop(false),
                  child: const Text('Stay Here'),
                ),
                FilledButton(
                  onPressed: () => Navigator.of(dialogContext).pop(true),
                  child: const Text('Continue'),
                ),
              ],
            );
          },
        ) ??
        false;

    if (!shouldContinue || !mounted) {
      return;
    }

    context.go(widget.stepData.nextRoute);
  }

  Future<void> _showLearnMore() {
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (sheetContext) {
        return PermissionLearnMoreSheet(stepData: widget.stepData);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      backgroundColor: const Color(0xFFF8FAFF),
      body: PermissionStepTemplate(
        stepData: widget.stepData,
        isSubmitting: _isSubmitting,
        onBack: () => context.go(widget.previousRoute),
        onPrimaryPressed: _handlePrimaryAction,
        onSecondaryPressed: _handleSecondaryAction,
        onLearnMorePressed: _showLearnMore,
      ),
    );
  }
}
