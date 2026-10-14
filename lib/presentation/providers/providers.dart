// lib/presentation/providers.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:powerbank/core/api/api_client.dart';
import 'package:powerbank/data/data_sources/dashboard_local_ds.dart';
import 'package:powerbank/data/data_sources/dashboard_remote_ds.dart';
import 'package:powerbank/data/data_sources/location_local_ds.dart';
import 'package:powerbank/data/data_sources/location_remote_ds.dart';
import 'package:powerbank/data/repositories/dashboard_repo_implementation.dart';
import 'package:powerbank/data/repositories/location_repo_implementation.dart';
import 'package:powerbank/domain/entities/dashboard_data.dart';
import 'package:powerbank/domain/entities/location.dart';
import 'package:powerbank/domain/models/time_type.dart';

final apiClientProvider = Provider(
  (_) => ApiClient(
    client: http.Client(),
    baseUri: Uri.parse("https://goldfish-app-3lf7u.ondigitalocean.app"),
  ),
);

final dashboardRemoteProvider = Provider(
  (ref) => DashboardRemoteDataSource(ref.read(apiClientProvider)),
);

final dashboardLocalProvider = Provider((_) => DashboardLocalDataSource());

final dashboardRepoProvider = Provider(
  (ref) => DashboardRepositoryImpl(
    remote: ref.read(dashboardRemoteProvider),
    local: ref.read(dashboardLocalProvider),
  ),
);

////////////////////////////////////////////////////////////////////////////////////////////////////////////
class DashboardNotifier extends StateNotifier<AsyncValue<DashboardData>> {
  DashboardNotifier(this._repo) : super(const AsyncValue.loading());

  final DashboardRepositoryImpl _repo;
  TimeType _selectedTimeType = TimeType.ALL_TIME;

  TimeType get selectedTimeType => _selectedTimeType;

  Future<void> loadDashboard({
    TimeType? timeType,
    DateTime? from,
    DateTime? to,
  }) async {
    state = const AsyncValue.loading();
    try {
      final data = await _repo.fetchDashboard(
        timeType ?? _selectedTimeType,
        from,
        to,
      );
      if (timeType != null) _selectedTimeType = timeType;
      state = AsyncValue.data(data);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}

final dashboardDataProvider =
    StateNotifierProvider<DashboardNotifier, AsyncValue<DashboardData>>(
      (ref) =>
          DashboardNotifier(ref.read(dashboardRepoProvider))..loadDashboard(),
    );
///////////////////////////////////////////////////////////////////////////////////////////////////////////
// final fetchDashboardProvider = Provider((ref) =>
//     FetchDashboardData(ref.read(dashboardRepoProvider)));
//
// final dashboardDataProvider =
// FutureProvider<DashboardData>((ref) => ref.read(fetchDashboardProvider).call());
// reads dashboard data
//////////////////////////////////////////////////////////
// final locationRemoteProvider =
// Provider((ref) => LocationRemoteDataSource(ref.read(apiClientProvider)));
// //
// final locationLocalProvider =
// Provider((_) => LocationLocalDataSource());
//
// final locationRepoProvider = Provider((ref) =>
//     LocationRepositoryImpl(
//       remote: ref.read(locationRemoteProvider),
//       local: ref.read(locationLocalProvider),
//     ));
//
//
// final locationsDataProvider =
// StateNotifierProvider<LocationsNotifier, AsyncValue<LocationsState>>(
//       (ref) => LocationsNotifier(ref.read(locationRepoProvider)),
// );
//////////////////////////////////////////////////////////////////////

// final fetchLocationsProvider = Provider((ref) =>
//     FetchLocations(ref.read(locationRepoProvider)));
//
// final locationsDataProvider =
// FutureProvider<List<Location>>((ref) => ref.read(fetchLocationsProvider)());
////////////////////////////////////////////////////////////////////////
// final apiClientProvider = Provider((_) =>
//     ApiClient(client: http.Client(),
//         baseUri: Uri.parse(baseUrl)));

final locationRemoteProvider = Provider(
  (ref) => LocationRemoteDataSource(ref.read(apiClientProvider)),
);

final locationLocalProvider = Provider((_) => LocationLocalDataSource());

final locationRepoProvider = Provider(
  (ref) => LocationRepositoryImpl(
    remote: ref.read(locationRemoteProvider),
    local: ref.read(locationLocalProvider),
  ),
);

final locationsDataProvider =
    StateNotifierProvider<LocationsNotifier, AsyncValue<LocationsState>>(
      (ref) =>
          LocationsNotifier(ref.read(locationRepoProvider))
            ..loadLocations(), // ← important!
    );

class LocationsState {
  final List<Location> allCards;

  const LocationsState({this.allCards = const []});
}

class LocationsNotifier extends StateNotifier<AsyncValue<LocationsState>> {
  LocationsNotifier(this._repo) : super(const AsyncValue.loading());

  final LocationRepositoryImpl _repo;

  Future<void> loadLocations() async {
    state = const AsyncValue.loading();
    try {
      final list = await _repo.fetchLocations();
      print('🏷️ Loaded ${list.length} locations');
      state = AsyncValue.data(LocationsState(allCards: list));
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  // /// 0 = All, 1 = Offline, 2 = Online
  // void applyFilter(int index) {
  //   final current = state.value;
  //   if (current == null) return;
  //
  //   List<Location> filtered;
  //   switch (index) {
  //     case 1: // Offline
  //       filtered = current.allCards.where((loc) {
  //         // A location is “offline” if none of its stations are online
  //         return loc.stationsInfo.every((s) => s.currentOnlineStatus != 1);
  //       }).toList();
  //       break;
  //     case 2: // Online
  //       filtered = current.allCards.where((loc) {
  //         // A location is “online” if at least one station is online
  //         return loc.stationsInfo.any((s) => s.currentOnlineStatus == 1);
  //       }).toList();
  //       break;
  //     case 0:  // All
  //     default:
  //       filtered = current.allCards;
  //       break;
  //   }

  // Preserve any existing search term (if you re-introduce it later)
  // state = AsyncValue.data(
  //   current.copyWith(filteredCards: filtered),
  // );
}

// }

// final locationsDataProvider = StateNotifierProvider<LocationsNotifier, AsyncValue<LocationsState>>(
//       (ref) => LocationsNotifier(ref.read(locationsRepoProvider))..fetchAll(),
// );
