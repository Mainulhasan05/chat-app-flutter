import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../base/color_data.dart';
import '../../../../base/resizer/fetch_pixels.dart';
import '../../../../controllers/auth/auth_controller.dart';
import '../../../routes/app_routes.dart';

class ResetPassword extends StatefulWidget {
  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
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
              Center(
                child: Text(
                  'Forget Password',
                  style: TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Center(
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
              Text(
                'Phone',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  fontFamily: 'Poppins',
                ),
              ),
              SizedBox(height: FetchPixels.getPixelHeight(10)),
              TextField(
                controller: authController.loginPhoneController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  hintText: 'Enter your phone',
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
              SizedBox(height: FetchPixels.getPixelHeight(20)),
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
                              authController.handleLogin();
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
                              'GET OTP',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                  )),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
