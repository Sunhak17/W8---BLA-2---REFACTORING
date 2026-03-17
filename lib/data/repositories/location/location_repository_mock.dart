import '../../../data/dummy_data.dart';
import '../../../model/ride/locations.dart';
import 'location_repository.dart';

class LocationRepositoryMock implements LocationRepository{
  @override
  Future<List<Location>> fetchAvailableLocations() async {
    await Future.delayed(const Duration(seconds: 1));
    return fakeLocations;
  }
}
   