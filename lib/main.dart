import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/cache/cache_manager.dart';
import 'presentation/screens/dashboard_screen.dart';
import 'presentation/screens/locations_screen.dart';
import 'theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheManager.init();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Powerbank Sharing',
      theme: appTheme,
      routes: {
        '/': (_) => const DashboardScreen(),
        '/locations': (_) => const LocationsScreen(),
      },
    );
  }
}
