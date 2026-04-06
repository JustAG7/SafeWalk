class RouteOption {
  const RouteOption({
    required this.id,
    required this.tripId,
    required this.label,
    required this.durationMinutes,
    required this.distanceMeters,
    required this.safetyScore,
    required this.safePointsCount,
    this.isRecommended = false,
  });

  final String id;
  final String tripId;
  final String label;
  final int durationMinutes;
  final int distanceMeters;
  final int safetyScore;
  final int safePointsCount;
  final bool isRecommended;

  Map<String, dynamic> toJson() => {
        'id': id,
        'trip_id': tripId,
        'label': label,
        'duration_minutes': durationMinutes,
        'distance_meters': distanceMeters,
        'safety_score': safetyScore,
        'safe_points_count': safePointsCount,
        'is_recommended': isRecommended,
      };
}

