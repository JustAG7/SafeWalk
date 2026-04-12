import 'package:flutter/material.dart';

enum PermissionVisualTone {
  location,
  notifications,
  call,
  background,
}

class PermissionBenefit {
  const PermissionBenefit({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  final IconData icon;
  final String title;
  final String subtitle;
}

class PermissionStepData {
  const PermissionStepData({
    required this.step,
    required this.totalSteps,
    required this.route,
    required this.nextRoute,
    required this.title,
    required this.description,
    required this.primaryLabel,
    required this.secondaryLabel,
    required this.icon,
    required this.visualTone,
    required this.eyebrow,
    required this.highlights,
    required this.learnMoreTitle,
    required this.learnMoreBody,
    required this.successMessage,
    required this.secondaryDecisionCopy,
    this.privacyFootnote,
  });

  final int step;
  final int totalSteps;
  final String route;
  final String nextRoute;
  final String title;
  final String description;
  final String primaryLabel;
  final String secondaryLabel;
  final IconData icon;
  final PermissionVisualTone visualTone;
  final String eyebrow;
  final List<PermissionBenefit> highlights;
  final String learnMoreTitle;
  final String learnMoreBody;
  final String successMessage;
  final String secondaryDecisionCopy;
  final String? privacyFootnote;
}
