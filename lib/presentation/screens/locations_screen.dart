// // // lib/presentation/screens/locations_screen.dart
// // //
// // // import 'package:flutter/material.dart';
// // // import 'package:flutter_riverpod/flutter_riverpod.dart';
// // //
// // // import '../providers/providers.dart';
// // // import '../widgets/location_tile.dart';
// //
// // // class LocationsScreen extends ConsumerWidget {
// // //   const LocationsScreen({super.key});
// // //
// // //   @override
// // //   Widget build(BuildContext context, WidgetRef ref) {
// // //     final state = ref.watch(locationsDataProvider);
// // //     final notifier = ref.read(locationsDataProvider.notifier);
// // //
// // //     return Scaffold(
// // //       appBar: AppBar(title: Text('Locations'), centerTitle: true),
// // //       body: Column(
// // //         children: [
// // //           Padding(
// // //             padding: const EdgeInsets.all(24),
// // //             child: TextField(
// // //               decoration: InputDecoration(
// // //                 hintText: 'Search locations...',
// // //                 prefixIcon: Icon(Icons.search),
// // //                 border: OutlineInputBorder(),
// // //               ),
// // //               onChanged: notifier.search,
// // //             ),
// // //           ),
// // //           Expanded(
// // //             child: state.when(
// // //               data: (list) => ListView.builder(
// // //                 padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
// // //                 itemCount: list.allCards.length,
// // //                 itemBuilder: (_, i) => LocationTile(loc: list.allCards[i]),
// // //           ),
// // //               error: (Object error, StackTrace stackTrace) =>
// // //                   Center(child: Text('Error: ${state.error}')),
// // //               loading: () => Center(child: CircularProgressIndicator()),
// // //             ),
// // //           ),
// // //         ],
// // //       ),
// // //     );
// // //   }
// // // }
// //
// // // lib/presentation/screens/locations_screen.dart
// //
// // // import 'package:flutter/material.dart';
// // // import 'package:flutter_riverpod/flutter_riverpod.dart';
// // //
// // // import '../providers/providers.dart';
// // // import '../widgets/location_tile.dart';
// //
// // // class LocationsScreen extends ConsumerWidget {
// // //   const LocationsScreen({Key? key}) : super(key: key);
// // //
// // //   @override
// // //   Widget build(BuildContext context, WidgetRef ref) {
// // //     final asyncState = ref.watch(locationsDataProvider);
// // //
// // //     return Scaffold(
// // //       appBar: AppBar(title: const Text('Locations'), centerTitle: true),
// // //       body: asyncState.when(
// // //         loading: () => const Center(child: CircularProgressIndicator()),
// // //         error: (err, _) => Center(child: Text('Error: $err')),
// // //         data: (state) {
// // //           final list = state.allCards;
// // //
// // //           if (list.isEmpty) {
// // //             return const Center(child: Text('No locations available'));
// // //           }
// // //
// // //           return ListView.separated(
// // //             padding:
// // //             const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
// // //             separatorBuilder: (_, __) => const Divider(),
// // //             itemCount: list.length,
// // //             itemBuilder: (_, i) {
// // //               final loc = list[i];
// // //               // pick your status + percent however you like:
// // //               final isOnline = loc.stationsInfo.first.currentOnlineStatus == 1;
// // //               final pct = loc.stationsInfo.first.thirtyDaysOnlinePercentage;
// // //
// // //               return LocationTile(
// // //                 loc: loc,
// // //               );
// // //             },
// // //           );
// // //         },
// // //       ),
// // //     );
// // //   }
// // // }
// //
// // import 'package:flutter/material.dart';
// // import 'package:flutter_riverpod/flutter_riverpod.dart';
// //
// // import '../providers/providers.dart';
// // import '../widgets/location_tile.dart';
// //
// // class LocationsScreen extends ConsumerWidget {
// //   const LocationsScreen({super.key});
// //
// //   @override
// //   Widget build(BuildContext context, WidgetRef ref) {
// //     final asyncState = ref.watch(locationsDataProvider);
// //
// //     return Scaffold(
// //       appBar: AppBar(title: const Text('Locations')),
// //       body: Column(
// //         children: [
// //           Expanded(
// //             child: asyncState.when(
// //               loading:   () => const Center(child: CircularProgressIndicator()),
// //               error:     (e, _) => Center(child: Text('Error: $e')),
// //               data:      (state) {
// //                 final list = state.allCards;
// //                 if (list.isEmpty) {
// //                   return const Center(child: Text('No locations available'));
// //                 }
// //
// //                 return ListView.separated(
// //                   padding: const EdgeInsets.all(16),
// //                   separatorBuilder: (_, __) => const Divider(),
// //                   itemCount: list.length,
// //                   itemBuilder: (_, i) {
// //                     final loc = list[i];
// //                     // final isOnline = loc.stationsInfo.first.currentOnlineStatus == 1;
// //                     // final pct      = loc.stationsInfo.first.thirtyDaysOnlinePercentage;
// //                     return LocationTile(
// //                       loc: loc,
// //                     );
// //                   },
// //                 );
// //               },
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }
// //
// //
// // lib/presentation/screens/locations_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/filter_providers.dart';
import '../providers/providers.dart';
import '../widgets/location_tile.dart';

