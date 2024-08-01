import 'package:flutter/material.dart';

class Constant {
  static String imagePath = "assets/images/";
  static String iconPath = "assets/icons/";
  static String imageDomain = "http://192.168.1.183:5000";
  static String domain = "http://192.168.1.183:5000";

  static backToPrev(BuildContext context) {
    Navigator.of(context).pop();
  }

  static sendToNext(BuildContext context, String route, {Object? arguments}) {
    if (arguments != null) {
      Navigator.pushNamed(context, route, arguments: arguments);
    } else {
      Navigator.pushNamed(context, route);
    }
  }
}
