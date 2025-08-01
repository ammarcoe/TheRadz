import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';
import 'radz_app_bar.dart';
import 'radz_bottom_navigation.dart';
import 'radz_floating_action_button.dart';
import 'radz_animated_page.dart';

/// Radz Scaffold - Consistent scaffold wrapper
/// Provides the foundation layout for all screens
class RadzScaffold extends StatelessWidget {
  final String? title;
  final Widget? titleWidget; // New parameter for custom title widget
  final Widget body;
  final List<Widget>? appBarActions;
  final bool showProfile;
  final VoidCallback? onProfileTap;
  final bool showLanguageToggle;
  final RadzFloatingActionButton? floatingActionButton;
  final RadzBottomNavigation? bottomNavigationBar;
  final ScrollController? scrollController;
  final bool animated;

  const RadzScaffold({
    super.key,
    this.title,
    this.titleWidget,
    required this.body,
    this.appBarActions,
    this.showProfile = true,
    this.onProfileTap,
    this.showLanguageToggle = true,
    this.floatingActionButton,
    this.bottomNavigationBar,
    this.scrollController,
    this.animated = true,
  }) : assert(
          title != null || titleWidget != null,
          'Either title or titleWidget must be provided',
        );

  @override
  Widget build(BuildContext context) {
    Widget content = body;

    if (animated) {
      content = RadzAnimatedPage(child: content);
    }

    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: CustomScrollView(
        controller: scrollController,
        physics: const BouncingScrollPhysics(),
        slivers: [
          RadzAppBar(
            title: title,
            titleWidget: titleWidget,
            actions: appBarActions,
            showProfile: showProfile,
            onProfileTap: onProfileTap,
            showLanguageToggle: showLanguageToggle,
          ),
          SliverToBoxAdapter(child: content),
        ],
      ),
      floatingActionButton: floatingActionButton,
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}