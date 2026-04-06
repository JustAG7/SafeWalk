import '../models/incident_report.dart';
import '../models/safety_point.dart';

abstract class SafetyRepository {
  Future<List<SafetyPoint>> fetchNearbySafetyPoints();
  Future<List<IncidentReport>> fetchIncidentReports();
  Future<void> submitIncident(IncidentReport incident);
}

