// import 'package:flutter/material.dart';
// import '../widgets/radz_scaffold.dart';
// import '../widgets/radz_gradient_banner.dart';
// import '../widgets/radz_stat_card.dart';
// import '../widgets/radz_filter_chips.dart';
// import '../widgets/radz_campaign_card.dart';
// import '../widgets/radz_section_header.dart';
// import '../widgets/radz_floating_action_button.dart';
// import '../widgets/radz_bottom_navigation.dart';

// /// Example Screen - Demonstrates how to use all Radz components
// /// This shows the consistent design system in action
// class ExampleScreen extends StatefulWidget {
//   const ExampleScreen({super.key});

//   @override
//   State<ExampleScreen> createState() => _ExampleScreenState();
// }

// class _ExampleScreenState extends State<ExampleScreen> {
//   String _selectedFilter = 'All';
//   int _currentNavIndex = 0;

//   final List<String> _filterOptions = ['All', 'Food', 'Telecom', 'Retail'];

//   @override
//   Widget build(BuildContext context) {
//     return RadzScaffold(
//       title: 'Example Screen',
//       floatingActionButton: RadzFloatingActionButton(
//         label: 'Browse All',
//         icon: Icons.explore_rounded,
//         onPressed: () {
//           // Handle action
//         },
//       ),
//       bottomNavigationBar: RadzBottomNavigation(
//         currentIndex: _currentNavIndex,
//         onTap: (index) => setState(() => _currentNavIndex = index),
//         items: const [
//           RadzBottomNavItem(icon: Icons.home_rounded, label: 'Home'),
//           RadzBottomNavItem(icon: Icons.campaign_rounded, label: 'Campaigns'),
//           RadzBottomNavItem(icon: Icons.account_balance_wallet_rounded, label: 'Earnings'),
//           RadzBottomNavItem(icon: Icons.person_rounded, label: 'Profile'),
//         ],
//       ),
//       body: Column(
//         children: [
//           // Gradient Banner
//           RadzGradientBanner(
//             title: 'Start Earning Today!',
//             subtitle: 'Drive with branded stickers',
//             actionText: 'Earn up to PKR 15,000/month',
//             icon: Icons.directions_car_rounded,
//             onTap: () {
//               // Handle banner tap
//             },
//           ),

//           // Quick Stats
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 24),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: RadzStatCard(
//                     title: 'Active Campaigns',
//                     value: '12',
//                     icon: Icons.campaign_rounded,
//                   ),
//                 ),
//                 const SizedBox(width: 16),
//                 Expanded(
//                   child: RadzStatCard(
//                     title: 'This Week',
//                     value: 'PKR 2,500',
//                     icon: Icons.trending_up_rounded,
//                   ),
//                 ),
//                 const SizedBox(width: 16),
//                 Expanded(
//                   child: RadzStatCard(
//                     title: 'Total Earned',
//                     value: 'PKR 18,750',
//                     icon: Icons.account_balance_wallet_rounded,
//                   ),
//                 ),
//               ],
//             ),
//           ),

//           const SizedBox(height: 32),

//           // Filter Section
//           RadzFilterChips(
//             options: _filterOptions,
//             selectedOption: _selectedFilter,
//             onOptionSelected: (option) {
//               setState(() => _selectedFilter = option);
//             },
//           ),

//           const SizedBox(height: 16),

//           // Section Header
//           const RadzSectionHeader(
//             title: 'Available Campaigns',
//             subtitle: 'Choose campaigns that match your route',
//           ),

//           // Campaign Cards
//           Expanded(
//             child: ListView(
//               padding: const EdgeInsets.symmetric(horizontal: 24),
//               children: [
//                 RadzCampaignCard(
//                   brandName: 'McDonald\'s Pakistan',
//                   description: 'Promote delicious burgers and fries',
//                   category: 'Food',
//                   weeklyEarnings: 'PKR 2,500',
//                   duration: '30 days',
//                   brandColor: Colors.red,
//                   brandIcon: Icons.fastfood_rounded,
//                   onTap: () {
//                     // Navigate to campaign details
//                   },
//                 ),
//                 RadzCampaignCard(
//                   brandName: 'Jazz 4G',
//                   description: 'Pakistan\'s fastest 4G network',
//                   category: 'Telecom',
//                   weeklyEarnings: 'PKR 3,000',
//                   duration: '45 days',
//                   brandColor: Colors.purple,
//                   brandIcon: Icons.signal_cellular_4_bar_rounded,
//                   onTap: () {
//                     // Navigate to campaign details
//                   },
//                 ),
//                 const SizedBox(height: 100), // Bottom padding for FAB
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }