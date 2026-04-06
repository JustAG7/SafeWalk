class AppPreferences {
  const AppPreferences({
    required this.userId,
    this.autoShareTrips = true,
    this.storeTripHistory = true,
    this.highContrastEnabled = false,
    this.largeTouchTargets = true,
    this.hapticFeedbackEnabled = true,
    this.sosHoldSeconds = 3,
    this.checkInIntervalMinutes = 15,
    this.communityAlertsEnabled = true,
    this.tripAlertsEnabled = true,
  });

  final String userId;
  final bool autoShareTrips;
  final bool storeTripHistory;
  final bool highContrastEnabled;
  final bool largeTouchTargets;
  final bool hapticFeedbackEnabled;
  final int sosHoldSeconds;
  final int checkInIntervalMinutes;
  final bool communityAlertsEnabled;
  final bool tripAlertsEnabled;

  Map<String, dynamic> toJson() => {
        'user_id': userId,
        'auto_share_trips': autoShareTrips,
        'store_trip_history': storeTripHistory,
        'high_contrast_enabled': highContrastEnabled,
        'large_touch_targets': largeTouchTargets,
        'haptic_feedback_enabled': hapticFeedbackEnabled,
        'sos_hold_seconds': sosHoldSeconds,
        'check_in_interval_minutes': checkInIntervalMinutes,
        'community_alerts_enabled': communityAlertsEnabled,
        'trip_alerts_enabled': tripAlertsEnabled,
      };
}

