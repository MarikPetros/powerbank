
// class DashboardData {
//   final int totalPowerbanks;
//   final int inUse;
//   final int available;
//   final List< Location> locations;
//
//   DashboardData({
//     required this.totalPowerbanks,
//     required this.inUse,
//     required this.available,
//     required this.locations,
//   });
// }

// data/models/dashboard_response.dart
class DashboardData {
  final double avgOnlinePercent;  // 0.0 to 100.0
  final int totalLocations;

  DashboardData({
    required this.avgOnlinePercent,
    required this.totalLocations,
  });

  factory DashboardData.fromJson(Map<String, dynamic> json) {
    return DashboardData(
      avgOnlinePercent: json['averageLocationOnline'].toDouble(),
      totalLocations: json['totalLocationsCount'],
    );
  }
}
