import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../core/theme/app_colors.dart';
import '../widgets/radz_filter_chips.dart';
import '../widgets/radz_campaign_card.dart';
import '../widgets/radz_section_header.dart';
import '../widgets/radz_scaffold.dart';

/// Campaigns Screen - Modern campaign listing with filters
/// Features glass morphism design and smooth animations
class CampaignsScreen extends StatefulWidget {
  const CampaignsScreen({super.key});

  @override
  State<CampaignsScreen> createState() => _CampaignsScreenState();
}

class _CampaignsScreenState extends State<CampaignsScreen> {
  String selectedFilter = 'All';
  final List<String> filterOptions = ['All', 'Active', 'Food', 'Tech', 'Fashion'];

  @override
  Widget build(BuildContext context) {
    return RadzScaffold(
      titleWidget: _buildCustomTitleWidget(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header section with search
            Container(
              color: AppColors.surface,
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Welcome text
                  Text(
                    'Discover Campaigns',
                    style: GoogleFonts.inter(
                      fontSize: 28,
                      fontWeight: FontWeight.w800,
                      color: AppColors.textPrimary,
                      letterSpacing: -1,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Find the perfect advertising opportunities for your vehicle',
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textMuted,
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 24),
                  
                  // Search bar
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.backgroundLight,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.shadow.withOpacity(0.1),
                          blurRadius: 16,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search campaigns...',
                        hintStyle: GoogleFonts.inter(
                          color: AppColors.textMuted,
                          fontWeight: FontWeight.w500,
                        ),
                        prefixIcon: Icon(
                          Icons.search_rounded,
                          color: AppColors.textMuted,
                          size: 20,
                        ),
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.all(20),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            
            // Filter chips
            RadzFilterChips(
              options: filterOptions,
              selectedOption: selectedFilter,
              onOptionSelected: (option) {
                setState(() {
                  selectedFilter = option;
                });
              },
            ),
            
            const SizedBox(height: 16),
            
            // Section header
            const RadzSectionHeader(
              title: 'Available Campaigns',
              subtitle: 'Choose campaigns that match your route',
            ),
            
            const SizedBox(height: 16),
            
            // Campaign cards
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  ...List.generate(5, (index) => _buildCampaignCard(index)),
                  const SizedBox(height: 100), // Bottom padding for nav
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Builds custom title widget with logo and text
  Widget _buildCustomTitleWidget() {
    return Row(
      
      children: [
        // Logo image
        // Container(
        //   width: 32,
        //   height: 32,
        //   decoration: BoxDecoration(
        //     borderRadius: BorderRadius.circular(8),
        //     boxShadow: [
        //       BoxShadow(
        //         color: AppColors.radzLime.withOpacity(0.2),
        //         blurRadius: 8,
        //         offset: const Offset(0, 2),
        //       ),
        //     ],
        //   ),
        //   // child: ClipRRect(
        //   //   borderRadius: BorderRadius.circular(8),
        //   //   child: Image.asset(
        //   //     'assets/images/radz.png',
        //   //     fit: BoxFit.contain,
        //   //     errorBuilder: (context, error, stackTrace) {
        //   //       return Container(
        //   //         decoration: BoxDecoration(
        //   //           color: AppColors.radzLime.withOpacity(0.1),
        //   //           borderRadius: BorderRadius.circular(8),
        //   //         ),
        //   //         child: Icon(
        //   //           Icons.campaign_rounded,
        //   //           color: AppColors.radzLime,
        //   //           size: 20,
        //   //         ),
        //   //       );
        //   //     },
        //   //   ),
        //   // ),
        // ),
        const SizedBox(width: 12),
        // Title text
        Text(
          'Campaigns',
          style: GoogleFonts.inter(
            fontSize: 28,
            fontWeight: FontWeight.w800,
            color: AppColors.textPrimary,
            letterSpacing: -0.5,
          ),
        ),
      ],
    );
  }

  Widget _buildCampaignCard(int index) {
    final campaigns = [
      {
        'brandName': 'McDonald\'s',
        'description': 'Promote our new burger collection',
        'category': 'Food',
        'weeklyEarnings': 'PKR 15,000',
        'duration': '2 weeks',
        'brandColor': Colors.red,
        'brandIcon': Icons.fastfood_rounded,
      },
      {
        'brandName': 'Daraz',
        'description': 'E-commerce platform advertising',
        'category': 'Tech',
        'weeklyEarnings': 'PKR 20,000',
        'duration': '3 weeks',
        'brandColor': Colors.orange,
        'brandIcon': Icons.shopping_cart_rounded,
      },
      {
        'brandName': 'Khaadi',
        'description': 'Fashion brand summer collection',
        'category': 'Fashion',
        'weeklyEarnings': 'PKR 12,000',
        'duration': '1 week',
        'brandColor': Colors.purple,
        'brandIcon': Icons.checkroom_rounded,
      },
      {
        'brandName': 'Jazz',
        'description': 'Telecom services promotion',
        'category': 'Tech',
        'weeklyEarnings': 'PKR 18,000',
        'duration': '4 weeks',
        'brandColor': Colors.green,
        'brandIcon': Icons.phone_android_rounded,
      },
      {
        'brandName': 'Foodpanda',
        'description': 'Food delivery service ads',
        'category': 'Food',
        'weeklyEarnings': 'PKR 16,000',
        'duration': '2 weeks',
        'brandColor': Colors.pink,
        'brandIcon': Icons.delivery_dining_rounded,
      },
    ];

    final campaign = campaigns[index % campaigns.length];
    
    return RadzCampaignCard(
      brandName: campaign['brandName'] as String,
      description: campaign['description'] as String,
      category: campaign['category'] as String,
      weeklyEarnings: campaign['weeklyEarnings'] as String,
      duration: campaign['duration'] as String,
      brandColor: campaign['brandColor'] as Color,
      brandIcon: campaign['brandIcon'] as IconData,
      onTap: () {
        // Navigate to campaign details
        _showCampaignDetails(campaign);
      },
    );
  }

  void _showCampaignDetails(Map<String, dynamic> campaign) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => _CampaignDetailsModal(campaign: campaign),
    );
  }
}

/// Campaign details modal with modern design
class _CampaignDetailsModal extends StatelessWidget {
  final Map<String, dynamic> campaign;

  const _CampaignDetailsModal({required this.campaign});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      child: Column(
        children: [
          // Handle
          Container(
            margin: const EdgeInsets.only(top: 12),
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: AppColors.textMuted.withOpacity(0.3),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          
          // Header
          Padding(
            padding: const EdgeInsets.all(24),
            child: Row(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        (campaign['brandColor'] as Color).withOpacity(0.8),
                        campaign['brandColor'] as Color,
                      ],
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Icon(
                    campaign['brandIcon'] as IconData,
                    color: Colors.white,
                    size: 28,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        campaign['brandName'] as String,
                        style: GoogleFonts.inter(
                          fontSize: 24,
                          fontWeight: FontWeight.w800,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      Text(
                        campaign['description'] as String,
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          color: AppColors.textMuted,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          
          // Content
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Earnings info
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          AppColors.radzLime.withOpacity(0.1),
                          AppColors.radzGreen.withOpacity(0.1),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Weekly Earnings',
                                style: GoogleFonts.inter(
                                  fontSize: 12,
                                  color: AppColors.textMuted,
                                ),
                              ),
                              Text(
                                campaign['weeklyEarnings'] as String,
                                style: GoogleFonts.inter(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w800,
                                  color: AppColors.success,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'Duration',
                                style: GoogleFonts.inter(
                                  fontSize: 12,
                                  color: AppColors.textMuted,
                                ),
                              ),
                              Text(
                                campaign['duration'] as String,
                                style: GoogleFonts.inter(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w800,
                                  color: AppColors.textPrimary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  const SizedBox(height: 24),
                  
                  // Requirements
                  Text(
                    'Requirements',
                    style: GoogleFonts.inter(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 12),
                  _buildRequirement('Vehicle must be clean and well-maintained'),
                  _buildRequirement('Drive minimum 4 hours daily'),
                  _buildRequirement('Cover specified routes in Lahore'),
                  _buildRequirement('Report weekly progress'),
                  
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ),
          
          // Apply button
          Padding(
            padding: const EdgeInsets.all(24),
            child: SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  // Handle apply logic
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.radzLime,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: Text(
                  'Apply for Campaign',
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRequirement(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(
              color: AppColors.radzLime,
              borderRadius: BorderRadius.circular(3),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: GoogleFonts.inter(
                fontSize: 14,
                color: AppColors.textMuted,
              ),
            ),
          ),
        ],
      ),
    );
  }
}