// // lib/presentation/viewmodels/dashboard_vm.dart
//
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import '../../data/models/dashboard_response.dart';
// import '../../data/repositories/manager_repository.dart';
// import '../../data/models/time_type.dart';
// import '../../data/services/providers.dart';
//
// class DashboardNotifier
//     extends StateNotifier<AsyncValue<DashboardResponse>> {
//   DashboardNotifier(this._repo) : super(const AsyncValue.loading()) {
//     loadDashboard();
//   }
//
//   final ManagerRepository _repo;
//   TimeType selectedTimeType = TimeType.ALL_TIME;
//
//   Future<void> loadDashboard({
//     TimeType? timeType,
//     DateTime? from,
//     DateTime? to,
//   }) async {
//     state = const AsyncValue.loading();
//     try {
//       final data = await _repo.fetchDashboard(
//         timeType: timeType ?? selectedTimeType,
//         from: from,
//         to: to,
//       );
//       selectedTimeType = timeType ?? selectedTimeType;
//       state = AsyncValue.data(data);
//     } catch (e, st) {
//       state = AsyncValue.error(e, st);
//     }
//   }
// }
//
// final dashboardProvider = StateNotifierProvider<
//     DashboardNotifier, AsyncValue<DashboardResponse>>(
//       (ref) => DashboardNotifier(ref.read(managerRepoProvider)),
// );
