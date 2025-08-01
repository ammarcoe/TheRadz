import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../core/theme/app_colors.dart';
import '../core/services/auth_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _masterAnimationController;
  
  late Animation<double> _logoOpacityAnimation;
  late Animation<double> _logoScaleAnimation;
  late Animation<double> _textOpacityAnimation;
  late Animation<Offset> _textSlideAnimation;

  bool _hasNavigated = false;

  @override
  void initState() {
    super.initState();
    
    // Single master animation controller for coordinated timing
    _masterAnimationController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );

    // Logo animations - Apple-style subtle entrance
    _logoOpacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _masterAnimationController,
      curve: const Interval(0.0, 0.4, curve: Curves.easeOut),
    ));

    _logoScaleAnimation = Tween<double>(
      begin: 0.92,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _masterAnimationController,
      curve: const Interval(0.0, 0.4, curve: Curves.easeOutCubic),
    ));

    // Text animations - delayed and gentle
    _textOpacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _masterAnimationController,
      curve: const Interval(0.3, 0.7, curve: Curves.easeOut),
    ));

    _textSlideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _masterAnimationController,
      curve: const Interval(0.3, 0.7, curve: Curves.easeOutCubic),
    ));

    _startAnimation();
  }

  void _startAnimation() async {
    // Start the master animation
    _masterAnimationController.forward();
    
    // Wait for Firebase Auth to initialize and check authentication state
    _checkAuthenticationState();
  }

  void _checkAuthenticationState() async {
    // Wait for the animation to complete (minimum splash time)
    await Future.delayed(const Duration(milliseconds: 2800));
    
    if (!mounted || _hasNavigated) return;

    // Listen to auth state changes to handle Firebase Auth initialization
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (!mounted || _hasNavigated) return;
      
      _hasNavigated = true;
      
      if (user != null) {
        // User is signed in
        context.go('/home');
      } else {
        // User is not signed in
        context.go('/login');
      }
    });
  }

  @override
  void dispose() {
    _masterAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.radzLime,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo without background container - Apple-style clean presentation
            AnimatedBuilder(
              animation: _masterAnimationController,
              builder: (context, child) {
                return Opacity(
                  opacity: _logoOpacityAnimation.value,
                  child: Transform.scale(
                    scale: _logoScaleAnimation.value,
                    child: SizedBox(
                      width: 120,
                      height: 120,
                      child: Image.asset(
                        'assets/images/radz1.png',
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) {
                          // Minimalist fallback
                          return Icon(
                            Icons.directions_car_rounded,
                            size: 80,
                            color: AppColors.textOnBrand.withOpacity(0.8),
                          );
                        },
                      ),
                    ),
                  ),
                );
              },
            ),
            
            // const SizedBox(height: 15),
            
            // App name with Apple-style typography
            SlideTransition(
              position: _textSlideAnimation,
              child: FadeTransition(
                opacity: _textOpacityAnimation,
                // child: Text(
                //   'radz',
                //   style: GoogleFonts.poppins(
                //     fontSize: 42,
                //     fontWeight: FontWeight.w600,
                //     color: AppColors.textOnBrand,
                //     letterSpacing: -0.5,
                //     height: 1.1,
                //   ),
                // ),
              ),
            ),
            
            const SizedBox(height: 8),
            
            // English tagline with refined spacing
            SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0, 0.05),
                end: Offset.zero,
              ).animate(CurvedAnimation(
                parent: _masterAnimationController,
                curve: const Interval(0.4, 0.8, curve: Curves.easeOutCubic),
              )),
              child: FadeTransition(
                opacity: Tween<double>(
                  begin: 0.0,
                  end: 1.0,
                ).animate(CurvedAnimation(
                  parent: _masterAnimationController,
                  curve: const Interval(0.4, 0.8, curve: Curves.easeOut),
                )),
                // child: Text(
                //   'Drive. Advertise. Earn.',
                //   style: GoogleFonts.poppins(
                //     fontSize: 17,
                //     color: AppColors.textOnBrand.withOpacity(0.75),
                //     letterSpacing: 0.2,
                //     fontWeight: FontWeight.w400,
                //     height: 1.2,
                //   ),
                // ),
              ),
            ),
            
            const SizedBox(height: 6),
            
            // Urdu tagline with subtle entrance
            SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0, 0.05),
                end: Offset.zero,
              ).animate(CurvedAnimation(
                parent: _masterAnimationController,
                curve: const Interval(0.5, 0.9, curve: Curves.easeOutCubic),
              )),
              child: FadeTransition(
                opacity: Tween<double>(
                  begin: 0.0,
                  end: 1.0,
                ).animate(CurvedAnimation(
                  parent: _masterAnimationController,
                  curve: const Interval(0.5, 0.9, curve: Curves.easeOut),
                )),
                // child: Text(
                //   'گاڑی چلائیں، اشتہار دیں، کمائیں',
                //   style: GoogleFonts.notoSansArabic(
                //     fontSize: 16,
                //     color: AppColors.textOnBrand.withOpacity(0.65),
                //     fontWeight: FontWeight.w400,
                //     height: 1.3,
                //   ),
                // ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}