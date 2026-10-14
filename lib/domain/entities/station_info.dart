// lib/data/models/station_info.dart

// class StationInfo {
//   final String cabinetId;
//   final bool currentOnlineStatus;
//   final double thirtyDaysOnlinePercentage;
//   final double onlinePercentageSinceInstallation;
//
//   StationInfo({
//     required this.cabinetId,
//     required this.currentOnlineStatus,
//     required this.thirtyDaysOnlinePercentage,
//     required this.onlinePercentageSinceInstallation,
//   });
//
//   factory StationInfo.fromJson(Map<String, dynamic> json) {
//     return StationInfo(
//       cabinetId: json['cabinetId'] as String,
//       currentOnlineStatus: (json['currentOnlineStatus'] as int) == 1,
//       thirtyDaysOnlinePercentage:
//       (json['thirtyDaysOnlinePercentage'] as num).toDouble(),
//       onlinePercentageSinceInstallation:
//       (json['onlinePercentageSinceInstallation'] as num).toDouble(),
//     );
//   }
//
//   Map<String, dynamic> toJson() => {
//     'cabinetId': cabinetId,
//     'currentOnlineStatus': currentOnlineStatus ? 1 : 0,
//     'thirtyDaysOnlinePercentage': thirtyDaysOnlinePercentage,
//     'onlinePercentageSinceInstallation': onlinePercentageSinceInstallation,
//   };
// }

// lib/domain/entities/station_info.dart

/// Represents status and uptime percentages for a single station.
class StationInfo {
  final String cabinetId;
  final int currentOnlineStatus;            // 1 = online, 2 = offline
  final int thirtyDaysOnlinePercentage;
  final int onlinePercentageSinceInstallation;

  StationInfo({
    required this.cabinetId,
    required this.currentOnlineStatus,
    required this.thirtyDaysOnlinePercentage,
    required this.onlinePercentageSinceInstallation,
  });

  /// Constructs a [StationInfo] from a JSON map.
  factory StationInfo.fromJson(Map<String, dynamic> json) {
    return StationInfo (
      cabinetId: json['cabinetId'] as String,
      currentOnlineStatus: json['currentOnlineStatus'] as int,
      thirtyDaysOnlinePercentage: json['thirtyDaysOnlinePercentage'] as int,
      onlinePercentageSinceInstallation: json['onlinePercentageSinceInstallation'] as int,
    );
  }

  /// Converts this model back to JSON.
  Map<String, dynamic> toJson() => {
    'cabinetId': cabinetId,
    'currentOnlineStatus': currentOnlineStatus,
    'thirtyDaysOnlinePercentage': thirtyDaysOnlinePercentage,
    'onlinePercentageSinceInstallation': onlinePercentageSinceInstallation,
  };
}
