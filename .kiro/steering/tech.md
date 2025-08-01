# Technology Stack

## Framework & Language
- **Flutter**: Cross-platform mobile development framework
- **Dart**: Programming language (SDK ^3.7.2)
- **Material Design 3**: UI design system with custom theming

## Key Dependencies
- **go_router**: ^14.2.7 - Declarative routing
- **provider**: ^6.1.2 - State management
- **firebase_core**: ^3.15.2 - Firebase integration
- **firebase_auth**: ^5.3.1 - Authentication services
- **google_fonts**: ^6.2.1 - Typography (Inter font family)
- **cupertino_icons**: ^1.0.8 - iOS-style icons

## Development Tools
- **flutter_lints**: ^5.0.0 - Code analysis and linting
- **flutter_test**: Testing framework

## Build System
Flutter uses its standard build system with platform-specific configurations:
- **Android**: Gradle build system with Kotlin DSL
- **iOS**: Xcode project with Swift
- **Web**: Dart compilation to JavaScript
- **Desktop**: Native compilation for Windows, macOS, Linux

## Common Commands

### Development
```bash
# Get dependencies
flutter pub get

# Run on connected device/emulator
flutter run

# Run in debug mode with hot reload
flutter run --debug

# Run on specific platform
flutter run -d chrome          # Web
flutter run -d android         # Android
flutter run -d ios            # iOS
```

### Building
```bash
# Build APK for Android
flutter build apk

# Build app bundle for Play Store
flutter build appbundle

# Build for iOS
flutter build ios

# Build for web
flutter build web

# Build for desktop
flutter build windows
flutter build macos
flutter build linux
```

### Testing & Analysis
```bash
# Run tests
flutter test

# Analyze code
flutter analyze

# Format code
dart format .
```

### Firebase Setup
- Firebase project configured with google-services.json (Android) and GoogleService-Info.plist (iOS/macOS)
- Authentication enabled for email/password sign-in