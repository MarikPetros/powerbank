// class Location {
//   final String id;
//   final String name;
//   final int availableCount;
//
//   Location({
//     required this.id,
//     required this.name,
//     required this.availableCount,
//   });
// }
// lib/domain/entities/location.dart

import 'package:powerbank/domain/entities/station_info.dart';

/// Represents a manager’s location card with its stations and metadata.
// class Location {
//   final String shopName;
//   final String locationId;
//   final List<StationInfo> stationsInfo;
//   final String address;
//   final String locationNumber;
//   final double totalRevenue;
//   final String shopStart;
//   final String shopEnd;
//   final String locationType;
//   final bool hasCompetitors;
//   final bool isGoodVisibility;
//   final String area;
//   final int taughtStaffCount;
//   final String locationCategory;
//   final String establishmentNumber;
//
//   Location({
//     required this.shopName,
//     required this.locationId,
//     required this.stationsInfo,
//     required this.address,
//     required this.locationNumber,
//     required this.totalRevenue,
//     required this.shopStart,
//     required this.shopEnd,
//     required this.locationType,
//     required this.hasCompetitors,
//     required this.isGoodVisibility,
//     required this.area,
//     required this.taughtStaffCount,
//     required this.locationCategory,
//     required this.establishmentNumber,
//   });
// }

// lib/domain/entities/location.dart

// import 'station_info.dart';

class Location {
  final String shopName;
  final String locationId;
  final List<StationInfo> stationsInfo;
  final String address;
  final String locationNumber;
  final double totalRevenue;
  final String shopStart;
  final String shopEnd;

  // Nullable optional fields
  final String? locationType;
  final bool? hasCompetitors;
  final bool? isGoodVisibility;
  final String? area;
  final int? taughtStaffCount;
  final String? locationCategory;
  final String? establishmentNumber;

  Location({
    required this.shopName,
    required this.locationId,
    required this.stationsInfo,
    required this.address,
    required this.locationNumber,
    required this.totalRevenue,
    required this.shopStart,
    required this.shopEnd,
    this.locationType,
    this.hasCompetitors,
    this.isGoodVisibility,
    this.area,
    this.taughtStaffCount,
    this.locationCategory,
    this.establishmentNumber,
  });
}
