import '../models/app_preferences.dart';
import '../models/app_user_profile.dart';
import '../models/saved_place.dart';

abstract class ProfileRepository {
  Future<AppUserProfile?> fetchProfile(String userId);
  Future<void> saveProfile(AppUserProfile profile);
  Future<List<SavedPlace>> fetchSavedPlaces(String userId);
  Future<void> savePlace(SavedPlace place);
  Future<AppPreferences?> fetchPreferences(String userId);
  Future<void> savePreferences(AppPreferences preferences);
}

