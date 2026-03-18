import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/repositories/ride/ride_repository.dart';
import '../../../ui/states/ride_preferences_state.dart';
import 'view_model/ride_selection_model.dart';
import 'widgets/rides_selection_content.dart';

///
///  The Ride Selection screen allows user to select a ride, once ride preferences have been defined.
///  The screen also allow user to:
///   -  re-define the ride preferences
///   -  activate some filters.
///
class RidesSelectionScreen extends StatelessWidget {
  const RidesSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RideSelectionViewModel(
        ridePreferenceState: context.read<RidePreferenceState>(),
        rideRepository: context.read<RideRepository>(),
      ),
      child: RideSelectionContent(),
    );
  }
}

