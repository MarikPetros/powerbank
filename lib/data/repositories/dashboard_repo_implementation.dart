import 'package:powerbank/domain/models/time_type.dart';

import '../../domain/entities/dashboard_data.dart';
import '../../domain/repos/dashboard_repository.dart';
import '../data_sources/dashboard_remote_ds.dart';
import '../data_sources/dashboard_local_ds.dart';
import '../demo/demo_data.dart';

class DashboardRepositoryImpl implements DashboardRepository {
  final DashboardRemoteDataSource remote;
  final DashboardLocalDataSource local;

  DashboardRepositoryImpl({required this.remote, required this.local});

  @override
  Future<DashboardData> fetchDashboard( TimeType? timeType,
      DateTime? from,
      DateTime? to,
      ) async {
    if (kDemoMode) return demoDashboard;
    try {
      final fresh = await remote.fetch(timeType, from, to);
      local.save(fresh);
      return fresh;
    } catch (_) {
      final cached = local.get();
      if (cached != null) return cached;
      rethrow;
    }
  }
}
