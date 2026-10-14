# Powerbank Sharing — Operator Dashboard (Flutter)

A manager dashboard for a power-bank sharing network: live station statistics, usage charts filtered by time range, and a searchable list of rental locations.

## Features
- Dashboard with circular percentage charts and usage graphs (fl_chart, percent_indicator)
- Time-range filters (day / week / month)
- Locations list with station status and sorting
- Offline cache with Hive — last data shown instantly, refreshed from the API

## Architecture
Clean Architecture with three layers:
- `domain/` — entities, repository contracts, use cases
- `data/` — remote + local data sources, models, repository implementations
- `presentation/` — Riverpod providers, view models, screens and widgets

## Tech stack
Flutter · Dart · Riverpod · Dio/http · Hive · fl_chart · Google Fonts

## Run
The API token is not stored in the code. Pass it at build time:
```bash
flutter pub get
flutter run --dart-define=API_TOKEN=<your_token>
```

### Demo mode (no backend needed)
```bash
flutter run --dart-define=DEMO=true
```
Shows sample stations and locations, useful for screenshots.

## Screenshots
<!-- Add dashboard + locations screenshots here -->

## Author
Marine (Marik) Petrosyan — Flutter & native mobile developer · [Portfolio](https://marikpetros.lovable.app)
