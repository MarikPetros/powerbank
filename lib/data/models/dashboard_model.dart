import '../../domain/entities/dashboard_data.dart';

// class DashboardModel extends DashboardData {
//   DashboardModel({
//     required super.totalPowerbanks,
//     required super.inUse,
//     required super.available,
//     required List<LocationModel> super.locations,
//   });
//
//   factory DashboardModel.fromJson(Map<String, dynamic> json) {
//     final locs = (json['locations'] as List)
//         .map((e) => LocationModel.fromJson(e))
//         .toList();
//     return DashboardModel(
//       totalPowerbanks: json['totalPowerbanks'],
//       inUse: json['inUse'],
//       available: json['available'],
//       locations: locs,
//     );
//   }
// }
// lib/data/models/dashboard_model.dart


/// Data-layer model for the dashboard response.
/// Extends the domain entity and adds JSON (de)serialization.
class DashboardModel extends DashboardData {
  DashboardModel({
    required super.avgOnlinePercent,
    required super.totalLocations,
  });

  /// Creates a [DashboardModel] from the API JSON.
  ///
  /// Maps `averageLocationOnline` → `avgOnlinePercent`
  /// and `totalLocationsCount` → `totalLocations`.
  factory DashboardModel.fromJson(Map<String, dynamic> json) {
    return DashboardModel(
      avgOnlinePercent: (json['averageLocationOnline'] as num).toDouble(),
      totalLocations: json['totalLocationsCount'] as int,
    );
  }

  /// Converts this model back to JSON for caching or logging.
  Map<String, dynamic> toJson() {
    return {
      'averageLocationOnline': avgOnlinePercent,
      'totalLocationsCount': totalLocations,
    };
  }
}

