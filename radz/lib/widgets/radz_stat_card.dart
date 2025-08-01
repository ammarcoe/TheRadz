import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../core/theme/app_colors.dart';

/// Radz Stat Card - Modern, responsive card for displaying key metrics
/// Features a clean design with single overlay icon
class RadzStatCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData? icon; // Made optional
  final Color? iconColor;
  final Color? backgroundColor;
  final VoidCallback? onTap;

  const RadzStatCard({
    super.key,
    required this.title,
    required this.value,
    this.icon, // No longer required
    this.iconColor,
    this.backgroundColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final bool isFeatured = backgroundColor != null;
    final bool hasIcon = icon != null;
    final Color primaryIconColor = iconColor ?? AppColors.radzLime;
    
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(24),
        child: Container(
          height: 120,
          decoration: BoxDecoration(
            color: backgroundColor ?? Colors.white,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.06),
                blurRadius: 24,
                offset: const Offset(0, 6),
                spreadRadius: 0,
              ),
              BoxShadow(
                color: Colors.black.withOpacity(0.03),
                blurRadius: 48,
                offset: const Offset(0, 12),
                spreadRadius: 0,
              ),
            ],
            border: Border.all(
              color: Colors.grey.withOpacity(0.08),
              width: 1,
            ),
          ),
          child: Stack(
            children: [
              // Content overlay
              Positioned.fill(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Single overlay icon (only if icon is provided)
                      if (hasIcon)
                        Container(
                          width: 36,
                          height: 36,
                          decoration: BoxDecoration(
                            color: isFeatured 
                                ? Colors.white.withOpacity(0.2)
                                : primaryIconColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: isFeatured 
                                  ? Colors.white.withOpacity(0.3)
                                  : primaryIconColor.withOpacity(0.2),
                              width: 1,
                            ),
                          ),
                          child: Icon(
                            icon!,
                            size: 18,
                            color: isFeatured 
                                ? Colors.white
                                : primaryIconColor,
                          ),
                        )
                      else
                        // Spacer when no icon is provided
                        const SizedBox(height: 36),
                      
                      // Text content
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(top: hasIcon ? 12 : 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              // Value text
                              Flexible(
                                child: _buildAdaptiveText(
                                  text: value,
                                  maxFontSize: 22,
                                  minFontSize: 14,
                                  fontWeight: FontWeight.w800,
                                  color: isFeatured 
                                      ? Colors.white 
                                      : AppColors.textPrimary,
                                  maxLines: 1,
                                ),
                              ),
                              const SizedBox(height: 4),
                              // Title text
                              Flexible(
                                child: _buildAdaptiveText(
                                  text: title,
                                  maxFontSize: 12,
                                  minFontSize: 9,
                                  fontWeight: FontWeight.w600,
                                  color: isFeatured 
                                      ? Colors.white.withOpacity(0.9) 
                                      : AppColors.textMuted,
                                  maxLines: 2,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              
              // Subtle gradient overlay for depth (only for non-featured cards)
              if (!isFeatured)
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.transparent,
                          hasIcon 
                              ? primaryIconColor.withOpacity(0.02)
                              : AppColors.radzLime.withOpacity(0.02),
                        ],
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  /// Builds text that automatically scales down if content is too long
  Widget _buildAdaptiveText({
    required String text,
    required double maxFontSize,
    required double minFontSize,
    required FontWeight fontWeight,
    required Color color,
    required int maxLines,
  }) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double fontSize = maxFontSize;
        
        while (fontSize >= minFontSize) {
          final textStyle = GoogleFonts.inter(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: color,
            height: 1.2,
            letterSpacing: fontWeight == FontWeight.w800 ? -0.5 : 0,
          );
          
          final textPainter = TextPainter(
            text: TextSpan(text: text, style: textStyle),
            maxLines: maxLines,
            textDirection: TextDirection.ltr,
          );
          
          textPainter.layout(maxWidth: constraints.maxWidth);
          
          if (!textPainter.didExceedMaxLines && 
              textPainter.size.height <= constraints.maxHeight) {
            break;
          }
          
          fontSize -= 0.5;
        }
        
        fontSize = fontSize.clamp(minFontSize, maxFontSize);
        
        return Text(
          text,
          style: GoogleFonts.inter(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: color,
            height: 1.2,
            letterSpacing: fontWeight == FontWeight.w800 ? -0.5 : 0,
          ),
          maxLines: maxLines,
          overflow: TextOverflow.ellipsis,
        );
      },
    );
  }
}

/// Variant for highlighted/featured stats
class RadzStatCardFeatured extends StatelessWidget {
  final String title;
  final String value;
  final IconData? icon; // Made optional here too
  final VoidCallback? onTap;

  const RadzStatCardFeatured({
    super.key,
    required this.title,
    required this.value,
    this.icon, // No longer required
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return RadzStatCard(
      title: title,
      value: value,
      icon: icon,
      iconColor: Colors.white,
      backgroundColor: AppColors.radzLime,
      onTap: onTap,
    );
  }
}