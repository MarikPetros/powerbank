// // lib/presentation/viewmodels/locations_vm.dart
//
// // ??????????????????????????????????????
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import '../../data/repositories/manager_repository.dart';
// import '../../data/services/providers.dart';
// import '../../domain/use_cases/fetch_locations.dart';
// import '../../data/models/location_card.dart';
//
// final managerRepoProvider =
// Provider((ref) => ManagerRepository(ref.read(apiClientProvider), ref.read(cacheServiceProvider)));
//
// final fetchLocationCardsUseCaseProvider =
// Provider((ref) => FetchLocationCards(ref.read(managerRepoProvider)));
//
// final locationCardsProvider =
// FutureProvider<List<LocationCard>>((ref) async {
//   return ref.read(fetchLocationCardsUseCaseProvider).execute();
// });
