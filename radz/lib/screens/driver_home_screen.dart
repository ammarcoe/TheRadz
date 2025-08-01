import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import '../core/services/language_service.dart';
import '../core/services/auth_service.dart';
import '../widgets/radz_scaffold.dart';
import '../widgets/radz_gradient_banner.dart';
import '../widgets/radz_stat_card.dart';
import '../widgets/radz_filter_chips.dart';
import '../widgets/radz_campaign_card.dart';
import '../widgets/radz_section_header.dart';
import '../widgets/radz_floating_action_button.dart';

class DriverHomeScreen extends StatefulWidget {
  const DriverHomeScreen({super.key});

  @override
  State<DriverHomeScreen> createState() => _DriverHomeScreenState();
}

class _DriverHomeScreenState extends State<DriverHomeScreen> {
  String _selectedFilter = 'All';
  final List<String> _filterOptions = ['All', 'Food', 'Telecom', 'Retail', 'Automotive'];
  
  // Pre-built campaign data to avoid rebuilding
  late final List<Widget> _campaignCards;
  late final List<Widget> _statCards;

  @override
  void initState() {
    super.initState();
    _buildStaticWidgets();
  }

  // Pre-build static widgets to improve performance
  void _buildStaticWidgets() {
    _statCards = [
      RadzStatCard(
        title: 'Active Campaigns',
        value: '12',
        icon: Icons.campaign_rounded,
        onTap: () => context.go('/campaigns'),
      ),
      RadzStatCard(
        title: 'This Week',
        value: '2,500 Rs',
        icon: Icons.trending_up_rounded,
        onTap: () => context.go('/earnings'),
      ),
      RadzStatCard(
        title: 'Total Earned',
        value: '18,750',
        icon: Icons.account_balance_wallet_rounded,
        onTap: () => context.go('/earnings'),
      ),
    ];

    _campaignCards = [
      RadzCampaignCard(
        brandName: 'McDonald\'s Pakistan',
        description: 'Promote delicious burgers and fries',
        category: 'Food',
        weeklyEarnings: 'PKR 2,500',
        duration: '30 days',
        brandColor: Colors.red,
        brandIcon: Icons.fastfood_rounded,
        onTap: () {
          // Navigate to campaign details
        },
      ),
      RadzCampaignCard(
        brandName: 'Jazz 4G',
        description: 'Pakistan\'s fastest 4G network',
        category: 'Telecom',
        weeklyEarnings: 'PKR 3,000',
        duration: '45 days',
        brandColor: Colors.purple,
        brandIcon: Icons.signal_cellular_4_bar_rounded,
        onTap: () {
          // Navigate to campaign details
        },
      ),
      RadzCampaignCard(
        brandName: 'Daraz.pk',
        description: 'Online shopping made easy',
        category: 'Retail',
        weeklyEarnings: 'PKR 2,200',
        duration: '60 days',
        brandColor: Colors.orange,
        brandIcon: Icons.shopping_bag_rounded,
        onTap: () {
          // Navigate to campaign details
        },
      ),
      RadzCampaignCard(
        brandName: 'Honda Atlas',
        description: 'Reliable cars for Pakistan',
        category: 'Automotive',
        weeklyEarnings: 'PKR 4,000',
        duration: '90 days',
        brandColor: Colors.blue,
        brandIcon: Icons.directions_car_rounded,
        onTap: () {
          // Navigate to campaign details
        },
      ),
    ];
  }

  void _handleProfileTap() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      // Disable animations for better performance
      enableDrag: false,
      isDismissible: true,
      builder: (context) => Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 40,
                height: 4,
                margin: const EdgeInsets.only(top: 12),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 20),
              ListTile(
                leading: const Icon(Icons.person_rounded),
                title: const Text('Profile Settings'),
                onTap: () {
                  Navigator.pop(context);
                  context.go('/profile');
                },
              ),
              ListTile(
                leading: const Icon(Icons.settings_rounded),
                title: const Text('App Settings'),
                onTap: () {
                  Navigator.pop(context);
                  // Navigate to app settings
                },
              ),
              ListTile(
                leading: const Icon(Icons.help_rounded),
                title: const Text('Help & Support'),
                onTap: () {
                  Navigator.pop(context);
                  // Navigate to help
                },
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.logout_rounded, color: Colors.red),
                title: const Text('Sign Out', style: TextStyle(color: Colors.red)),
                onTap: () async {
                  Navigator.pop(context);
                  final authService = Provider.of<AuthService>(context, listen: false);
                  await authService.signOut();
                  if (mounted) {
                    context.go('/login');
                  }
                },
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // Filter campaigns based on selected filter
  List<Widget> _getFilteredCampaigns() {
    if (_selectedFilter == 'All') {
      return _campaignCards;
    }
    
    // Simple filtering logic - in real app, this would be more sophisticated
    return _campaignCards.where((card) {
      if (card is RadzCampaignCard) {
        return card.category == _selectedFilter;
      }
      return false;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<LanguageService, AuthService>(
      builder: (context, languageService, authService, child) {
        return RadzScaffold(
          titleWidget: Image.asset(
            'assets/images/radz1.png',
            height: 120,
            fit: BoxFit.contain,
            // Cache image for better performance
            cacheHeight: 120,
          ),
          onProfileTap: _handleProfileTap,
          floatingActionButton: RadzFloatingActionButton(
            label: 'Browse All',
            icon: Icons.explore_rounded,
            onPressed: () {
              context.go('/campaigns');
            },
          ),
          body: SingleChildScrollView(
            // Optimize scroll physics for low-end devices
            physics: const ClampingScrollPhysics(),
            child: Column(
              children: [
                // Welcome Banner
                RadzGradientBanner(
                  title: 'Earn up to PKR 15,000/month',
                  actionText: 'Start Earning',
                  onTap: () {
                    context.go('/campaigns');
                  },
                ),

                const SizedBox(height: 24),

                // Quick Stats - Use pre-built widgets
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    children: [
                      Expanded(child: _statCards[0]),
                      const SizedBox(width: 16),
                      Expanded(child: _statCards[1]),
                      const SizedBox(width: 16),
                      Expanded(child: _statCards[2]),
                    ],
                  ),
                ),

                const SizedBox(height: 32),

                // Filter Section
                RadzFilterChips(
                  options: _filterOptions,
                  selectedOption: _selectedFilter,
                  onOptionSelected: (option) {
                    setState(() => _selectedFilter = option);
                  },
                ),

                const SizedBox(height: 16),

                // Section Header
                const RadzSectionHeader(
                  title: 'Available Campaigns',
                ),

                // Campaign Cards - Use filtered pre-built widgets
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: [
                      ..._getFilteredCampaigns().map((card) => Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: card,
                      )),
                      const SizedBox(height: 100), // Bottom padding for nav
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}