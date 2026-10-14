// lib/core/cache/cache_manager.dart

import 'package:hive_flutter/hive_flutter.dart';

class CacheManager {
  static const dashboardBox = 'dashboard_box';
  static const locationsBox = 'locations_box';

  static Future init() async {
    await Hive.initFlutter();
    await Hive.openBox(dashboardBox);
    await Hive.openBox(locationsBox);
  }

  Box box(String name) => Hive.box(name);
}
