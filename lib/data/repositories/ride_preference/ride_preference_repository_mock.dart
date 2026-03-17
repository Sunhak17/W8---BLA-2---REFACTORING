import '../../../data/dummy_data.dart';
import '../../../model/ride_pref/ride_pref.dart';
import 'ride_preference_repository.dart';

class RidePreferenceRepositoryMock implements RidePreferenceRepository {
  @override
  Future<List<RidePreference>> fetchRidePreferences() async {
    await Future.delayed(const Duration(seconds: 1));
    return fakeRidePrefs; 
  }

  @override
  Future<void> saveRidePreference(RidePreference preference) async {
    await Future.delayed(const Duration(seconds: 1));
  }
}