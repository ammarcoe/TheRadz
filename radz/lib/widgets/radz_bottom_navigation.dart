import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import '../core/theme/app_colors.dart';

/// Radz Bottom Navigation - Optimized for low-end devices
/// Features minimal animations and better performance
class RadzBottomNavigation extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;
  final List<RadzBottomNavItem> items;

  const RadzBottomNavigation({
    super.key,
    required this.currentIndex,
    required this.onTap,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(28),
          topRight: Radius.circular(28),
        ),
        // Simplified shadows for better performance
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 16, // Reduced from 24
            offset: const Offset(0, -4), // Reduced from -8
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: items.asMap().entries.map((entry) {
          final index = entry.key;
          final item = entry.value;
          final isSelected = currentIndex == index;
          
          return _OptimizedNavItem(
            icon: item.icon,
            label: item.label,
            isSelected: isSelected,
            onTap: () => onTap(index),
          );
        }).toList(),
      ),
    );
  }
}

/// Optimized navigation item with minimal animations
class _OptimizedNavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _OptimizedNavItem({
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      // Remove complex animations, use simple tap feedback
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Icon with simple color transition
            AnimatedContainer(
              duration: const Duration(milliseconds: 200), // Fast transition
              curve: Curves.easeOut,
              child: Icon(
                icon,
                size: 24,
                color: isSelected 
                    ? AppColors.radzLime
                    : Colors.grey.shade400,
              ),
            ),
            
            const SizedBox(height: 4),
            
            // Label with simple color transition
            AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 200), // Fast transition
              curve: Curves.easeOut,
              style: GoogleFonts.inter(
                fontSize: 11,
                fontWeight: isSelected 
                    ? FontWeight.w600 
                    : FontWeight.w500,
                color: isSelected 
                    ? Colors.black87
                    : Colors.grey.shade500,
                letterSpacing: 0.1,
              ),
              child: Text(label),
            ),
          ],
        ),
      ),
    );
  }
}

class RadzBottomNavItem {
  final IconData icon;
  final String label;

  const RadzBottomNavItem({
    required this.icon,
    required this.label,
  });
}