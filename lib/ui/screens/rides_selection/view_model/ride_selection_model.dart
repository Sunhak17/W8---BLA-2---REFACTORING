import 'package:flutter/material.dart';

import '../../../../data/repositories/ride/ride_repository.dart';
import '../../../../model/ride/ride.dart';
import '../../../../model/ride_pref/ride_pref.dart';
import '../../../states/ride_preferences_state.dart';

class RideSelectionViewModel extends ChangeNotifier {
  final RidePreferenceState _ridePreferenceState;
  final RideRepository _rideRepository;

  List<Ride> _allRides = [];

  RideSelectionViewModel({
    required RidePreferenceState ridePreferenceState,
    required RideRepository rideRepository,
  })  : _ridePreferenceState = ridePreferenceState,
        _rideRepository = rideRepository {
    _ridePreferenceState.addListener(notifyListeners);
    _fetchRides();
  }

  RidePreference? get currentPreference => _ridePreferenceState.selectedPreference;

  List<Ride> get matchingRides {
    if (currentPreference == null) return [];
    return _allRides
        .where(
          (ride) =>
              ride.departureLocation == currentPreference!.departure &&
              ride.arrivalLocation == currentPreference!.arrival &&
              ride.availableSeats >= currentPreference!.requestedSeats,
        )
        .toList();
  }

  void selectPreference(RidePreference preference) {
    _ridePreferenceState.selectPreference(preference);
  }

  Future<void> _fetchRides() async {
    _allRides = await _rideRepository.fetchAvailableRides();
    notifyListeners();
  }

  @override
  void dispose() {
    _ridePreferenceState.removeListener(notifyListeners);
    super.dispose();
  }
}
