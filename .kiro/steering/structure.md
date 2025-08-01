# Project Structure

## Root Directory
```
radz/
├── lib/                    # Main Dart source code
├── assets/                 # Static assets (images, icons)
├── android/               # Android-specific configuration
├── ios/                   # iOS-specific configuration
├── web/                   # Web-specific configuration
├── windows/               # Windows-specific configuration
├── macos/                 # macOS-specific configuration
├── linux/                 # Linux-specific configuration
├── test/                  # Unit and widget tests
├── pubspec.yaml           # Dependencies and project configuration
└── README.md              # Project documentation
```

## Source Code Organization (`lib/`)

### Core Architecture
```
lib/
├── main.dart              # App entry point with routing setup
├── firebase_options.dart  # Firebase configuration
├── core/                  # Core application logic
│   ├── services/          # Business logic services
│   │   ├── auth_service.dart      # Firebase authentication
│   │   └── language_service.dart  # Localization service
│   └── theme/             # UI theming
│       ├── app_colors.dart        # Brand color definitions
│       ├── app_theme.dart         # Material theme configuration
│       └── radz_theme.dart        # Custom theme extensions
├── screens/               # UI screens/pages
│   ├── auth/              # Authentication screens
│   │   ├── login_screen.dart
│   │   ├── signup_screen.dart
│   │   └── user_info_screen.dart
│   ├── splash_screen.dart
│   ├── main_navigation_screen.dart
│   ├── driver_home_screen.dart
│   ├── campaigns_screen.dart
│   ├── earnings_screen.dart
│   └── profile_screen.dart
└── widgets/               # Reusable UI components
    ├── radz_*.dart        # Custom branded widgets
    └── language_toggle.dart
```

## Architecture Patterns

### State Management
- **Provider**: Used for global state management
- **ChangeNotifier**: Services extend this for reactive updates
- **Consumer/Provider.of**: UI widgets consume state changes

### Navigation
- **GoRouter**: Declarative routing with deep linking support
- **Route Structure**: 
  - `/splash` - Initial loading screen
  - `/login`, `/signup`, `/user-info` - Authentication flow
  - `/home` - Main navigation with tab index parameter
  - `/campaigns`, `/earnings`, `/profile` - Direct deep links

### Service Layer
- **AuthService**: Handles Firebase authentication, user state
- **LanguageService**: Manages app localization

### UI Components
- **Custom Widgets**: Prefixed with `Radz` for brand consistency
- **Theme System**: Centralized color and typography definitions
- **Material Design 3**: Base design system with custom overrides

## Asset Organization
```
assets/
├── images/
│   ├── radz.png           # Main logo
│   ├── radz1.png          # Logo variant
│   └── car.png            # Vehicle illustration
└── icons/                 # Custom icons (directory exists but empty)
```

## Platform-Specific Files
- **Android**: Gradle configuration, manifest, Firebase config
- **iOS**: Xcode project, Info.plist, Firebase config  
- **Web**: HTML template, manifest, icons
- **Desktop**: Platform-specific build configurations

## Naming Conventions
- **Files**: snake_case (e.g., `auth_service.dart`)
- **Classes**: PascalCase (e.g., `AuthService`)
- **Variables**: camelCase (e.g., `isLoading`)
- **Constants**: camelCase with static const (e.g., `radzLime`)
- **Custom Widgets**: Prefixed with `Radz` (e.g., `RadzBottomNavigation`)