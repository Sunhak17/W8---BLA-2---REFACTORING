import 'package:flutter/material.dart';

import '../../data/repositories/ride_preference/ride_preference_repository.dart';
import '../../model/ride_pref/ride_pref.dart';

class RidePreferenceState extends ChangeNotifier {
  final RidePreferenceRepository repository;

  RidePreference? _selectedPreference;
  List<RidePreference> _preferenceHistory = [];

  RidePreferenceState({required this.repository}) {
    _fetchHistory();
  }

  RidePreference? get selectedPreference => _selectedPreference;
  List<RidePreference> get preferenceHistory => List.unmodifiable(_preferenceHistory);

  Future<void> _fetchHistory() async {
    _preferenceHistory = await repository.fetchRidePreferences();
    notifyListeners();
  }

  Future<void> selectPreference(RidePreference preference) async {
    if (preference != _selectedPreference) {
      _selectedPreference = preference;
      _preferenceHistory.add(preference);
      await repository.saveRidePreference(preference);
      notifyListeners();
    }
  }
}
