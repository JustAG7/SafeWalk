class SafetyPoint {
  const SafetyPoint({
    required this.id,
    required this.name,
    required this.type,
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.isOpen,
  });

  final String id;
  final String name;
  final String type;
  final String address;
  final double latitude;
  final double longitude;
  final bool isOpen;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'type': type,
        'address': address,
        'latitude': latitude,
        'longitude': longitude,
        'is_open': isOpen,
      };
}

