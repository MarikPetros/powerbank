// lib/data/models/dashboard_response.dart

class DashboardResponse {
  final double averageLocationOnline; // percentage 0–100
  final int totalLocationsCount;

  DashboardResponse({
    required this.averageLocationOnline,
    required this.totalLocationsCount,
  });

  factory DashboardResponse.fromJson(Map<String, dynamic> json) {
    return DashboardResponse(
      averageLocationOnline: (json['averageLocationOnline'] as num).toDouble(),
      totalLocationsCount: json['totalLocationsCount'],
    );
  }
}
