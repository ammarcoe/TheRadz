import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../core/theme/app_colors.dart';
import 'language_toggle.dart';

/// Radz App Bar - Simple fixed app bar design
/// Features gradient background with opacity
class RadzAppBar extends StatelessWidget {
  final String? title;
  final Widget? titleWidget;
  final List<Widget>? actions;
  final bool showProfile;
  final VoidCallback? onProfileTap;
  final bool showLanguageToggle;

  const RadzAppBar({
    super.key,
    this.title,
    this.titleWidget,
    this.actions,
    this.showProfile = true,
    this.onProfileTap,
    this.showLanguageToggle = true,
  }) : assert(
          title != null || titleWidget != null,
          'Either title or titleWidget must be provided',
        );

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      floating: false,
      snap: false,
      expandedHeight: 0,
      toolbarHeight: 80,
      backgroundColor: AppColors.surface,
      elevation: 0,
      surfaceTintColor: Colors.transparent,
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                AppColors.radzLime.withOpacity(0.1),
                AppColors.surface,
              ],
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: [
                  // Title/Logo section - positioned at leftmost
                  titleWidget ?? Text(
                    title!,
                    style: GoogleFonts.inter(
                      fontSize: 28,
                      fontWeight: FontWeight.w800,
                      color: AppColors.textPrimary,
                      letterSpacing: -0.5,
                    ),
                  ),
                  // Spacer to push actions to the right
                  const Spacer(),
                  // Actions section
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (showLanguageToggle) ...[
                        const LanguageToggle(),
                        const SizedBox(width: 12),
                      ],
                      if (showProfile)
                        Container(
                          width: 44,
                          height: 44,
                          decoration: BoxDecoration(
                            color: AppColors.surface,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.shadow.withOpacity(0.15),
                                blurRadius: 8,
                                offset: const Offset(0, 2),
                              ),
                            ],
                            border: Border.all(
                              color: AppColors.radzLime.withOpacity(0.1),
                              width: 1,
                            ),
                          ),
                          child: Material(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(12),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(12),
                              onTap: onProfileTap,
                              child: const Icon(
                                Icons.person_rounded,
                                size: 20,
                              ),
                            ),
                          ),
                        ),
                      if (actions != null) ...[
                        const SizedBox(width: 8),
                        ...actions!,
                      ],
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}