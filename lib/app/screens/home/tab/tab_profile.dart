import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../../base//color_data.dart';

import '../../../../base/constant.dart';
import '../../../../controllers/auth/auth_controller.dart';

import '../../../routes/app_routes.dart';

class TabProfile extends StatefulWidget {
  @override
  State<TabProfile> createState() => _TabProfileState();
}

class _TabProfileState extends State<TabProfile> {
  AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light.copyWith(
          statusBarColor: primaryColor, // Status bar color
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(() => Container(
                      color: primaryColor,
                      padding: EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 30.0,
                            backgroundImage: NetworkImage(
                                authController.userInformation.value['avatar']),
                          ),
                          const SizedBox(width: 16.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                (authController
                                        .userInformation.value['full_name'] ??
                                    ''),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(height: 4.0),
                              Text(
                                authController.userInformation.value['phone'] ??
                                    'loldemoemail@gmail.com',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )),
                buildSectionTitle('Personal Information'),
                buildCustomTile(
                  icon: Icons.person,
                  title: 'Personal Information',
                  onTap: () {
                    // Handle personal information tap
                  },
                ),
                buildCustomTile(
                  icon: Icons.location_on,
                  title: 'Shipping Address',
                  onTap: () {
                    // Handle shipping address tap
                  },
                ),
                buildCustomTile(
                  icon: Icons.payment,
                  title: 'Payment Method',
                  onTap: () {
                    // Handle payment method tap
                  },
                ),
                // buildCustomTile(
                //   icon: Icons.history,
                //   title: 'Order History',
                //   onTap: () {
                //     // Constant.sendToNext(context, Routes.orderListRoute);
                //   },
                // ),
                buildSectionTitle('Personal Information'),
                buildCustomTile(
                  icon: Icons.lock,
                  title: 'Change Password',
                  onTap: () {
                    Constant.sendToNext(context, Routes.changePasswordRoute);
                  },
                ),
                buildCustomTile(
                  icon: Icons.logout,
                  title: 'Log Out',
                  onTap: () {
                    authController.handleLogout();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget buildListTile(
      {required IconData icon,
      required String title,
      required VoidCallback onTap}) {
    return ListTile(
      leading: Icon(icon, color: Colors.red),
      title: Text(
        title,
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        size: 15,
      ),
      onTap: onTap,
    );
  }

  Widget buildCustomTile(
      {required IconData icon,
      required String title,
      required VoidCallback onTap}) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            child: Row(
              children: [
                Icon(icon, color: Colors.red),
                SizedBox(width: 16.0),
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                  ),
                ),
                Icon(Icons.arrow_forward_ios, size: 15),
              ],
            ),
          ),
        ),
        Divider(
          color: dividerColor,
          height: 1.0,
          thickness: 0.5,
          indent: 16.0,
          endIndent: 16.0,
        ),
      ],
    );
  }
}
