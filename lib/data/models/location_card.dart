// lib/data/models/location_card.dart

import '../../domain/entities/station_info.dart';

class LocationModel {
  final String locationId;
  final List<StationInfo> stationsInfo;
  final String address;
  final String locationNumber;
  final double totalRevenue;
  final String shopStart;
  final String shopEnd;
  final String locationType;
  final bool hasCompetitors;
  final bool isGoodVisibility;
  final String area;
  final int taughtStaffCount;
  final String locationCategory;
  final String establishmentNumber;

  LocationModel({
    required this.locationId,
    required this.stationsInfo,
    required this.address,
    required this.locationNumber,
    required this.totalRevenue,
    required this.shopStart,
    required this.shopEnd,
    required this.locationType,
    required this.hasCompetitors,
    required this.isGoodVisibility,
    required this.area,
    required this.taughtStaffCount,
    required this.locationCategory,
    required this.establishmentNumber,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
      locationId: json['locationId'] as String,
      stationsInfo: (json['stationsInfo'] as List)
          .map((e) => StationInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      address: json['address'] as String,
      locationNumber: json['locationNumber'] as String,
      totalRevenue: (json['totalRevenue'] as num).toDouble(),
      shopStart: json['shopStart'] as String,
      shopEnd: json['shopEnd'] as String,
      locationType: json['locationType'] as String,
      hasCompetitors: json['hasCompetitors'] as bool,
      isGoodVisibility: json['isGoodVisibility'] as bool,
      area: json['area'] as String,
      taughtStaffCount: json['taughtStaffCount'] as int,
      locationCategory: json['locationCategory'] as String,
      establishmentNumber: json['establishmentNumber'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
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
