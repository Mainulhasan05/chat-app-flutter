import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

// import 'package:get/get.dart';

import '../../base/constant.dart';
import '../../base/pref_data.dart';
import '../../controllers/auth/auth_controller.dart';
import '../../controllers/home/home_controller.dart';
import '../../http_client.dart';
import '../routes/app_routes.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  HomeController homeController = Get.put(HomeController());
  AuthController authController = Get.put(AuthController());

  @override
  void initState() {
    super.initState();
    print("hello bro");
    handleLoadings();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ));
  }

  void handleLoadings() async {
    final authToken = await PrefData.getToken();
    final isLoggedin = await PrefData.isLogIn();
    print("AuthToken");
    print(authToken);
    print(isLoggedin);

    if (authToken == "" || authToken == null) {
      Future.delayed(const Duration(seconds: 3), () {
        Constant.sendToNext(context, Routes.loginRoute);
      });
    } else {
      HttpRequestHelper.setAuthToken(authToken);
      Future.delayed(const Duration(seconds: 3), () {
        Constant.sendToNext(context, Routes.homeScreenRoute);
      });
    }
    if (isLoggedin == true) {
      authController.isLoggedIn.value = true;
      authController.getUserInformation();
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF2799D5), // Primary color
      body: Center(
        child: Text(
          'ChatAPP',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
