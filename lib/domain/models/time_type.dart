// lib/domain/models/time_type.dart

/// Represents the selectable time ranges for dashboard queries.
enum TimeType {
  TODAY('Today'),
  YESTERDAY('Yesterday'),
  THIS_WEEK('This Week'),
  THIS_MONTH('This Month'),
  LAST_WEEK('Last Week'),
  LAST_MONTH('Last Month'),
  ALL_TIME('All time');

  /// The human-readable label shown in dropdowns.
  final String displayName;

  const TimeType(this.displayName);

  /// The value sent to the API (matches enum name exactly).
  String get apiValue => name;
}
