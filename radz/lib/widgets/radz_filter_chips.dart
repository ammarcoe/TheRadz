import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../core/theme/app_colors.dart';

/// Radz Filter Chips - Optimized for low-end devices
/// Features minimal animations and better performance
class RadzFilterChips extends StatelessWidget {
  final List<String> options;
  final String selectedOption;
  final Function(String) onOptionSelected;
  final EdgeInsetsGeometry? padding;

  const RadzFilterChips({
    super.key,
    required this.options,
    required this.selectedOption,
    required this.onOptionSelected,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: padding ?? const EdgeInsets.symmetric(horizontal: 24),
        // Use simpler physics for better performance
        physics: const ClampingScrollPhysics(),
        itemCount: options.length,
        itemBuilder: (context, index) {
          final option = options[index];
          final isSelected = selectedOption == option;
          
          return Padding(
            padding: const EdgeInsets.only(right: 12),
            child: _OptimizedFilterChip(
              label: option,
              isSelected: isSelected,
              onTap: () => onOptionSelected(option),
            ),
          );
        },
      ),
    );
  }
}

/// Optimized filter chip with minimal animations
class _OptimizedFilterChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _OptimizedFilterChip({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200), // Fast transition
        curve: Curves.easeOut,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected 
              ? AppColors.radzLime 
              : Colors.white,
          borderRadius: BorderRadius.circular(28),
          border: Border.all(
            color: isSelected 
                ? AppColors.radzLime 
                : Colors.grey.withOpacity(0.12),
            width: isSelected ? 2 : 1,
          ),
          // Simplified shadows for better performance
          boxShadow: [
            if (isSelected)
              BoxShadow(
                color: AppColors.radzLime.withOpacity(0.2),
                blurRadius: 8, // Reduced from 16
                offset: const Offset(0, 2), // Reduced from 4
                spreadRadius: 0, // Reduced from 2
              ),
            if (!isSelected)
              BoxShadow(
                color: Colors.black.withOpacity(0.04),
                blurRadius: 4, // Reduced from 8
                offset: const Offset(0, 2), // Reduced from 4
                spreadRadius: 0,
              ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Simple checkmark for selected state (no complex animations)
            if (isSelected) ...[
              Container(
                width: 16,
                height: 16,
                margin: const EdgeInsets.only(right: 6),
                decoration: BoxDecoration(
                  color: AppColors.textOnBrand,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.check,
                  size: 12,
                  color: AppColors.radzLime,
                ),
              ),
            ],
            // Label text
            Text(
              label,
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: isSelected ? FontWeight.w700 : FontWeight.w600,
                color: isSelected 
                    ? AppColors.textOnBrand 
                    : AppColors.textMuted,
                letterSpacing: 0.2,
                height: 1.2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}