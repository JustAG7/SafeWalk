class TrustedContact {
  const TrustedContact({
    required this.id,
    required this.userId,
    required this.name,
    required this.phoneNumber,
    required this.relationship,
    this.isPriority = false,
    this.canViewTrips = true,
  });

  final String id;
  final String userId;
  final String name;
  final String phoneNumber;
  final String relationship;
  final bool isPriority;
  final bool canViewTrips;

  Map<String, dynamic> toJson() => {
        'id': id,
        'user_id': userId,
        'name': name,
        'phone_number': phoneNumber,
        'relationship': relationship,
        'is_priority': isPriority,
        'can_view_trips': canViewTrips,
      };
}

