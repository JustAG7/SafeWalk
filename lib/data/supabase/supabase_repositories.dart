import 'package:supabase_flutter/supabase_flutter.dart';

import '../models/app_preferences.dart';
import '../models/app_user_profile.dart';
import '../models/incident_report.dart';
import '../models/route_option.dart';
import '../models/safety_point.dart';
import '../models/saved_place.dart';
import '../models/trip.dart';
import '../models/trusted_contact.dart';
import '../repositories/auth_repository.dart';
import '../repositories/contacts_repository.dart';
import '../repositories/profile_repository.dart';
import '../repositories/safety_repository.dart';
import '../repositories/trips_repository.dart';

class SupabaseAuthRepository implements AuthRepository {
  SupabaseAuthRepository(this._client);

  final SupabaseClient _client;

  @override
  Future<void> signInWithEmail({
    required String email,
    required String password,
  }) async {
    await _client.auth.signInWithPassword(email: email, password: password);
  }

  @override
  Future<void> signOut() async {
    await _client.auth.signOut();
  }

  @override
  Future<void> signUpWithEmail({
    required String email,
    required String password,
  }) async {
    await _client.auth.signUp(email: email, password: password);
  }
}

class SupabaseProfileRepository implements ProfileRepository {
  SupabaseProfileRepository(this._client);

  final SupabaseClient _client;

  @override
  Future<AppUserProfile?> fetchProfile(String userId) async {
    final row = await _client
        .from('profiles')
        .select()
        .eq('id', userId)
        .maybeSingle();

    if (row == null) return null;

    return AppUserProfile(
      id: row['id'] as String,
      fullName: row['full_name'] as String? ?? '',
      email: row['email'] as String? ?? '',
      avatarUrl: row['avatar_url'] as String?,
      homeAddress: row['home_address'] as String?,
      workAddress: row['work_address'] as String?,
      schoolAddress: row['school_address'] as String?,
      isSetupComplete: row['is_setup_complete'] as bool? ?? false,
    );
  }

  @override
  Future<List<SavedPlace>> fetchSavedPlaces(String userId) async {
    final rows =
        await _client.from('saved_places').select().eq('user_id', userId);

    return rows
        .map<SavedPlace>(
          (row) => SavedPlace(
            id: row['id'] as String,
            userId: row['user_id'] as String,
            label: row['label'] as String,
            address: row['address'] as String,
            latitude: (row['latitude'] as num).toDouble(),
            longitude: (row['longitude'] as num).toDouble(),
          ),
        )
        .toList();
  }

  @override
  Future<AppPreferences?> fetchPreferences(String userId) async {
    final row = await _client
        .from('app_preferences')
        .select()
        .eq('user_id', userId)
        .maybeSingle();

    if (row == null) return null;

    return AppPreferences(
      userId: row['user_id'] as String,
      autoShareTrips: row['auto_share_trips'] as bool? ?? true,
      storeTripHistory: row['store_trip_history'] as bool? ?? true,
      highContrastEnabled: row['high_contrast_enabled'] as bool? ?? false,
      largeTouchTargets: row['large_touch_targets'] as bool? ?? true,
      hapticFeedbackEnabled: row['haptic_feedback_enabled'] as bool? ?? true,
      sosHoldSeconds: row['sos_hold_seconds'] as int? ?? 3,
      checkInIntervalMinutes: row['check_in_interval_minutes'] as int? ?? 15,
      communityAlertsEnabled:
          row['community_alerts_enabled'] as bool? ?? true,
      tripAlertsEnabled: row['trip_alerts_enabled'] as bool? ?? true,
    );
  }

  @override
  Future<void> savePlace(SavedPlace place) async {
    await _client.from('saved_places').upsert(place.toJson());
  }

  @override
  Future<void> savePreferences(AppPreferences preferences) async {
    await _client.from('app_preferences').upsert(preferences.toJson());
  }

  @override
  Future<void> saveProfile(AppUserProfile profile) async {
    await _client.from('profiles').upsert(profile.toJson());
  }
}

class SupabaseContactsRepository implements ContactsRepository {
  SupabaseContactsRepository(this._client);

