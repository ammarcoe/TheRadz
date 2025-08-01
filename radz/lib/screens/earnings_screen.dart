import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../core/theme/app_colors.dart';
import '../widgets/radz_scaffold.dart';
import '../widgets/radz_stat_card.dart';
import '../widgets/radz_section_header.dart';
import '../widgets/radz_card.dart';

/// Earnings Screen - Track your earnings and payment history
/// Features detailed analytics and payment tracking
class EarningsScreen extends StatefulWidget {
  const EarningsScreen({super.key});

  @override
  State<EarningsScreen> createState() => _EarningsScreenState();
}

class _EarningsScreenState extends State<EarningsScreen> {
  String selectedPeriod = 'This Month';
  final List<String> periods = ['This Week', 'This Month', 'Last 3 Months', 'This Year'];

  @override
  Widget build(BuildContext context) {
    return RadzScaffold(
      title: 'Earnings',
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header section
            Container(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Your Earnings',
                    style: GoogleFonts.inter(
                      fontSize: 28,
                      fontWeight: FontWeight.w800,
                      color: AppColors.textPrimary,
                      letterSpacing: -1,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Track your campaign earnings and payment history',
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textMuted,
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),

            // Period selector
            Container(
              height: 50,
              margin: const EdgeInsets.symmetric(horizontal: 24),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: periods.length,
                itemBuilder: (context, index) {
                  final period = periods[index];
                  final isSelected = selectedPeriod == period;
                  
                  return Container(
                    margin: const EdgeInsets.only(right: 12),
                    child: FilterChip(
                      label: Text(period),
                      selected: isSelected,
                      onSelected: (selected) {
                        setState(() {
                          selectedPeriod = period;
                        });
                      },
                      backgroundColor: Colors.white,
                      selectedColor: AppColors.radzLime.withOpacity(0.2),
                      checkmarkColor: AppColors.radzDarkGreen,
                      labelStyle: GoogleFonts.inter(
                        fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                        color: isSelected ? AppColors.radzDarkGreen : AppColors.textMuted,
                      ),
                      side: BorderSide(
                        color: isSelected ? AppColors.radzLime : Colors.grey.withOpacity(0.3),
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 24),

            // Earnings overview
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: [
                  Expanded(
                    child: RadzStatCard(
                      title: 'Total Earned',
                      value: 'PKR 45,750',
                      icon: Icons.account_balance_wallet_rounded,
                      iconColor: AppColors.success,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: RadzStatCard(
                      title: 'This Month',
                      value: 'PKR 12,500',
                      icon: Icons.trending_up_rounded,
                      iconColor: AppColors.radzLime,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: [
                  Expanded(
                    child: RadzStatCard(
                      title: 'Pending',
                      value: 'PKR 3,200',
                      icon: Icons.schedule_rounded,
                      iconColor: Colors.orange,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: RadzStatCard(
                      title: 'Campaigns',
                      value: '8 Active',
                      icon: Icons.campaign_rounded,
                      iconColor: AppColors.radzGreen,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),

            // Recent transactions
            const RadzSectionHeader(
              title: 'Recent Payments',
              subtitle: 'Your latest earnings and transactions',
            ),

            const SizedBox(height: 16),

            // Transaction list
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  _buildTransactionItem(
                    'McDonald\'s Campaign',
                    'PKR 2,500',
                    'Completed',
                    Icons.fastfood_rounded,
                    Colors.red,
                    '2 days ago',
                  ),
                  _buildTransactionItem(
                    'Jazz 4G Promotion',
                    'PKR 3,000',
                    'Completed',
                    Icons.signal_cellular_4_bar_rounded,
                    Colors.purple,
                    '5 days ago',
                  ),
                  _buildTransactionItem(
                    'Daraz Shopping',
                    'PKR 2,200',
                    'Pending',
                    Icons.shopping_bag_rounded,
                    Colors.orange,
                    '1 week ago',
                  ),
                  _buildTransactionItem(
                    'Honda Atlas Cars',
                    'PKR 4,000',
                    'Completed',
                    Icons.directions_car_rounded,
                    Colors.blue,
                    '2 weeks ago',
                  ),
                  const SizedBox(height: 100), // Bottom padding for nav
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTransactionItem(
    String title,
    String amount,
    String status,
    IconData icon,
    Color iconColor,
    String date,
  ) {
    return RadzCard(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: iconColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            icon,
            color: iconColor,
            size: 24,
          ),
        ),
        title: Text(
          title,
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
        subtitle: Text(
          date,
          style: GoogleFonts.inter(
            fontSize: 12,
            color: AppColors.textMuted,
          ),
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              amount,
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w700,
                color: AppColors.success,
                fontSize: 16,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: status == 'Completed' 
                    ? AppColors.success.withOpacity(0.1)
                    : Colors.orange.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                status,
                style: GoogleFonts.inter(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: status == 'Completed' ? AppColors.success : Colors.orange,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}