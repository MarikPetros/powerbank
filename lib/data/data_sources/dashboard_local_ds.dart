import '../../core/cache/cache_manager.dart';
import '../models/dashboard_model.dart';

class DashboardLocalDataSource {
  final cache = CacheManager().box(CacheManager.dashboardBox);

  DashboardModel? get() {
    final json = cache.get('data');
    if (json == null) return null;
    return DashboardModel.fromJson(Map<String, dynamic>.from(json));
  }

  void save(DashboardModel data) {
    cache.put('data', {
      'averageLocationOnline': data.avgOnlinePercent,
      'totalLocationsCount': data.totalLocations,
    });
  }
}
