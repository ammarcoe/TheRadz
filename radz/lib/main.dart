import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'screens/splash_screen.dart';
import 'screens/auth/login_screen.dart';
import 'screens/auth/signup_screen.dart';
import 'screens/auth/user_info_screen.dart';
import 'screens/main_navigation_screen.dart';
import 'screens/campaigns_screen.dart';
import 'screens/earnings_screen.dart';
import 'screens/profile_screen.dart';
import 'core/theme/app_theme.dart';
import 'core/services/language_service.dart';
import 'core/services/auth_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
  runApp(const RadzApp());
}

class RadzApp extends StatelessWidget {
  const RadzApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LanguageService()),
        ChangeNotifierProvider(create: (context) => AuthService()),
      ],
      child: MaterialApp.router(
        title: 'Radz',
        theme: AppTheme.lightTheme,
        routerConfig: _router,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

final GoRouter _router = GoRouter(
  initialLocation: '/splash',
  routes: [
    GoRoute(
      path: '/splash',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/signup',
      builder: (context, state) => const SignupScreen(),
    ),
    GoRoute(
      path: '/user-info',
      builder: (context, state) => const UserInfoScreen(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) {
        final indexString = state.uri.queryParameters['index'];
        final index = indexString != null ? int.tryParse(indexString) ?? 0 : 0;
        return MainNavigationScreen(initialIndex: index);
      },
    ),
    // Individual screen routes for deep linking
    GoRoute(
      path: '/campaigns',
      builder: (context, state) => const MainNavigationScreen(initialIndex: 1),
    ),
    GoRoute(
      path: '/earnings',
      builder: (context, state) => const MainNavigationScreen(initialIndex: 2),
    ),
    GoRoute(
      path: '/profile',
      builder: (context, state) => const MainNavigationScreen(initialIndex: 3),
    ),
  ],
);