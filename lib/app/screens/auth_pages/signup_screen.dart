import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../base/color_data.dart';
import '../../../base/constant.dart';
import '../../../base/resizer/fetch_pixels.dart';
import '../../../controllers/auth/auth_controller.dart';

class SignupScreen extends StatefulWidget {
  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final authController = Get.put(AuthController());
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    FetchPixels(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: FetchPixels.getPixelHeight(40)),
              const Center(
                child: Text(
                  'Create Account',
                  style: TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Center(
                child: Text(
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey,
                    fontFamily: 'Poppins',
                    fontSize: 12.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(height: FetchPixels.getPixelHeight(40)),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'First Name',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            fontFamily: 'Poppins',
                          ),
                        ),
                        SizedBox(height: FetchPixels.getPixelHeight(10)),
                        TextField(
                          controller: authController.registerFnameController,
                          decoration: InputDecoration(
                            hintText: 'First Name',
                            hintStyle: const TextStyle(
                                color: Color(0xFF7B7B7B),
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                fontFamily: 'Poppins'),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: authBorderColor,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: authBorderColor,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: authBorderColor,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 4.0, horizontal: 12.0),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Last Name',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            fontFamily: 'Poppins',
                          ),
                        ),
                        SizedBox(height: FetchPixels.getPixelHeight(10)),
                        TextField(
                          controller: authController.registerLnameController,
                          decoration: InputDecoration(
                            hintText: 'Last Name',
                            hintStyle: const TextStyle(
                                color: Color(0xFF7B7B7B),
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                fontFamily: 'Poppins'),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: authBorderColor,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: authBorderColor,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: authBorderColor,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 4.0, horizontal: 12.0),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                'Email',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  fontFamily: 'Poppins',
                ),
              ),
              SizedBox(height: FetchPixels.getPixelHeight(10)),
              TextField(
                controller: authController.registerPhoneController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: 'Enter your email',
                  hintStyle: const TextStyle(
                      color: Color(0xFF7B7B7B),
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      fontFamily: 'Poppins'),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: authBorderColor,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: authBorderColor,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: authBorderColor,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 4.0, horizontal: 12.0),
                ),
              ),
              SizedBox(height: FetchPixels.getPixelHeight(16)),
              const Text(
                'Password',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  fontFamily: 'Poppins',
                ),
              ),
              SizedBox(height: FetchPixels.getPixelHeight(10)),
              TextField(
                controller: authController.registerPasswordController,
                obscureText: !showPassword,
                decoration: InputDecoration(
                  hintText: 'Password',
                  hintStyle: const TextStyle(
                      color: Color(0xFF7B7B7B),
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      fontFamily: 'Poppins'),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: authBorderColor,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: authBorderColor,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: authBorderColor,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 4.0, horizontal: 12.0),
                  suffixIcon: IconButton(
                    icon: Icon(
                      showPassword
                          ? Icons.visibility
                          : Icons.visibility_off_outlined,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    },
                  ),
                ),
              ),
              SizedBox(height: FetchPixels.getPixelHeight(10)),
              Obx(() => Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 0),
                    child: authController.isLoading.value
                        ? Center(
                            child: CircularProgressIndicator(
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(primaryColor),
                            ),
                          )
                        : ElevatedButton(
                            onPressed: () {
                              authController.handleRegister();
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  primaryColor),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                              padding:
                                  MaterialStateProperty.all<EdgeInsetsGeometry>(
                                EdgeInsets.symmetric(vertical: 12.0),
                              ),
                            ),
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                  )),
              SizedBox(height: 20),
              Row(
                children: const [
                  Expanded(
                    child: Divider(
                      thickness: 1,
                      color: Colors.grey,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text('or sign in with'),
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 1,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: SvgPicture.asset('${Constant.iconPath}facebook.svg'),
                    onPressed: () {
                      // Handle Facebook sign up
                    },
                  ),
                  IconButton(
                    icon: SvgPicture.asset('${Constant.iconPath}google.svg'),
                    onPressed: () {
                      // Handle Google sign up
                    },
                  ),
                  IconButton(
                    icon: SvgPicture.asset('${Constant.iconPath}apple.svg'),
                    onPressed: () {
                      // Handle Apple sign up
                    },
                  ),
                ],
              ),
              // SizedBox(height: FetchPixels.getPixelHeight(5)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already have an account?'),
                  TextButton(
                    onPressed: () {
                      // Handle sign up
                    },
                    child: Text('Login',
                        style: TextStyle(
                            color: primaryColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w500)),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
