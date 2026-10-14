import 'dart:convert';

import 'package:powerbank/domain/models/time_type.dart';

import '../../core/api/api_client.dart';
import '../models/dashboard_model.dart';

class DashboardRemoteDataSource {
  final ApiClient client;

  DashboardRemoteDataSource(this.client);

  Future<DashboardModel> fetch(
    TimeType? timeType,
    DateTime? from,
    DateTime? to,
  ) async {
    {
      final params = <String, dynamic>{};

      if (timeType != null) {
        params['timeRange'] = timeType.apiValue;
      } else if (from != null && to != null) {
        params['from'] = from.toIso8601String();
        params['to'] = to.toIso8601String();
      }

      final res = await client.get(
        '/api/v1/manager/locations',
        queryParameters: params.isEmpty ? null : params,
      );
      if (res.statusCode != 200) {
        throw Exception('Dashboard load error');
      }
      return DashboardModel.fromJson(json.decode(res.body));
    }
  }
}
