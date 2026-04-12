import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../models/post_trip_guardian.dart';

const List<PostTripGuardian> kPostTripGuardians = [
  PostTripGuardian(
    id: 'sarah',
    name: 'Sarah J.',
    subtitle: 'Trusted Contact',
    avatarColor: Color(0xFFF1D0C5),
  ),
  PostTripGuardian(
    id: 'marcus',
    name: 'Marcus K.',
    subtitle: 'Family Circle',
    avatarColor: Color(0xFFC9DAF8),
  ),
  PostTripGuardian(
    id: 'lina',
    name: 'Lina R.',
    subtitle: 'Emergency Contact',
    avatarColor: Color(0xFFF4C3D7),
  ),
];

const List<String> kPostTripRouteTags = [
  'Well Lit',
  'Crowded',
  'Quiet',
  'Safe Path',
  'Construction',
];

const List<_ShareAction> _shareActions = [
  _ShareAction('Send to guardians', Icons.message_outlined),
  _ShareAction('Save local copy', Icons.download_outlined),
  _ShareAction('Copy trip summary', Icons.copy_all_outlined),
];

class _ShareAction {
  const _ShareAction(this.label, this.icon);

  final String label;
  final IconData icon;
}

List<Map<String, Object>> get postTripShareActions => _shareActions
    .map((item) => {'label': item.label, 'icon': item.icon})
    .toList(growable: false);

const Map<String, String> kPostTripSummaryStats = {
  'distance': '1.2 km',
  'duration': '14 mins',
  'guardians': '3',
  'brightness': '92%',
  'routeScore': '9.8',
  'tripState': 'TRIP VERIFIED SAFE',
};

const Color kPostTripSafePill = AppColors.safeGreen;
