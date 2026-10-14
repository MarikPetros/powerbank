// // class LocationModel extends Location {
// //   LocationModel({
// //     required super.id,
// //     required super.name,
// //     required super.availableCount,
// //   });
// //
// //   factory LocationModel.fromJson(Map<String, dynamic> json) {
// //     return LocationModel(
// //       id: json['id'],
// //       name: json['name'],
// //       availableCount: json['availableCount'],
// //     );
// //   }
// // }
// // lib/data/models/location_model.dart
//
//
// import '../../domain/entities/location.dart';
// import 'package:powerbank/domain/entities/station_info.dart';
//
// /// JSON‐serializable model for a location card.
// /// Extends the domain [Location] entity.
// class LocationModel extends Location {
//   LocationModel({
//     required super.shopName,
//     required super.locationId,
//     required super.stationsInfo,
//     required super.address,
//     required super.locationNumber,
//     required super.totalRevenue,
//     required super.shopStart,
//     required super.shopEnd,
//     required super.locationType,
//     required super.hasCompetitors,
//     required super.isGoodVisibility,
//     required super.area,
//     required super.taughtStaffCount,
//     required super.locationCategory,
//     required super.establishmentNumber,
//   });
//
//   /// Constructs a [LocationModel] from a JSON map.
//   factory LocationModel.fromJson(Map<String, dynamic> json) {
//     return LocationModel(
//       shopName: json['shopName'] as String,
//       locationId: json['locationId'] as String,
//       stationsInfo: (json['stationsInfo'] as List<dynamic>)
//           .map((e) => StationInfo.fromJson(e as Map<String, dynamic>))
//           .toList(),
//       address: json['address'] as String,
//       locationNumber: json['locationNumber'] as String,
//       totalRevenue: (json['totalRevenue'] as num).toDouble(),
//       shopStart: json['shopStart'] as String,
//       shopEnd: json['shopEnd'] as String,
//       locationType: json['locationType'] as String,
//       hasCompetitors: json['hasCompetitors'] as bool,
//       isGoodVisibility: json['isGoodVisibility'] as bool,
//       area: json['area'] as String,
//       taughtStaffCount: json['taughtStaffCount'] as int,
//       locationCategory: json['locationCategory'] as String,
//       establishmentNumber: json['establishmentNumber'] as String,
//     );
//   }
//
//   /// Converts this model back to JSON.
//   Map<String, dynamic> toJson() => {
//     'shopName': shopName,
//     'locationId': locationId,
//     'stationsInfo': stationsInfo.map((s) => s.toJson()).toList(),
//     'address': address,
//     'locationNumber': locationNumber,
//     'totalRevenue': totalRevenue,
//     'shopStart': shopStart,
//     'shopEnd': shopEnd,
//     'locationType': locationType,
//     'hasCompetitors': hasCompetitors,
//     'isGoodVisibility': isGoodVisibility,
//     'area': area,
//     'taughtStaffCount': taughtStaffCount,
//     'locationCategory': locationCategory,
//     'establishmentNumber': establishmentNumber,
//   };
// }

// lib/data/models/location_model.dart

import '../../domain/entities/location.dart';
import 'package:powerbank/domain/entities/station_info.dart';


class LocationModel extends Location {
  LocationModel({
    required super.shopName,
    required super.locationId,
    required super.stationsInfo,
    required super.address,
    required super.locationNumber,
    required super.totalRevenue,
    required super.shopStart,
    required super.shopEnd,
    super.locationType,
    super.hasCompetitors,
    super.isGoodVisibility,
    super.area,
    super.taughtStaffCount,
    super.locationCategory,
    super.establishmentNumber,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
      shopName: json['shopName'] as String? ?? '',
      locationId: json['locationId'] as String? ?? '',
      stationsInfo: (json['stationsInfo'] as List<dynamic>?)
          ?.map((e) => StationInfo.fromJson(e as Map<String, dynamic>))
          .toList() ??
          [],
      address: json['address'] as String? ?? '',
      locationNumber: json['locationNumber'] as String? ?? '',
      totalRevenue: (json['totalRevenue'] as num?)?.toDouble() ?? 0.0,
      shopStart: json['shopStart'] as String? ?? '',
      shopEnd: json['shopEnd'] as String? ?? '',

      // Nullable fields—use `as T?` so null stays null
      locationType: json['locationType'] as String?,
      hasCompetitors: json['hasCompetitors'] as bool?,
      isGoodVisibility: json['isGoodVisibility'] as bool?,
      area: json['area'] as String?,
      taughtStaffCount: json['taughtStaffCount'] as int?,
      locationCategory: json['locationCategory'] as String?,
      establishmentNumber: json['establishmentNumber'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'shopName': shopName,
    'locationId': locationId,
    'stationsInfo': stationsInfo.map((s) => s.toJson()).toList(),
    'address': address,
    'locationNumber': locationNumber,
    'totalRevenue': totalRevenue,
    'shopStart': shopStart,
    'shopEnd': shopEnd,
    'locationType': locationType,
    'hasCompetitors': hasCompetitors,
    'isGoodVisibility': isGoodVisibility,
    'area': area,
    'taughtStaffCount': taughtStaffCount,
    'locationCategory': locationCategory,
    'establishmentNumber': establishmentNumber,
  };
}
