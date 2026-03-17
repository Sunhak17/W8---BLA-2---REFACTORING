import 'package:provider/provider.dart';

import 'main_common.dart';
import 'data/repositories/location/location_repository.dart';
import 'data/repositories/location/location_repository_mock.dart';
import 'data/repositories/ride/ride_repository.dart';
import 'data/repositories/ride/ride_repository_mock.dart';
import 'data/repositories/ride_preference/ride_preference_repository.dart';
import 'data/repositories/ride_preference/ride_preference_repository_mock.dart';
import 'ui/states/ride_preferences_state.dart';

List<InheritedProvider> get devProviders {
  final ridePreferenceRepository = RidePreferenceRepositoryMock();

  return [
    // 1 - Inject the location repository
    Provider<LocationRepository>(create: (_) => LocationRepositoryMock()),

    // 2 - Inject the ride repository
    Provider<RideRepository>(create: (_) => RideRepositoryMock()),

    // 3 - Inject the ride preference repository
    Provider<RidePreferenceRepository>(create: (_) => ridePreferenceRepository),

    // 4 - Inject the ride preference global state
    ChangeNotifierProvider<RidePreferenceState>(
      create: (_) => RidePreferenceState(repository: ridePreferenceRepository),
    ),
  ];
}

void main() {
  mainCommon(devProviders);
}
