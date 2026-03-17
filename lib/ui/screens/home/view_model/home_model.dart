import 'package:flutter/material.dart';

import '../../../../model/ride_pref/ride_pref.dart';
import '../../../states/ride_preferences_state.dart';

class HomeViewModel extends ChangeNotifier {
  final RidePreferenceState _ridePreferenceState;

  HomeViewModel(this._ridePreferenceState) {
    _ridePreferenceState.addListener(notifyListeners);
  }

  RidePreference? get currentPreference => _ridePreferenceState.selectedPreference;

  List<RidePreference> get history => _ridePreferenceState.preferenceHistory.reversed.toList();

  void selectPreference(RidePreference preference) {
    _ridePreferenceState.selectPreference(preference);
  }

  @override
  void dispose() {
    _ridePreferenceState.removeListener(notifyListeners);
    super.dispose();
  }
}