import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../models/avatar_option.dart';
import '../models/setup_contact.dart';
import '../models/setup_place_category.dart';

const List<AvatarOption> kSetupAvatarOptions = [
  AvatarOption(
    id: 'camera',
    title: 'Take Photo',
    subtitle: 'Use your camera now',
    icon: Icons.photo_camera_outlined,
    color: AppColors.skyBlue,
  ),
  AvatarOption(
    id: 'gallery',
    title: 'Choose from Gallery',
    subtitle: 'Select a saved image',
    icon: Icons.photo_library_outlined,
    color: AppColors.safeGreen,
  ),
  AvatarOption(
    id: 'monogram',
    title: 'Use initials',
    subtitle: 'Create a clean fallback avatar',
    icon: Icons.auto_awesome_outlined,
    color: AppColors.cautionAmber,
  ),
];

const List<SetupContact> kSetupSuggestedContacts = [
  SetupContact(
    id: 'sarah',
    name: 'Sarah Jenkins',
    meta: 'Mobile • (555) 012-3456',
    phone: '(555) 012-3456',
    relationship: 'Best friend',
    avatarColor: Color(0xFFF7C8C5),
    initiallySelected: true,
  ),
  SetupContact(
    id: 'david',
    name: 'David Miller',
    meta: 'Work • (555) 987-6543',
    phone: '(555) 987-6543',
    relationship: 'Coworker',
    avatarColor: Color(0xFFCADAF9),
  ),
  SetupContact(
    id: 'mom',
    name: 'Mom',
    meta: 'Home • (555) 234-5678',
    phone: '(555) 234-5678',
    relationship: 'Family',
    avatarColor: Color(0xFFC8EAD6),
    initiallySelected: true,
  ),
  SetupContact(
    id: 'jessica',
    name: 'Jessica Thorne',
    meta: 'Mobile • (555) 345-6789',
    phone: '(555) 345-6789',
    relationship: 'Roommate',
    avatarColor: Color(0xFFF6D8A8),
    isOnline: false,
  ),
];

const List<String> kSetupSuggestedAddresses = [
  '221B Baker Street',
  '1024 Guardian Way, San Francisco',
  'Market Street Station',
  'Sunset & 7th, North Broadway',
];

const List<SetupPlaceCategory> kSetupPlaceCategories = [
  SetupPlaceCategory(
    id: 'work',
    label: 'WORK',
    icon: Icons.work_outline_rounded,
    sampleAddress: '88 Montgomery St, Financial District',
  ),
  SetupPlaceCategory(
    id: 'school',
    label: 'SCHOOL',
    icon: Icons.school_outlined,
    sampleAddress: 'North End District Campus',
  ),
  SetupPlaceCategory(
    id: 'gym',
    label: 'GYM',
    icon: Icons.fitness_center_outlined,
    sampleAddress: 'Pulse Training Club',
  ),
  SetupPlaceCategory(
    id: 'partner',
    label: 'PARTNER',
    icon: Icons.favorite_border_rounded,
    sampleAddress: 'West Village Apartments',
  ),
  SetupPlaceCategory(
    id: 'cafe',
    label: 'CAFE',
    icon: Icons.local_cafe_outlined,
    sampleAddress: 'Blue Bottle Coffee',
  ),
  SetupPlaceCategory(
    id: 'library',
    label: 'LIBRARY',
    icon: Icons.local_library_outlined,
    sampleAddress: 'City Central Library',
  ),
  SetupPlaceCategory(
    id: 'dining',
    label: 'DINING',
    icon: Icons.restaurant_outlined,
    sampleAddress: 'Harbor Dining Hall',
  ),
  SetupPlaceCategory(
    id: 'other',
    label: 'OTHER',
    icon: Icons.add_rounded,
    sampleAddress: 'Add a custom favorite place',
  ),
];
