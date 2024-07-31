import 'package:flutter/material.dart';

import '../screens/auth_pages/other_pages/opt_screen.dart';
import '../screens/auth_pages/other_pages/reset_password.dart';
import '../screens/auth_pages/signup_screen.dart';

import '../screens/home/home_screen.dart';
import '../screens/splash_screen.dart';
import 'app_routes.dart';

class AppPages {
  static const initialRoute = Routes.homeRoute;
  static Map<String, WidgetBuilder> routes = {
    Routes.homeRoute: (context) => SplashScreen(),
    Routes.homeScreenRoute: (context) => const HomeScreen(),
    Routes.signupRoute: (context) => SignupScreen(),
    Routes.resetPasswordRoute: (context) => ResetPassword(),
    Routes.otpConfirmRoute: (context) => OptScreen(),
  };
}
