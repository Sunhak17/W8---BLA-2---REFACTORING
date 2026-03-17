import '../../../model/ride_pref/ride_pref.dart';

abstract class RidePreferenceRepository {
  Future<List<RidePreference>> fetchRidePreferences();

  Future<void> saveRidePreference(RidePreference preference);
}