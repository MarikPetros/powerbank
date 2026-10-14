import '../../core/cache/cache_manager.dart';
import '../models/location_model.dart';

class LocationLocalDataSource {
  final cache = CacheManager().box(CacheManager.locationsBox);

  List<LocationModel> getAll() {
    final list = cache.get('list') as List<dynamic>? ?? [];
    return list
        .map((e) => LocationModel.fromJson(Map<String, dynamic>.from(e)))
        .toList();
  }

  void saveAll(List<LocationModel> data) {
    cache.put(
      'list',
      data
          .map(
            (l) => {
              'locationId': l.locationId,
              'stationsInfo': l.stationsInfo.map((s) => s.toJson()).toList(),
              'address': l.address,
              'locationNumber': l.locationNumber,
              'totalRevenue': l.totalRevenue,
              'shopStart': l.shopStart,
              'shopEnd': l.shopEnd,
              'locationType': l.locationType,
              'hasCompetitors': l.hasCompetitors,
              'isGoodVisibility': l.isGoodVisibility,
              'area': l.area,
              'taughtStaffCount': l.taughtStaffCount,
              'locationCategory': l.locationCategory,
              'establishmentNumber': l.establishmentNumber,
            },
          )
          .toList(),
    );
  }
}
