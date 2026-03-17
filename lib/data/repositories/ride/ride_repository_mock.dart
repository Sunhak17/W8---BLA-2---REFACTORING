import '../../../data/dummy_data.dart';
import '../../../model/ride/ride.dart';
import 'ride_repository.dart';

class RideRepositoryMock implements RideRepository{
  @override
  Future<List<Ride>> fetchAvailableRides() async {
    await Future.delayed(const Duration(seconds: 1));
    return fakeRides; 
  }
}