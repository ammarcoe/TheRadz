import 'package:flutter/material.dart';
import '../widgets/radz_bottom_navigation.dart';
import 'driver_home_screen.dart';
import 'campaigns_screen.dart';
import 'earnings_screen.dart';
import 'profile_screen.dart';

/// Main Navigation Screen - Handles bottom navigation between main app screens
/// Features smooth transitions and proper state management
class MainNavigationScreen extends StatefulWidget {
  final int initialIndex;
  
  const MainNavigationScreen({
    super.key,
    this.initialIndex = 0,
  });

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  late int _currentIndex;
  late PageController _pageController;

  final List<Widget> _screens = [
    const DriverHomeScreen(),
    const CampaignsScreen(),
    const EarningsScreen(),
    const ProfileScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onNavTap(int index) {
    if (_currentIndex != index) {
      setState(() {
        _currentIndex = index;
      });
      
      // Smooth page transition
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: _screens,
      ),
      bottomNavigationBar: RadzBottomNavigation(
        currentIndex: _currentIndex,
        onTap: _onNavTap,
        items: const [
          RadzBottomNavItem(
            icon: Icons.home_rounded,
            label: 'Home',
          ),
          RadzBottomNavItem(
            icon: Icons.campaign_rounded,
            label: 'Campaigns',
          ),
          RadzBottomNavItem(
            icon: Icons.account_balance_wallet_rounded,
            label: 'Earnings',
          ),
          RadzBottomNavItem(
            icon: Icons.person_rounded,
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}