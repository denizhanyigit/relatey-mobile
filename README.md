# Relatey – Clear Decisions

A premium relationship clarity app built with Flutter.

## Quick Start

```bash
# Install dependencies
flutter pub get

# Generate code (Freezed, Drift, JSON)
dart run build_runner build --delete-conflicting-outputs

# Run the app
flutter run
```

## Environment Configuration

### Backend URL

The app connects to a NestJS backend. Configure via dart-define:

```bash
# Android Emulator
flutter run --dart-define=BASE_URL=http://10.0.2.2:3000

# iOS Simulator  
flutter run --dart-define=BASE_URL=http://localhost:3000

# Physical Device (use your machine's IP)
flutter run --dart-define=BASE_URL=http://192.168.1.100:3000
```

### Mock Mode

Currently runs with **mocked data** (no backend required). The anonymous auth bootstrap simulates a session and entitlements are cached locally.

## Project Structure

```
lib/
├── app/                    # App setup, router, bootstrap
├── core/                   # Shared infrastructure
│   ├── config/            # Environment, endpoints  
│   ├── design/            # Design system (tokens, theme, components)
│   ├── di/                # Dependency injection
│   ├── network/           # Dio, interceptors
│   ├── storage/           # Drift database
│   ├── utils/             # Device ID, token utilities
│   └── errors/            # Exceptions and failures
└── features/              # Feature modules
    ├── auth/              # Anonymous authentication
    ├── entitlements/      # Credits, pro status, access policy
    ├── decisions/         # Decision flow (Home → Context → Summary)
    └── paywall/           # Credit purchase screen
```

## Navigation Flow

```
Home Screen
    │
    ├─── Select Situation ("İlişki Seçimleri", "İletişim", etc.)
    │
    ▼
Context Screen (Input your situation)
    │
    ├─── [AccessPolicy check: hasCredits?]
    │    ├── Yes → Summary Screen
    │    └── No → Paywall Screen
    │
    ▼
Summary Screen (Analysis results - mocked)
```

## Features

- **Anonymous Auth**: Device-based authentication via `POST /v1/auth/anonymous`
- **Decision Flow**: Select situation → Describe context → View analysis
- **Access Policy**: Centralized gating logic (`canViewSummary`, `shouldShowPaywall`)
- **Entitlements Cache**: Local Drift storage for `hasPro` and `credits`
- **DEV Button**: Simulate +3 credits on Paywall for testing

## Design System

- **Primary**: Sage green (`#7C9082`)
- **Background**: Off-white (`#FAFAF8`)
- **Surface**: White (`#FFFFFF`)
- **Accent**: Warm coral (`#D4A373`)
- **Typography**: System fonts (San Francisco/Roboto) - custom fonts can be added
- **Components**: `RelateyCard`, `PrimaryButton`, `SecondaryButton`, `InputField`, `SituationTile`, `LensTile`

## Tech Stack

| Category | Package |
|----------|---------|
| State | `flutter_riverpod` |
| Navigation | `go_router` |
| Network | `dio`, `pretty_dio_logger` |
| Database | `drift`, `drift_flutter` |
| Secure Storage | `flutter_secure_storage` |
| Code Gen | `freezed`, `json_serializable` |

## Adding Custom Fonts

To use Instrument Sans (or another custom font):

1. Download font files and place in `assets/fonts/`
2. Update `pubspec.yaml`:

```yaml
flutter:
  uses-material-design: true
  
  fonts:
    - family: Instrument Sans
      fonts:
        - asset: assets/fonts/InstrumentSans-Regular.ttf
        - asset: assets/fonts/InstrumentSans-Medium.ttf
          weight: 500
        - asset: assets/fonts/InstrumentSans-SemiBold.ttf
          weight: 600
        - asset: assets/fonts/InstrumentSans-Bold.ttf
          weight: 700
```

3. Update `lib/core/design/tokens/typography.dart`:

```dart
static const String? _fontFamily = 'Instrument Sans';
```

## Backend API Endpoints

The app expects these endpoints from the NestJS backend:

| Method | Endpoint | Description |
|--------|----------|-------------|
| POST | `/v1/auth/anonymous` | Create anonymous session |
| POST | `/v1/auth/refresh` | Refresh access token |
| GET | `/v1/entitlements` | Get user entitlements |
| POST | `/v1/decisions` | Create new decision |
| GET | `/v1/decisions/:id` | Get decision details |
| GET | `/v1/decisions/:id/summary` | Get decision summary |

## Development

```bash
# Watch for code changes and regenerate
dart run build_runner watch --delete-conflicting-outputs

# Clean rebuild
flutter clean && flutter pub get
dart run build_runner build --delete-conflicting-outputs

# Run tests
flutter test
```
