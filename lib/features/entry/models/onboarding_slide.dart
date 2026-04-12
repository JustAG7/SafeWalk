enum EntryArtworkTone { city, map, sos }

class OnboardingSlideData {
  const OnboardingSlideData({
    required this.eyebrow,
    required this.title,
    required this.body,
    required this.actionLabel,
    required this.tone,
  });

  final String eyebrow;
  final String title;
  final String body;
  final String actionLabel;
  final EntryArtworkTone tone;
}
