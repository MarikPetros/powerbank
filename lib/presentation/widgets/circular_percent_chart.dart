// lib/presentation/widgets/circular_percent_chart.dart

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class CircularPercentChart extends StatelessWidget {
  /// Percentage from 0.0 to 100.0
  final double percent;

  /// Diameter of the chart
  final double size;

  const CircularPercentChart({
    super.key,
    required this.percent,
    this.size = 128.15,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: PieChart(
        PieChartData(
          startDegreeOffset: -90,
          sectionsSpace: 0,
          centerSpaceRadius: 0,
          sections: [
            PieChartSectionData(
              value: percent,
              color: const Color(0xFF8BEB23),
              showTitle: false,
              radius: size / 2,
            ),
            PieChartSectionData(
              value: 100 - percent,
              color: const Color(0xEEFFD7D1),
              showTitle: false,
              radius: size / 2,
            ),
          ],
        ),
      ),
    );
  }
}
