import '../../../model/ride/ride.dart';

abstract class RideRepository {
  Future<List<Ride>> fetchAvailableRides();
}