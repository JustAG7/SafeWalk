import 'package:flutter/material.dart';

import '../models/onboarding_slide.dart';

class EntryMockCopy {
  static const brandName = 'SafeWalk';
  static const brandTagline = 'PERSONAL SECURITY REIMAGINED';
  static const splashFooter = 'TRUST & SECURITY REDEFINED';
  static const welcomeHeadline = 'Welcome to Your\nSafety Companion';
  static const welcomeBody =
      'Experience peace of mind with real-time guardianship and intelligent route monitoring.';
  static const welcomeFooter = 'SECURED BY GUARDIAN NETWORK';
}

const onboardingSlides = <OnboardingSlideData>[
  OnboardingSlideData(
    eyebrow: 'SLIDE 1 OF 3',
    title: 'Navigate with\nConfidence',
    body: 'Our AI finds the safest, most well-lit routes for your journey at any hour.',
    actionLabel: 'Next',
    tone: EntryArtworkTone.city,
  ),
  OnboardingSlideData(
    eyebrow: 'LIVE TRACKING ACTIVE',
    title: 'Share your\nJourney',
    body: 'Let trusted contacts follow your progress in real time until you arrive safely.',
    actionLabel: 'Next',
    tone: EntryArtworkTone.map,
  ),
  OnboardingSlideData(
    eyebrow: 'ACTIVE PROTECTION',
    title: 'Instant SOS\nProtection',
    body: 'One tap can alert emergency services and your contacts if you ever feel unsafe.',
    actionLabel: 'Get Started',
    tone: EntryArtworkTone.sos,
  ),
];

class MockAuthProviderOption {
  const MockAuthProviderOption({
    required this.title,
    required this.icon,
    required this.message,
  });

  final String title;
  final IconData icon;
  final String message;
}

const mockAuthProviders = <MockAuthProviderOption>[
  MockAuthProviderOption(
    title: 'Apple',
    icon: Icons.apple,
    message: 'Apple sign-in is ready.',
  ),
  MockAuthProviderOption(
    title: 'Google',
    icon: Icons.g_mobiledata_rounded,
    message: 'Google sign-in is ready.',
  ),
];
