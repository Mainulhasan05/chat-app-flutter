import 'package:chat_app_flutter/app/screens/auth_pages/login_screen.dart';
import 'package:chat_app_flutter/app/screens/chat_details_screen/chat_details_screen.dart';
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
    Routes.loginRoute: (context) => LoginScreen(),
    Routes.chatDetailRoute: (context) => ChatDetailsScreen(),
  };
}
