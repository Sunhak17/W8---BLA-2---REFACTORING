import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../model/ride/ride.dart';
import '../../../../model/ride_pref/ride_pref.dart';
import '../../../../utils/animations_util.dart' show AnimationUtils;
import '../../../theme/theme.dart';
import '../view_model/ride_selection_model.dart';
import 'ride_preference_modal.dart';
import 'rides_selection_header.dart';
import 'rides_selection_tile.dart';

class RideSelectionContent extends StatelessWidget {
  const RideSelectionContent({super.key});

  void onBackTap(BuildContext context) {
    Navigator.pop(context);
  }

  void onFilterPressed() {
    // TODO
  }

  void onRideSelected(Ride ride) {
    // Later
  }

  Future<void> onPreferencePressed(BuildContext context) async {
    final viewModel = context.read<RideSelectionViewModel>();

    // 1 - Navigate to the ride preference picker
    RidePreference? newPreference = await Navigator.of(context)
        .push<RidePreference>(
          AnimationUtils.createRightToLeftRoute(
            RidePreferenceModal(
              initialPreference: viewModel.currentPreference,
            ),
          ),
        );

    if (newPreference != null) {
      viewModel.selectPreference(newPreference);
    }
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<RideSelectionViewModel>();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          left: BlaSpacings.m,
          right: BlaSpacings.m,
          top: BlaSpacings.s,
        ),
        child: Column(
          children: [
            RideSelectionHeader(
              ridePreference: viewModel.currentPreference!,
              onBackPressed: () => onBackTap(context),
              onFilterPressed: onFilterPressed,
              onPreferencePressed: () => onPreferencePressed(context),
            ),

            SizedBox(height: 100),

            Expanded(
              child: ListView.builder(
                itemCount: viewModel.matchingRides.length,
                itemBuilder: (ctx, index) => RideSelectionTile(
                  ride: viewModel.matchingRides[index],
                  onPressed: () => onRideSelected(viewModel.matchingRides[index]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
