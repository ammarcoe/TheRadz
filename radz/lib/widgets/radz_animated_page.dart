import 'package:flutter/material.dart';

/// Radz Animated Page - Optimized for low-end devices
/// Features minimal, fast animations
class RadzAnimatedPage extends StatefulWidget {
  final Widget child;
  final Duration? duration;
  final Curve? curve;

  const RadzAnimatedPage({
    super.key,
    required this.child,
    this.duration,
    this.curve,
  });

  @override
  State<RadzAnimatedPage> createState() => _RadzAnimatedPageState();
}

class _RadzAnimatedPageState extends State<RadzAnimatedPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    
    // Use single controller for better performance
    _controller = AnimationController(
      duration: widget.duration ?? const Duration(milliseconds: 300), // Reduced from 1200ms
      vsync: this,
    );

    // Simple fade animation only - removed slide for performance
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: widget.curve ?? Curves.easeOut, // Simpler curve
      ),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Use AnimatedBuilder instead of FadeTransition for better performance
    return AnimatedBuilder(
      animation: _fadeAnimation,
      builder: (context, child) {
        return Opacity(
          opacity: _fadeAnimation.value,
          child: widget.child,
        );
      },
    );
  }
}