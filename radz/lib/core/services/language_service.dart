import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum AppLanguage { english, urdu, romanUrdu }

class LanguageService extends ChangeNotifier {
  AppLanguage _currentLanguage = AppLanguage.english;
  
  AppLanguage get currentLanguage => _currentLanguage;
  
  void setLanguage(AppLanguage language) {
    _currentLanguage = language;
    notifyListeners();
  }
  
  String get languageCode {
    switch (_currentLanguage) {
      case AppLanguage.english:
        return 'en';
      case AppLanguage.urdu:
        return 'ur';
      case AppLanguage.romanUrdu:
        return 'ur-PK';
    }
  }
  
  String get languageName {
    switch (_currentLanguage) {
      case AppLanguage.english:
        return 'English';
      case AppLanguage.urdu:
        return 'اردو';
      case AppLanguage.romanUrdu:
        return 'Roman Urdu';
    }
  }
}

class AppLocalizations {
  final AppLanguage language;
  
  AppLocalizations(this.language);
  
  static AppLocalizations of(BuildContext context) {
    return AppLocalizations(
      context.watch<LanguageService>().currentLanguage,
    );
  }
  
  String get appName => _getText('appName');
  String get welcome => _getText('welcome');
  String get createAccount => _getText('createAccount');
  String get login => _getText('login');
  String get register => _getText('register');
  String get fullName => _getText('fullName');
  String get phoneNumber => _getText('phoneNumber');
  String get emailAddress => _getText('emailAddress');
  String get password => _getText('password');
  String get confirmPassword => _getText('confirmPassword');
  String get forgotPassword => _getText('forgotPassword');
  String get rememberMe => _getText('rememberMe');
  String get orContinueWith => _getText('orContinueWith');
  String get google => _getText('google');
  String get apple => _getText('apple');
  String get alreadyHaveAccount => _getText('alreadyHaveAccount');
  String get dontHaveAccount => _getText('dontHaveAccount');
  String get signUp => _getText('signUp');
  String get userType => _getText('userType');
  String get driver => _getText('driver');
  String get carOwner => _getText('carOwner');
  String get bikeRider => _getText('bikeRider');
  String get rickshawOperator => _getText('rickshawOperator');
  String get advertiser => _getText('advertiser');
  String get tagline => _getText('tagline');
  String get joinCommunity => _getText('joinCommunity');
  
  String _getText(String key) {
    final translations = {
      AppLanguage.english: {
        'appName': 'Radz',
        'welcome': 'Step Into the Future\nof Advertising',
        'createAccount': 'Create an account',
        'login': 'Login',
        'register': 'Register',
        'fullName': 'Full Name',
        'phoneNumber': 'Phone Number',
        'emailAddress': 'Email Address',
        'password': 'Password',
        'confirmPassword': 'Confirm Password',
        'forgotPassword': 'Forgot Password?',
        'rememberMe': 'Remember Me',
        'orContinueWith': 'Or continue with',
        'google': 'Google',
        'apple': 'Apple',
        'alreadyHaveAccount': 'Already have an account?',
        'dontHaveAccount': 'Don\'t have an account?',
        'signUp': 'Sign up',
        'userType': 'I am a',
        'driver': 'Ride-hailing Driver',
        'carOwner': 'Car Owner',
        'bikeRider': 'Motorbike Rider',
        'rickshawOperator': 'Rickshaw Operator',
        'advertiser': 'Advertiser',
        'tagline': 'Drive. Advertise. Earn.',
        'joinCommunity': 'Join Radz Community',
      },
      AppLanguage.urdu: {
        'appName': 'ریڈز',
        'welcome': 'اشتہارات کے مستقبل\nمیں قدم رکھیں',
        'createAccount': 'اکاؤنٹ بنائیں',
        'login': 'لاگ ان',
        'register': 'رجسٹر',
        'fullName': 'مکمل نام',
        'phoneNumber': 'فون نمبر',
        'emailAddress': 'ای میل ایڈریس',
        'password': 'پاس ورڈ',
        'confirmPassword': 'پاس ورڈ کی تصدیق',
        'forgotPassword': 'پاس ورڈ بھول گئے؟',
        'rememberMe': 'مجھے یاد رکھیں',
        'orContinueWith': 'یا جاری رکھیں',
        'google': 'گوگل',
        'apple': 'ایپل',
        'alreadyHaveAccount': 'پہلے سے اکاؤنٹ ہے؟',
        'dontHaveAccount': 'اکاؤنٹ نہیں ہے؟',
        'signUp': 'سائن اپ',
        'userType': 'میں ہوں',
        'driver': 'ڈرائیور',
        'carOwner': 'کار مالک',
        'bikeRider': 'موٹر بائیک سوار',
        'rickshawOperator': 'رکشہ آپریٹر',
        'advertiser': 'اشتہار دہندہ',
        'tagline': 'گاڑی چلائیں، اشتہار دیں، کمائیں',
        'joinCommunity': 'ریڈز کمیونٹی میں شامل ہوں',
      },
      AppLanguage.romanUrdu: {
        'appName': 'Radz',
        'welcome': 'Ishtiharaat ke mustaqbil\nmein qadam rakhiye',
        'createAccount': 'Account banayiye',
        'login': 'Log in',
        'register': 'Register',
        'fullName': 'Mukammal naam',
        'phoneNumber': 'Phone number',
        'emailAddress': 'Email address',
        'password': 'Password',
        'confirmPassword': 'Password ki tasdeeq',
        'forgotPassword': 'Password bhool gaye?',
        'rememberMe': 'Mujhe yaad rakhiye',
        'orContinueWith': 'Ya jaari rakhiye',
        'google': 'Google',
        'apple': 'Apple',
        'alreadyHaveAccount': 'Pehle se account hai?',
        'dontHaveAccount': 'Account nahi hai?',
        'signUp': 'Sign up',
        'userType': 'Main hun',
        'driver': 'Driver',
        'carOwner': 'Car malik',
        'bikeRider': 'Motorbike sawar',
        'rickshawOperator': 'Rickshaw operator',
        'advertiser': 'Ishtihar dinda',
        'tagline': 'Gaari chalayiye, ishtihar diye, kamayiye',
        'joinCommunity': 'Radz community mein shamil hon',
      },
    };
    
    return translations[language]?[key] ?? translations[AppLanguage.english]![key]!;
  }
}