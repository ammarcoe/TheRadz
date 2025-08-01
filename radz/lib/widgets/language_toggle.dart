import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import '../core/services/language_service.dart';

class LanguageToggle extends StatelessWidget {
  const LanguageToggle({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LanguageService>(
      builder: (context, languageService, child) {
        return PopupMenuButton<AppLanguage>(
          icon: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey.shade200),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.language, size: 16, color: Colors.grey.shade600),
                const SizedBox(width: 4),
                Text(
                  _getLanguageShort(languageService.currentLanguage),
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),
          onSelected: (AppLanguage language) {
            languageService.setLanguage(language);
          },
          itemBuilder: (BuildContext context) => [
            PopupMenuItem(
              value: AppLanguage.english,
              child: Row(
                children: [
                  const Text('🇺🇸', style: TextStyle(fontSize: 16)),
                  const SizedBox(width: 8),
                  Text('English', style: GoogleFonts.inter()),
                ],
              ),
            ),
            PopupMenuItem(
              value: AppLanguage.urdu,
              child: Row(
                children: [
                  const Text('🇵🇰', style: TextStyle(fontSize: 16)),
                  const SizedBox(width: 8),
                  Text('اردو', style: GoogleFonts.inter()),
                ],
              ),
            ),
            PopupMenuItem(
              value: AppLanguage.romanUrdu,
              child: Row(
                children: [
                  const Text('🇵🇰', style: TextStyle(fontSize: 16)),
                  const SizedBox(width: 8),
                  Text('Roman Urdu', style: GoogleFonts.inter()),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  String _getLanguageShort(AppLanguage language) {
    switch (language) {
      case AppLanguage.english:
        return 'EN';
      case AppLanguage.urdu:
        return 'UR';
      case AppLanguage.romanUrdu:
        return 'RU';
    }
  }
}