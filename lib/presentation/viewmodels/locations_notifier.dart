// lib/presentation/viewmodels/locations_notifier.dart
//
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:powerbank/data/repositories/location_repo_implementation.dart';
// import 'package:powerbank/domain/entities/location.dart';
//
//
// // import '../../data/models/location_card.dart';
// //
// //   class LocationsState {
// //   final bool isLoading;
// //   final List<Location> allCards;
// //   final List<Location> filteredCards;
// //   final String searchTerm;
// //   final String? error;
// //
// //   LocationsState({
// //     this.isLoading = false,
// //     this.allCards = const [],
// //     this.filteredCards = const [],
// //     this.searchTerm = '',
// //     this.error,
// //   });
// //
// //   LocationsState copyWith({
// //     bool? isLoading,
// //     List<Location>? allCards,
// //     List<Location>? filteredCards,
// //     String? searchTerm,
// //     String? error,
// //   }) {
// //     return LocationsState(
// //       isLoading: isLoading ?? this.isLoading,
// //       allCards: allCards ?? this.allCards,
// //       filteredCards: filteredCards ?? this.filteredCards,
// //       searchTerm: searchTerm ?? this.searchTerm,
// //       error: error,
// //     );
// //   }
// // }
//
//
//
//   // placeholders for filter & sort
//   // void applyFilter(/* ... */) {}
//   //
//   // void applySort(/* ... */) {}

//
// final locationsNotifierProvider =
//     StateNotifierProvider<LocationsNotifier, AsyncValue<LocationsState>>(
//       (ref) => LocationsNotifier(ref.read(locationRepoProvider)),
//     );
