import 'package:powerbank/domain/models/time_type.dart';

import '../entities/dashboard_data.dart';
import '../repos/dashboard_repository.dart';

class FetchDashboardData {
  final DashboardRepository repo;

  FetchDashboardData(this.repo);

  Future<DashboardData> call({
    TimeType? timeType,
    DateTime? from,
    DateTime? to,
  }) => repo.fetchDashboard(timeType ?? TimeType.ALL_TIME, from, to);
}
