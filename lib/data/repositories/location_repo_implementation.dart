import '../../domain/entities/location.dart';
import '../../domain/repos/location_repository.dart';
import '../data_sources/location_remote_ds.dart';
import '../data_sources/location_local_ds.dart';
import '../demo/demo_data.dart';

class LocationRepositoryImpl implements LocationRepository {
  final LocationRemoteDataSource remote;
  final LocationLocalDataSource local;

  LocationRepositoryImpl({required this.remote, required this.local});

  @override
  Future<List<Location>> fetchLocations() async {
    if (kDemoMode) return demoLocations;
    try {
      final fresh = await remote.fetchAll();
      local.saveAll(fresh);
      return fresh;
    } catch (_) {
      return local.getAll();
    }
  }
}