  final SupabaseClient _client;

  @override
  Future<void> deleteContact(String contactId) async {
    await _client.from('trusted_contacts').delete().eq('id', contactId);
  }

  @override
  Future<List<TrustedContact>> fetchContacts(String userId) async {
    final rows = await _client
        .from('trusted_contacts')
        .select()
        .eq('user_id', userId);

    return rows
        .map<TrustedContact>(
          (row) => TrustedContact(
            id: row['id'] as String,
            userId: row['user_id'] as String,
            name: row['name'] as String,
            phoneNumber: row['phone_number'] as String,
            relationship: row['relationship'] as String,
            isPriority: row['is_priority'] as bool? ?? false,
            canViewTrips: row['can_view_trips'] as bool? ?? true,
          ),
        )
        .toList();
  }

  @override
  Future<void> saveContact(TrustedContact contact) async {
    await _client.from('trusted_contacts').upsert(contact.toJson());
  }
}

class SupabaseTripsRepository implements TripsRepository {
  SupabaseTripsRepository(this._client);

  final SupabaseClient _client;

  @override
  Future<List<RouteOption>> fetchRouteOptions(String tripId) async {
    final rows =
        await _client.from('route_options').select().eq('trip_id', tripId);

    return rows
        .map<RouteOption>(
          (row) => RouteOption(
            id: row['id'] as String,
            tripId: row['trip_id'] as String,
            label: row['label'] as String,
            durationMinutes: row['duration_minutes'] as int,
            distanceMeters: row['distance_meters'] as int,
            safetyScore: row['safety_score'] as int,
            safePointsCount: row['safe_points_count'] as int,
            isRecommended: row['is_recommended'] as bool? ?? false,
          ),
        )
        .toList();
  }

  @override
  Future<List<Trip>> fetchTrips(String userId) async {
    final rows = await _client.from('trips').select().eq('user_id', userId);

    return rows
        .map<Trip>(
          (row) => Trip(
            id: row['id'] as String,
            userId: row['user_id'] as String,
            originLabel: row['origin_label'] as String,
            destinationLabel: row['destination_label'] as String,
            status: row['status'] as String,
            startedAt: DateTime.parse(row['started_at'] as String),
            arrivedAt: row['arrived_at'] == null
                ? null
                : DateTime.parse(row['arrived_at'] as String),
            selectedRouteId: row['selected_route_id'] as String?,
          ),
        )
        .toList();
  }

  @override
  Future<void> saveRouteOption(RouteOption routeOption) async {
    await _client.from('route_options').upsert(routeOption.toJson());
  }

  @override
  Future<void> saveTrip(Trip trip) async {
    await _client.from('trips').upsert(trip.toJson());
  }
}

class SupabaseSafetyRepository implements SafetyRepository {
  SupabaseSafetyRepository(this._client);

  final SupabaseClient _client;

  @override
  Future<List<IncidentReport>> fetchIncidentReports() async {
    final rows = await _client.from('incident_reports').select();

    return rows
        .map<IncidentReport>(
          (row) => IncidentReport(
            id: row['id'] as String,
            userId: row['user_id'] as String,
            category: row['category'] as String,
            severity: row['severity'] as int,
            latitude: (row['latitude'] as num).toDouble(),
            longitude: (row['longitude'] as num).toDouble(),
            description: row['description'] as String?,
            photoUrl: row['photo_url'] as String?,
          ),
        )
        .toList();
  }

  @override
  Future<List<SafetyPoint>> fetchNearbySafetyPoints() async {
    final rows = await _client.from('safety_points').select();

    return rows
        .map<SafetyPoint>(
          (row) => SafetyPoint(
            id: row['id'] as String,
            name: row['name'] as String,
            type: row['type'] as String,
            address: row['address'] as String,
            latitude: (row['latitude'] as num).toDouble(),
            longitude: (row['longitude'] as num).toDouble(),
            isOpen: row['is_open'] as bool? ?? false,
          ),
        )
        .toList();
  }

  @override
  Future<void> submitIncident(IncidentReport incident) async {
    await _client.from('incident_reports').insert(incident.toJson());
  }
}

