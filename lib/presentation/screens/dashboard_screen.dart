// lib/presentation/screens/dashboard_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:powerbank/domain/models/time_type.dart';
import 'package:powerbank/presentation/providers/providers.dart';
import 'package:powerbank/presentation/screens/locations_screen.dart';
import 'package:powerbank/presentation/widgets/circular_percent_chart.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(dashboardDataProvider);
    final notifier = ref.read(dashboardDataProvider.notifier);
    final selected = notifier.selectedTimeType;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Manager Dashboard',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(24, 16, 24, 46.68),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Column(
                children: [
                  Container(
                    height: 50,
                    color: const Color(0x22FFFFFF),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Summary',
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(color: const Color(0xFF606060)),
                        ),
                        // Time selector dropdown
                        DropdownButton<TimeType>(
                          value: selected,
                          items: TimeType.values
                              .map(
                                (t) => DropdownMenuItem(
                                  value: t,
                                  child: Text(
                                    t.apiValue.replaceAll('_', ' '),
                                    style: Theme.of(context).textTheme.bodyMedium
                                        ?.copyWith(
                                          fontSize: 13,
                                          letterSpacing: 0.02,
                                        ),
                                  ),
                                ),
                              )
                              .toList(),
                          onChanged: (newType) {
                            if (newType != null) {
                              notifier.loadDashboard(timeType: newType);
                            }
                          },
                          focusColor: Color(0xFFF5F5F5),
                          padding: EdgeInsets.symmetric(
                            vertical: 16,
                            horizontal: 7,
                          ),
                          borderRadius: BorderRadius.circular(5),
                          // icon: AssetImage('assets/icons/arrow_down.png'),
                        ),
                      ],
                    ),
                  ),
                  // SizedBox(height: 8),
                  state.when(
                    data: (d) => Column(
                      children: [
                        Container(
                          height: 161,
                          padding: EdgeInsets.fromLTRB(20, 14.8, 19, 18),
                          decoration: BoxDecoration(
                            color: const Color(0xFFE9FAFF),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Average stations online',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                          color: Colors.black,
                                          fontSize: 18,
                                        ),
                                    maxLines: 2,
                                  ),
                                  Text(
                                    '${d.avgOnlinePercent.toInt()}%',
                                    style: Theme.of(context)
                                        .textTheme
                                        .displaySmall
                                        ?.copyWith(color: Colors.black),
                                  ),
                                  Text(
                                    notifier.selectedTimeType.apiValue,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(color: Color(0xFF606060)),
                                  ),
                                ],
                              ),
                              CircularPercentChart(percent: d.avgOnlinePercent),
                            ],
                          ),
                        ),
                        SizedBox(height: 12),
                        Container(
                          height: 20,
                          width: double.infinity,
                          color: const Color(0x22FFFFFF),
                          child: Text(
                            'Locations',
                            style: Theme.of(context).textTheme.titleMedium
                                ?.copyWith(color: Color(0xFF606060)),
                          ),
                        ),
                        SizedBox(height: 8),
                        Container(
                          height: 57,
                          padding: EdgeInsets.fromLTRB(20, 18, 16, 18),
                          decoration: BoxDecoration(
                            color: const Color(0xFFE9FAFF),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) => LocationsScreen(),
                                ),
                              );
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'Total locations:',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                            color: Colors.black,
                                            fontSize: 18,
                                          ),
                                    ),
                                    SizedBox(width: 4),
                                    Text(
                                      '${d.totalLocations}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .displaySmall
                                          ?.copyWith(color: Colors.black),
                                    ),
                                  ],
                                ),
                                Icon(Icons.arrow_forward_ios_rounded),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    loading: () =>
                        const Center(child: CircularProgressIndicator()),
                    error: (e, _) => Center(child: Text('Error: $e')),
                  ),
                ],
              ),
            ),
            Text(
              'Logout',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontSize: 18,
                letterSpacing: 0.02,
                decoration: TextDecoration.underline,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
