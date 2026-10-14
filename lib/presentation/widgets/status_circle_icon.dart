// lib/presentation/widgets/status_circle_icon.dart

import 'package:flutter/material.dart';

class StatusCircleIcon extends StatelessWidget {
  /// true = online (green border), false = offline (red border)
  final bool isOnline;

  /// The percentage number to show (e.g. 95)
  final int percentage;

  /// Diameter of the circle
  final double size;

  const StatusCircleIcon({
    super.key,
    required this.isOnline,
    required this.percentage,
    this.size = 24,
  });

  @override
  Widget build(BuildContext context) {
    final borderColor = isOnline
        ? const Color(0xFF8BEB23)
        : const Color(0xEEFFD7D1);
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: borderColor, width: 1),
      ),
      alignment: Alignment.center,
      child: Text(
        '$percentage',
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
          color: isOnline ? const Color(0xFF434B2B) : const Color(0x77881000),
          fontSize: 12,
          height: 1.25,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
