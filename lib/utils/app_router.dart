import 'package:flutter/material.dart';
import 'package:ReNew8/presentation/pages/about_us_screen.dart';
import 'package:ReNew8/presentation/pages/documents_details_screen.dart';
import 'package:ReNew8/presentation/pages/home_screen.dart';
import 'package:ReNew8/presentation/pages/login_screen.dart';
import 'package:ReNew8/presentation/pages/privacy_policy_screen.dart';
import 'package:ReNew8/presentation/pages/profile_screen.dart';
import 'package:ReNew8/utils/route_string.dart';

import '../presentation/pages/splash_screen.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    return MaterialPageRoute(builder: (context) {
      switch (settings.name) {
        case RouteString.SPLASH_SCREEN:
          return const SplashScreen();
        case RouteString.LOGIN_SCREEN:
          return const LoginScreen();
        case RouteString.HOME_SCREEN:
          return const HomeScreen();
        // case RouteString.JOBDISCRIPTIONSCREEN_SCREEN:
        //   return JobDescriptionScreen();
        case RouteString.DOCUMENTDETAILSSCREEN:
          return const DocumentsDetailsScreen();
        case RouteString.PROFILE_SCREEN:
          return const ProfileScreen();
        case RouteString.PRIVACY_POLICY:
          return const PrivacyPolicyScreen();
        case RouteString.ABOUT_US_SCREEN:
          return const AboutUsScreen();
        default:
          return const SplashScreen();
      }
    });
  }
}
