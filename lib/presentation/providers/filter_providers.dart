// lib/presentation/providers/filter_providers.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// 0 = All, 1 = Offline, 2 = Online
final locationsFilterProvider = StateProvider<int>((_) => 0);
