import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../core/theme/app_colors.dart';
import '../core/services/auth_service.dart';
import '../widgets/radz_scaffold.dart';
import '../widgets/radz_card.dart';
import '../widgets/language_toggle.dart';

/// Profile Screen - User profile and settings
/// Features account management and app settings
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthService>(
      builder: (context, authService, child) {
        return RadzScaffold(
          title: 'Profile',
          body: SingleChildScrollView(
            child: Column(
              children: [
                // Profile header
                Container(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    children: [
                      // Profile picture
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              AppColors.radzLime,
                              AppColors.radzGreen,
                            ],
                          ),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: const Icon(
                          Icons.person_rounded,
                          size: 50,
                          color: Colors.white,
                        ),
                      ),
                      
                      const SizedBox(height: 16),
                      
                      // User info
                      Text(
                        authService.user?.displayName ?? 'Driver Name',
                        style: GoogleFonts.inter(
                          fontSize: 24,
                          fontWeight: FontWeight.w800,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      
                      const SizedBox(height: 4),
                      
                      Text(
                        authService.user?.email ?? 'driver@radz.com',
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          color: AppColors.textMuted,
                        ),
                      ),
                      
                      const SizedBox(height: 16),
                      
                      // Stats row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildStatItem('12', 'Campaigns'),
                          _buildStatItem('4.8', 'Rating'),
                          _buildStatItem('45K', 'Earned'),
                        ],
                      ),
                    ],
                  ),
                ),

                // Menu items
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: [
                      _buildMenuSection('Account', [
                        _buildMenuItem(
                          Icons.person_outline_rounded,
                          'Personal Information',
                          'Update your profile details',
                          () {},
                        ),
                        _buildMenuItem(
                          Icons.directions_car_outlined,
                          'Vehicle Information',
                          'Manage your vehicle details',
                          () {},
                        ),
                        _buildMenuItem(
                          Icons.payment_rounded,
                          'Payment Methods',
                          'Manage payment and banking info',
                          () {},
                        ),
                      ]),

                      const SizedBox(height: 24),

                      _buildMenuSection('Preferences', [
                        _buildMenuItem(
                          Icons.notifications_outlined,
                          'Notifications',
                          'Manage notification settings',
                          () {},
                        ),
                        _buildLanguageMenuItem(),
                        _buildMenuItem(
                          Icons.security_rounded,
                          'Privacy & Security',
                          'Manage your privacy settings',
                          () {},
                        ),
                      ]),

                      const SizedBox(height: 24),

                      _buildMenuSection('Support', [
                        _buildMenuItem(
                          Icons.help_outline_rounded,
                          'Help Center',
                          'Get help and support',
                          () {},
                        ),
                        _buildMenuItem(
                          Icons.feedback_outlined,
                          'Send Feedback',
                          'Share your thoughts with us',
                          () {},
                        ),
                        _buildMenuItem(
                          Icons.info_outline_rounded,
                          'About Radz',
                          'App version and information',
                          () {},
                        ),
                      ]),

                      const SizedBox(height: 24),

                      // Sign out button
                      RadzCard(
                        child: ListTile(
                          leading: const Icon(
                            Icons.logout_rounded,
                            color: Colors.red,
                          ),
                          title: Text(
                            'Sign Out',
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w600,
                              color: Colors.red,
                            ),
                          ),
                          subtitle: Text(
                            'Sign out of your account',
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              color: AppColors.textMuted,
                            ),
                          ),
                          onTap: () async {
                            await authService.signOut();
                            if (context.mounted) {
                              Navigator.of(context).pushReplacementNamed('/login');
                            }
                          },
                        ),
                      ),

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

  Widget _buildStatItem(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: GoogleFonts.inter(
            fontSize: 20,
            fontWeight: FontWeight.w800,
            color: AppColors.textPrimary,
          ),
        ),
        Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 12,
            color: AppColors.textMuted,
          ),
        ),
      ],
    );
  }

  Widget _buildMenuSection(String title, List<Widget> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4, bottom: 12),
          child: Text(
            title,
            style: GoogleFonts.inter(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
        ),
        RadzCard(
          child: Column(
            children: items,
          ),
        ),
      ],
    );
  }

  Widget _buildMenuItem(
    IconData icon,
    String title,
    String subtitle,
    VoidCallback onTap,
  ) {
    return ListTile(
      leading: Icon(
        icon,
        color: AppColors.textMuted,
      ),
      title: Text(
        title,
        style: GoogleFonts.inter(
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimary,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: GoogleFonts.inter(
          fontSize: 12,
          color: AppColors.textMuted,
        ),
      ),
      trailing: Icon(
        Icons.chevron_right_rounded,
        color: AppColors.textMuted,
      ),
      onTap: onTap,
    );
  }

  Widget _buildLanguageMenuItem() {
    return ListTile(
      leading: Icon(
        Icons.language_rounded,
        color: AppColors.textMuted,
      ),
      title: Text(
        'Language',
        style: GoogleFonts.inter(
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimary,
        ),
      ),
      subtitle: Text(
        'Choose your preferred language',
        style: GoogleFonts.inter(
          fontSize: 12,
          color: AppColors.textMuted,
        ),
      ),
      trailing: const LanguageToggle(),
    );
  }
}