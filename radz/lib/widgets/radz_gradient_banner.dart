import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../core/theme/app_colors.dart';

/// Radz Gradient Banner - Elegant and sophisticated banner component
/// Used for hero sections with refined aesthetics
class RadzGradientBanner extends StatelessWidget {
  final String title;
  final String? actionText;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry? margin;
  final List<Color>? gradientColors;

  const RadzGradientBanner({
    super.key,
    required this.title,
    this.actionText,
    this.onTap,
    this.margin,
    this.gradientColors,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? const EdgeInsets.all(24),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.radzLime.withOpacity(0.1),
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 16,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(24),
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.all(28),
              child: Row(
                children: [
                  // Left side - Content
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: GoogleFonts.inter(
                            fontSize: 24,
                            fontWeight: FontWeight.w800,
                            color: Colors.black,
                            letterSpacing: -0.5,
                            height: 1.1,
                          ),
                        ),
                        if (actionText != null) ...[
                          const SizedBox(height: 20),
                          _buildActionButton(),
                        ],
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  // Right side - Car Image
                  Expanded(
                    flex: 2,
                    child: Container(
                      height: 160,
                      child: Transform.scale(
                        scale: 1.2,
                        child: Image.asset(
                          'assets/images/car.png',
                          fit: BoxFit.contain,
                          alignment: Alignment.centerRight,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Builds the action button
  Widget _buildActionButton() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(25),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 12,
            ),
            child: Text(
              actionText!,
              style: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white,
                letterSpacing: 0.2,
              ),
            ),
          ),
        ),
      ),
    );
  }
}