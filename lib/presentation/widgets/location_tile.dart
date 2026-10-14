// // lib/presentation/widgets/location_tile.dart
//
// // TODO Should be changed
// import 'package:flutter/material.dart';
// import '../../data/models/location_card.dart';
// import 'station_info_tile.dart';
//
// class LocationTile extends StatelessWidget {
//   final LocationCard card;
//
//   const LocationTile({super.key, required this.card});
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: const EdgeInsets.symmetric(vertical: 8),
//       child: Padding(
//         padding: const EdgeInsets.all(12),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(card.address, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//             const SizedBox(height: 4),
//             Text('${card.locationType} • ${card.area}'),
//             const SizedBox(height: 8),
//             Text('Hours: ${card.shopStart} – ${card.shopEnd}'),
//             const SizedBox(height: 4),
//             Text('Revenue (90d): \$${card.totalRevenue.toStringAsFixed(2)}'),
//             const Divider(height: 16),
//             Text('Stations', style: TextStyle(fontWeight: FontWeight.w600)),
//             ...card.stationsInfo.map((s) => StationInfoTile(info: s)),
//           ],
//         ),
//       ),
//     );
//   }
// }

// lib/presentation/widgets/location_tile.dart

import 'package:flutter/material.dart';
import 'package:powerbank/presentation/widgets/status_circle_icon.dart';

import '../../domain/entities/location.dart';

/// A simple list tile showing a location name and its online/offline status.
class LocationTile extends StatelessWidget {
  /// The display name or address of the location.
  final Location loc;

  // /// True if the location is currently online.
  // final bool isOnline;
  //
  // /// Called when the tile is tapped.
  // final VoidCallback? onTap;

  const LocationTile({
    super.key,
    required this.loc,
    // required this.isOnline,
    // this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isOnline = loc.stationsInfo.any((st) => st.currentOnlineStatus == 1)
        ? true
        : false;

    final percentage =
        (loc.stationsInfo.fold(
                  0,
                  (prev, st) => prev + st.thirtyDaysOnlinePercentage,
                ) /
                loc.stationsInfo.length)
            .toInt();

    return ListTile(
      // onTap: onTap,
      visualDensity: const VisualDensity(vertical: -4),
      // to make the tile height 40
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Color(0x66808080), width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      title: Text(
        loc.shopName,
        style: Theme.of(
          context,
        ).textTheme.bodyMedium?.copyWith(fontSize: 15, height: 1.25),
      ),
      leading: StatusCircleIcon(
        isOnline: isOnline,
        percentage: percentage,
        size: 24,
      ),
    );
  }
}
