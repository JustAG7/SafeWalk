class SavedPlace {
  const SavedPlace({
    required this.id,
    required this.userId,
    required this.label,
    required this.address,
    required this.latitude,
    required this.longitude,
  });

  final String id;
  final String userId;
  final String label;
  final String address;
  final double latitude;
  final double longitude;

  Map<String, dynamic> toJson() => {
        'id': id,
        'user_id': userId,
        'label': label,
        'address': address,
        'latitude': latitude,
        'longitude': longitude,
      };
}

