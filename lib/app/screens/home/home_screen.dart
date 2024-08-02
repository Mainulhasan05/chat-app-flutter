import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../base/color_data.dart';
import '../../../base/constant.dart';
import '../../../controllers/auth/auth_controller.dart';
import '../../../controllers/home/home_controller.dart';
import '../auth_pages/login_screen.dart';
import 'tab/tab_cart.dart';
import 'tab/tab_categories.dart';
import 'tab/tab_home.dart';
import 'tab/tab_profile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AuthController authController = Get.put(AuthController());
  final HomeController homeController = Get.put(HomeController());

  final List<Widget> _tabs = [
    TabHome(),
    TabCategories(),
    TabProfile(),
    LoginScreen(),
  ];

  @override
  void initState() {
    if (homeController.privateChatList.isEmpty) {
      homeController.getHomepageData();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => _tabs[authController.selectedIndex.value]),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            elevation: 2,
            fixedColor: primaryColor,
            showUnselectedLabels: true,
            unselectedItemColor: bottomNav,
            backgroundColor: Colors.white,
            selectedLabelStyle: TextStyle(
              fontSize: 12,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
              color: primaryColor,
            ),
            unselectedLabelStyle: TextStyle(
              fontSize: 12,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
              color: bottomNav,
            ),
            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  authController.selectedIndex.value == 0
                      ? '${Constant.iconPath}chat_filled.svg'
                      : '${Constant.iconPath}chat.svg',
                  color: authController.selectedIndex.value == 0
                      ? primaryColor
                      : bottomNav,
                ),
                label: 'Chats',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  authController.selectedIndex.value == 1
                      ? '${Constant.iconPath}group_filled.svg'
                      : '${Constant.iconPath}group.svg',
                  color: authController.selectedIndex.value == 1
                      ? primaryColor
                      : bottomNav,
                ),
                label: 'Groups',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  authController.selectedIndex.value == 3
                      ? '${Constant.iconPath}profile_fill.svg'
                      : '${Constant.iconPath}profile.svg',
                  color: authController.selectedIndex.value == 3
                      ? primaryColor
                      : bottomNav,
                ),
                label: 'Profile',
              ),
            ],
            currentIndex: authController.selectedIndex.value,
            onTap: (index) {
              // If profile tab is tapped and user is not logged in, show LoginScreen
              if (index == 3 && !authController.isLoggedIn.value) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              } else {
                authController.onTabTapped(index);
              }
            }),
      ),
    );
  }
}
