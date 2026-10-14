// lib/data/demo/demo_data.dart
//
// Sample data for screenshots and demos without the real backend.
// Run with:  flutter run --dart-define=DEMO=true

import '../../domain/entities/dashboard_data.dart';
import '../../domain/entities/location.dart';
import '../../domain/entities/station_info.dart';

const bool kDemoMode = bool.fromEnvironment('DEMO');

final DashboardData demoDashboard = DashboardData(
  avgOnlinePercent: 87.5,
  totalLocations: 24,
);

StationInfo _station(String id, {bool online = true, int month = 95, int all = 92}) =>
    StationInfo(
      cabinetId: id,
      currentOnlineStatus: online ? 1 : 2,
      thirtyDaysOnlinePercentage: month,
      onlinePercentageSinceInstallation: all,
    );

final List<Location> demoLocations = [
  Location(
    shopName: 'Central Mall',
    locationId: 'loc-001',
    stationsInfo: [_station('CAB-1001'), _station('CAB-1002', month: 98, all: 96)],
    address: '12 Main Street',
    locationNumber: '001',
    totalRevenue: 1840.50,
    shopStart: '09:00',
    shopEnd: '22:00',
  ),
  Location(
    shopName: 'Coffee Corner',
    locationId: 'loc-002',
    stationsInfo: [_station('CAB-1003', month: 91, all: 89)],
    address: '5 Park Avenue',
    locationNumber: '002',
    totalRevenue: 620.00,
    shopStart: '07:30',
    shopEnd: '20:00',
  ),
  Location(
    shopName: 'City Airport, Gate B',
    locationId: 'loc-003',
    stationsInfo: [
      _station('CAB-1004', month: 99, all: 97),
      _station('CAB-1005', online: false, month: 64, all: 81),
    ],
    address: 'Airport Road 1',
    locationNumber: '003',
    totalRevenue: 3215.75,
    shopStart: '00:00',
    shopEnd: '23:59',
  ),
  Location(
    shopName: 'Fitness Club',
    locationId: 'loc-004',
    stationsInfo: [_station('CAB-1006', online: false, month: 42, all: 70)],
    address: '88 River Street',
    locationNumber: '004',
    totalRevenue: 310.20,
    shopStart: '06:00',
    shopEnd: '23:00',
  ),
  Location(
    shopName: 'University Library',
    locationId: 'loc-005',
    stationsInfo: [_station('CAB-1007', month: 96, all: 94)],
    address: '3 Campus Square',
    locationNumber: '005',
    totalRevenue: 975.40,
    shopStart: '08:00',
    shopEnd: '21:00',
  ),
  Location(
    shopName: 'Railway Station',
    locationId: 'loc-006',
    stationsInfo: [
      _station('CAB-1008', month: 93, all: 90),
      _station('CAB-1009', month: 88, all: 86),
    ],
    address: 'Station Square 2',
    locationNumber: '006',
    totalRevenue: 2410.00,
    shopStart: '05:00',
    shopEnd: '01:00',
  ),
];
