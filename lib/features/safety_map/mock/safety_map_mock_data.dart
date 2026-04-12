import 'package:flutter/material.dart';

class SafetyMapFilterOption {
  const SafetyMapFilterOption({
    required this.id,
    required this.label,
    this.icon,
  });

  final String id;
  final String label;
  final IconData? icon;
}

class SafetyMapSafePoint {
  const SafetyMapSafePoint({
    required this.id,
    required this.name,
    required this.subtitle,
    required this.distance,
    required this.eta,
    required this.icon,
    this.verified = false,
  });

  final String id;
  final String name;
  final String subtitle;
  final String distance;
  final String eta;
  final IconData icon;
  final bool verified;
}

const List<String> kSafetyMapSearchSuggestions = [
  'North Broadway Pathway',
  'Central Station Safe Zone',
  'Valencia St & 16th St',
  'Broadway St Corridor',
];

const List<SafetyMapFilterOption> kSafetyMapModeOptions = [
  SafetyMapFilterOption(id: 'safe_points', label: 'Safe Points'),
  SafetyMapFilterOption(id: 'heatmap', label: 'Heatmap'),
];

const List<SafetyMapFilterOption> kSafePointFilters = [
  SafetyMapFilterOption(
    id: 'verified',
    label: 'Verified locations only',
    icon: Icons.verified_user_outlined,
  ),
  SafetyMapFilterOption(
    id: 'all_night',
    label: '24/7 access',
    icon: Icons.night_shelter_outlined,
  ),
  SafetyMapFilterOption(
    id: 'walkable',
    label: 'Within 15 minutes',
    icon: Icons.directions_walk_outlined,
  ),
];

const List<SafetyMapFilterOption> kIncidentTimeRanges = [
  SafetyMapFilterOption(id: '24h', label: 'Last 24h'),
  SafetyMapFilterOption(id: '7d', label: '7 Days'),
  SafetyMapFilterOption(id: '30d', label: '30 Days'),
];

const List<SafetyMapFilterOption> kIncidentTypeFilters = [
  SafetyMapFilterOption(id: 'theft', label: 'Theft'),
  SafetyMapFilterOption(id: 'suspicious', label: 'Suspicious'),
  SafetyMapFilterOption(id: 'assault', label: 'Assault'),
];

const List<SafetyMapFilterOption> kReportIncidentTypes = [
  SafetyMapFilterOption(
    id: 'poor_lighting',
    label: 'Poor Lighting',
    icon: Icons.lightbulb_outline,
  ),
  SafetyMapFilterOption(
    id: 'suspicious',
    label: 'Suspicious Activity',
    icon: Icons.visibility_outlined,
  ),
  SafetyMapFilterOption(
    id: 'construction',
    label: 'Construction',
    icon: Icons.construction_outlined,
  ),
  SafetyMapFilterOption(
    id: 'obstacle',
    label: 'Obstacle',
    icon: Icons.warning_amber_rounded,
  ),
  SafetyMapFilterOption(
    id: 'crowd',
    label: 'Crowd',
    icon: Icons.groups_outlined,
  ),
  SafetyMapFilterOption(
    id: 'other',
    label: 'Other',
    icon: Icons.more_horiz_rounded,
  ),
];

const List<SafetyMapSafePoint> kSafetyMapSafePoints = [
  SafetyMapSafePoint(
    id: 'police',
    name: '24-Hour Police Station',
    subtitle: 'Open • Always Open',
    distance: '0.4 mi',
    eta: '8 min',
    icon: Icons.shield_outlined,
    verified: true,
  ),
  SafetyMapSafePoint(
    id: 'cafe',
    name: 'BlueLine SafeWalk Cafe',
    subtitle: 'SafeWalk Safe Space',
    distance: '0.6 mi',
    eta: '12 min',
    icon: Icons.local_cafe_outlined,
  ),
  SafetyMapSafePoint(
    id: 'cvs',
    name: 'CVS Pharmacy',
    subtitle: '24/7 Pharmacy • Traffic Security',
    distance: '1.1 mi',
    eta: '14 min',
    icon: Icons.local_hospital_outlined,
    verified: true,
  ),
];
