import 'package:powerbank/domain/models/time_type.dart';

import '../entities/dashboard_data.dart';

abstract class DashboardRepository {
  Future<DashboardData> fetchDashboard(TimeType? timeType,
      DateTime? from,
      DateTime? to,
      );
}
