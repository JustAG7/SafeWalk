class IncidentReport {
  const IncidentReport({
    required this.id,
    required this.userId,
    required this.category,
    required this.severity,
    required this.latitude,
    required this.longitude,
    this.description,
    this.photoUrl,
  });

  final String id;
  final String userId;
  final String category;
  final int severity;
  final double latitude;
  final double longitude;
  final String? description;
  final String? photoUrl;

  Map<String, dynamic> toJson() => {
        'id': id,
        'user_id': userId,
        'category': category,
        'severity': severity,
        'latitude': latitude,
        'longitude': longitude,
        'description': description,
        'photo_url': photoUrl,
      };
}

