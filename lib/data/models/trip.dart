class Trip {
  const Trip({
    required this.id,
    required this.userId,
    required this.originLabel,
    required this.destinationLabel,
    required this.status,
    required this.startedAt,
    this.arrivedAt,
    this.selectedRouteId,
  });

  final String id;
  final String userId;
  final String originLabel;
  final String destinationLabel;
  final String status;
  final DateTime startedAt;
  final DateTime? arrivedAt;
  final String? selectedRouteId;

  Map<String, dynamic> toJson() => {
        'id': id,
        'user_id': userId,
        'origin_label': originLabel,
        'destination_label': destinationLabel,
        'status': status,
        'started_at': startedAt.toIso8601String(),
        'arrived_at': arrivedAt?.toIso8601String(),
        'selected_route_id': selectedRouteId,
      };
}

