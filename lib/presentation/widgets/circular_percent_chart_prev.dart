// // presentation/widgets/circular_percent_chart_prev.dart
// import 'package:flutter/material.dart';
// import 'package:percent_indicator/circular_percent_indicator.dart';
//
// class CircularPercentChart extends StatelessWidget {
//   final double percent;  // 0.0 to 1.0
//   final String label;
//
//   const CircularPercentChart({super.key,
//     required this.percent,
//     required this.label,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return CircularPercentIndicator(
//       radius: 120,
//       lineWidth: 16,
//       percent: percent.clamp(0.0, 1.0),
//       center: Text(label, style: TextStyle(fontSize: 24)),
//       progressColor: Theme.of(context).primaryColor,
//       backgroundColor: Colors.grey.shade300,
//       circularStrokeCap: CircularStrokeCap.round,
//     );
//   }
// }

// lib/presentation/widgets/circular_percent_chart_prev.dart

import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

/// A circular progress display showing a percentage with an optional subtitle.
class CircularPercentChart extends StatelessWidget {
  /// Fraction between 0.0 and 1.0.
  final double percent;

  /// Main label in the center (e.g. "82%").
  // final String label;

  /// Optional subtitle below the main label (e.g. date range).
  // final String? subtitle;

  const CircularPercentChart({
    super.key,
    required this.percent,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return CircularPercentIndicator(
      radius: 100,
      lineWidth: 12,
      percent: percent/100,//.clamp(0.0, 1.0),
      animation: true,
      animationDuration: 600,
      progressColor: const Color(0xFF8BEB23),
      backgroundColor: theme.colorScheme.onSurface.withValues(alpha: 0.1),
      circularStrokeCap: CircularStrokeCap.round,
    );
  }
}
