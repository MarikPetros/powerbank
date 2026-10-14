// lib/presentation/widgets/station_info_tile.dart

// TODO should be changed

import 'package:flutter/material.dart';
import '../../domain/entities/station_info.dart';

class StationInfoTile extends StatelessWidget {
  final StationInfo info;

  const StationInfoTile({super.key, required this.info});

  @override
  Widget build(BuildContext context) {
    final color = info.currentOnlineStatus == 1 ? Colors.green : Colors.red;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(Icons.circle, size: 12, color: color),
          const SizedBox(width: 8),
          Expanded(child: Text(info.cabinetId)),
          Text('${info.thirtyDaysOnlinePercentage.toStringAsFixed(0)}%'),
        ],
      ),
    );
  }
}