class LocationsScreen extends ConsumerWidget {
  const LocationsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // your async list state...
    final asyncState = ref.watch(locationsDataProvider);

    // selected tab index from our filter provider
    final selectedTab = ref.watch(locationsFilterProvider);
    final setTab = ref.read(locationsFilterProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: const Text('Locations'), centerTitle: true),
      body: Column(
        children: [
          // 1) Tabs + icons row
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 12.83,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // a) The three text-tabs
                Expanded(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      _TabButton(
                        label: 'All',
                        isActive: selectedTab == 0,
                        // onTap: () => setTab(0),
                      ),
                      const SizedBox(width: 38),
                      _TabButton(
                        label: 'Offline',
                        isActive: selectedTab == 1,
                        // onTap: () => setTab(1),
                      ),
                      const SizedBox(width: 38),
                      _TabButton(
                        label: 'Online',
                        isActive: selectedTab == 2,
                        // onTap: () => setTab(2),
                      ),
                    ],
                  ),
                ),

                // b) Filter icon
                const SizedBox(width: 38),
                GestureDetector(
                  onTap: () {
                    // open filter panel
                  },
                  child: Image.asset(
                    'assets/images/Vector.png',
                    width: 24,
                    height: 24,
                  ),
                ),

                // c) Sort icon
                const SizedBox(width: 38),
                GestureDetector(
                  onTap: () {
                    // open sort options
                  },
                  child: Image.asset(
                    'assets/images/sort-vertical.png',
                    width: 24,
                    height: 24,
                  ),
                ),
              ],
            ),
          ),

          // gap between the two header rows
          const SizedBox(height: 12),

          // 2) Search text-field row
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                color: const Color(0xFFF5F5F5),
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Enter name/address or ID',
                  hintStyle: const TextStyle(color: Color(0xFFA0A0A0)),
                  border: InputBorder.none,
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Color(0xFFA0A0A0),
                    size: 20,
                  ),
                  isDense: true, // reduces default vertical padding
                ),
                onChanged: (value) {
                  // call notifier.search(value) if needed
                },
              ),
            ),
          ),

          // 3) Your list
          Expanded(
            child: asyncState.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) => Center(child: Text('Error: $e')),
              data: (state) {
                final list = state.allCards;
                if (list.isEmpty) {
                  return const Center(child: Text('No locations available'));
                }
                return ListView.builder(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  itemCount: list.length,
                  itemBuilder: (_, i) {
                    final loc = list[i];
                    return LocationTile(loc: loc);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

/// A reusable tab button that switches active/inactive colors
class _TabButton extends StatelessWidget {
  final String label;
  final bool isActive;

  // final VoidCallback onTap;

  const _TabButton({
    required this.label,
    required this.isActive,
    // required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: onTap,
      child: Text(
        label,
        style: Theme.of(context).textTheme.headlineLarge?.copyWith(
          fontSize: 18,
          height: 1.45,
          color: isActive
              ? const Color(0xFF0B0B0B)
              : const Color(0xFF606060).withValues(alpha: 0.8),
        ),
      ),
    );
  }
}

//////////////////////
///////////////////////////?***************************************
// library;
//
//
// // lib/presentation/screens/locations_screen.dart
//
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
//
// import '../providers/providers.dart';
// import '../widgets/location_tile.dart';
//
// class LocationsScreen extends ConsumerWidget {
//   const LocationsScreen({super.key});
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     // 1) Watch your locations AsyncValue
//     final asyncState = ref.watch(locationsDataProvider);
//
//     // 2) Grab the notifier to call applyFilter(index) on tab taps
//     final notifier = ref.read(locationsDataProvider.notifier);
//
//     return DefaultTabController(
//       length: 3, // All / Offline / Online
//       child: Scaffold(
//         appBar: AppBar(title: const Text('Locations'), centerTitle: true),
//         body: Column(
//           children: [
//             // ─── TABS + FILTER + SORT ROW ─────────────────────────
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
//               child: Row(
//                 children: [
//                   // a) TabBar that evenly divides its width among 3 tabs
//                   Expanded(
//                     child: TabBar(
//                       // onTap: (index) {
//                       //   // call your filter logic here:
//                       //   notifier.applyFilter(index);
//                       // },
//                       indicator: BoxDecoration(),
//                       isScrollable: false,
//                       labelStyle: Theme.of(context).textTheme.headlineLarge
//                           ?.copyWith(fontSize: 18, height: 1.45),
//                       // fill all space
//                       indicatorColor: Colors.transparent,
//                       labelColor: const Color(0xFF0B0B0B),
//                       unselectedLabelColor: const Color(
//                         0xFF606060,
//                       ).withOpacity(0.8),
//                       tabs: const [
//                         Tab(text: 'All'),
//                         Tab(text: 'Offline'),
//                         Tab(text: 'Online'),
//                       ],
//                     ),
//                   ),
//
//                   // b) 38 px gap before Filter icon
//                   const SizedBox(width: 38),
//
//                   // c) Filter icon
//                   GestureDetector(
//                     onTap: () {
//                       // TODO: open your filter panel
//                     },
//                     child: Image.asset(
//                       'assets/images/Vector.png',
//                       width: 24,
//                       height: 24,
//                     ),
//                   ),
//
//                   // d) 38 px gap before Sort icon
//                   const SizedBox(width: 38),
//
//                   // e) Sort icon
//                   GestureDetector(
//                     onTap: () {
//                       // TODO: open your sort options
//                     },
//                     child: Image.asset(
//                       'assets/images/sort-vertical.png',
//                       width: 24,
//                       height: 24,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//
//             // 12 px vertical gap to the search field
//             const SizedBox(height: 12),
//
//             // ─── SEARCH FIELD ROW ──────────────────────────────────
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16),
//               child: Container(
//                 height: 40,
//                 decoration: BoxDecoration(
//                   color: const Color(0xFFF5F5F5),
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 padding: const EdgeInsets.symmetric(horizontal: 8),
//                 child: const TextField(
//                   decoration: InputDecoration(
//                     hintText: 'Enter name/address or ID',
//                     hintStyle: TextStyle(color: Color(0xFFA0A0A0)),
//                     border: InputBorder.none,
//                     prefixIcon: Icon(
//                       Icons.search,
//                       color: Color(0xFFA0A0A0),
//                       size: 20,
//                     ),
//                     isDense: true,
//                   ),
//                 ),
//               ),
//             ),
//
//             // ─── THE LIST ─────────────────────────────────────────
//             // Expanded(
//             //   child: asyncState.when(
//             //     loading: () =>
//             //     const Center(child: CircularProgressIndicator()),
//             //     error: (e, _) =>
//             //         Center(child: Text('Error: $e')),
//             //     data: (state) {
//             //       final list = state.filteredCards;
//             //       if (list.isEmpty) {
//             //         return const Center(
//             //             child: Text('No locations available'));
//             //       }
//             //       return ListView.builder(
//             //         padding: const EdgeInsets.symmetric(
//             //             horizontal: 16, vertical: 8),
//             //         itemCount: list.length,
//             //         itemBuilder: (_, i) =>
//             //             LocationTile(loc: list[i]),
//             //       );
//             //     },
//             //   ),
//             // ),
//             Expanded(
//               child: asyncState.when(
//                 loading: () => const Center(child: CircularProgressIndicator()),
//                 error: (e, _) => Center(child: Text('Error: $e')),
//                 data: (state) {
//                   final list = state.allCards;
//                   if (list.isEmpty) {
//                     return const Center(child: Text('No locations available'));
//                   }
//                   return ListView.builder(
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 16,
//                       vertical: 8,
//                     ),
//                     itemCount: list.length,
//                     itemBuilder: (_, i) {
//                       final loc = list[i];
//                       return LocationTile(loc: loc);
//                     },
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// loc
