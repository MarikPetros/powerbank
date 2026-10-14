import '../entities/location.dart';
import '../repos/location_repository.dart';

class FetchLocations {
  final LocationRepository repo;

  FetchLocations(this.repo);

  Future<List<Location>> call() => repo.fetchLocations();
}
