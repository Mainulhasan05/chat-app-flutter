import 'package:chat_app_flutter/controllers/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../app/routes/app_routes.dart';
import '../../base/constant.dart';
import '../../base/pref_data.dart';
import '../../http_client.dart';

class AuthController extends GetxController {
  HomeController homeController = Get.put(HomeController());
  RxBool isLoggedIn = RxBool(false);
  RxBool isLoading = RxBool(false);
  Rx<dynamic> userInformation = Rx<dynamic>({});
  var selectedIndex = 0.obs;
  TextEditingController loginPhoneController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();
  // register
  TextEditingController registerPhoneController = TextEditingController();
  TextEditingController registerPasswordController = TextEditingController();
  TextEditingController registerFnameController = TextEditingController();
  TextEditingController registerLnameController = TextEditingController();
  // oldPassword, newPassword, confirmPassword -> change password
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  TextEditingController resetPasswordPhoneController = TextEditingController();

  Rx<dynamic> orderList = Rx<dynamic>({});

  void onTabTapped(int index) {
    if (index == 3) {
      if (isLoggedIn.value) {
        selectedIndex.value = index;
      } else {
        selectedIndex.value = index;
      }
    } else {
      selectedIndex.value = index;
    }
  }

  void handleLogin() async {
    if (loginPhoneController.text.isEmpty) {
      Get.snackbar('Error', 'Phone number is required');
    } else if (loginPasswordController.text.isEmpty) {
      Get.snackbar('Error', 'Password is required');
    } else {
      final data = {
        "phone": loginPhoneController.text,
        "password": loginPasswordController.text,
      };
      try {
        isLoading.value = true;
        print(data);
        final response = await HttpRequestHelper.post('/api/auth/login', data);
        print(response);
        if (response['success']) {
          HttpRequestHelper.setAuthToken(response['data']['token']);
          isLoggedIn.value = true;
          Constant.showToast(response['message']);

          homeController.getHomepageData();
          await PrefData.setLogIn(true);
          await PrefData.setToken(response['data']['token']);
          final user = response['data']['user'];

          await PrefData.setUserInfo(user['id'].toString(), user['full_name'],
              user['phone'], user['avatar'], user['room_id']);
          userInformation.value = user;
          Constant.sendToNext(Get.context!, Routes.homeScreenRoute);
        } else {
          Fluttertoast.showToast(
              msg: response['error'], gravity: ToastGravity.CENTER);
        }
        isLoading.value = false;
      } catch (e) {
        print('mega error');
        print(e);
        isLoading.value = false;
      }
    }
  }

  void handleRegister() async {
    if (registerPhoneController.text.isEmpty) {
      Get.snackbar('Error', 'Email is required');
    } else if (registerPasswordController.text.isEmpty) {
      Get.snackbar('Error', 'Password is required');
    } else if (registerFnameController.text.isEmpty) {
      Get.snackbar('Error', 'First name is required');
    } else {
      final data = {
        "phone": registerPhoneController.text,
        "password": registerPasswordController.text,
        "full_name": registerFnameController.text,
      };

      try {
        isLoading.value = true;
        final response =
            await HttpRequestHelper.post('/api/auth/register', data);
        if (response['status']) {
          HttpRequestHelper.setAuthToken(response['data']['token']);
          isLoggedIn.value = true;
          homeController.getHomepageData();
          await PrefData.setLogIn(true);

          await PrefData.setToken(response['data']['token']);
          Constant.showToast(response['message']);
          userInformation.value = response['data']['user'];
          await PrefData.setUserInfo(
              userInformation.value['id'].toString(),
              userInformation.value['full_name'],
              userInformation.value['phone'],
              userInformation.value['avater'],
              userInformation.value['room_id']);
          Constant.sendToNext(Get.context!, Routes.homeScreenRoute);
        } else {
          final snackBar = SnackBar(
            content: Text(response['error']['email'][0]),
            duration: const Duration(seconds: 4),
            backgroundColor: Colors.red,
            showCloseIcon: true,
          );
          ScaffoldMessenger.of(Get.context!).showSnackBar(snackBar);
        }
        isLoading.value = false;
      } catch (e) {
        isLoading.value = false;
      }
    }
  }

  void handleLogout() async {
    try {
      isLoggedIn.value = false;
      await PrefData.setLogIn(false);
      PrefData.setToken('');
      HttpRequestHelper.setAuthToken('');

      Constant.showToast('Logout successful',
          color: Colors.green, textColor: Colors.white);
      userInformation.value = {};
      Constant.sendToNext(Get.context!, Routes.loginRoute);
    } catch (e) {
      print(e);
    }
  }

  // /account
  // getUserInformation
  void getUserInformation() async {
    try {
      final response = await HttpRequestHelper.get('/api/auth/profile');
      print('getting user info');
      print(response);

      userInformation.value = response['data']['user'];
      await PrefData.setUserInfo(
          userInformation.value['id'].toString(),
          userInformation.value['full_name'],
          userInformation.value['phone'],
          userInformation.value['avater'],
          userInformation.value['room_id']);
      print(userInformation.value);
    } catch (e) {
      print(e);
    }
  }

  // /account/customer_forgotPass handlePasswordChange
  void handlePasswordChange() async {
    if (oldPasswordController.text.isEmpty) {
      Get.snackbar('Error', 'Old password is required');
    } else if (newPasswordController.text.isEmpty) {
      Get.snackbar('Error', 'New password is required');
    } else if (confirmPasswordController.text.isEmpty) {
      Get.snackbar('Error', 'Confirm password is required');
    } else if (newPasswordController.text != confirmPasswordController.text) {
      Get.snackbar('Error', 'Password does not match');
    } else {
      final data = {
        "old_password": oldPasswordController.text,
        "password": newPasswordController.text,
        "confirm": confirmPasswordController.text,
      };
      try {
        isLoading.value = true;
        final response =
            await HttpRequestHelper.post('/account/customer_forgotPass', data);
        print(response);
        if (response['success'] == 1) {
          print(response);
          Get.snackbar('Success', 'Password changed successfully');
          oldPasswordController.clear();
          newPasswordController.clear();
          confirmPasswordController.clear();
        } else {
          final snackBar = SnackBar(
            content: Text(response['error'][0]),
            duration: Duration(seconds: 4),
            backgroundColor: Colors.red,
            showCloseIcon: true,
          );
          ScaffoldMessenger.of(Get.context!).showSnackBar(snackBar);
        }
        isLoading.value = false;
      } catch (e) {
        isLoading.value = false;
      }
    }
  }

  // /account/forget post, body phone: get otp
  void handleForgetPassword() async {
    if (resetPasswordPhoneController.text.isEmpty) {
      Get.snackbar('Error', 'Phone number is required');
    } else {
      final data = {
        "phone": resetPasswordPhoneController.text,
      };
      try {
        isLoading.value = true;
        final response = await HttpRequestHelper.post('/account/forget', data);
        print(response);
        if (response['success'] == 1) {
          print(response);
          Get.snackbar('Success', 'OTP sent successfully');
          resetPasswordPhoneController.clear();
          // Constant.sendToNext(Get.context!, Routes.otpScreenRoute);
        } else {
          final snackBar = SnackBar(
            content: Text(response['error'][0]),
            duration: Duration(seconds: 4),
            backgroundColor: Colors.red,
            showCloseIcon: true,
          );
          ScaffoldMessenger.of(Get.context!).showSnackBar(snackBar);
        }
        isLoading.value = false;
      } catch (e) {
        isLoading.value = false;
      }
    }
  }
}
