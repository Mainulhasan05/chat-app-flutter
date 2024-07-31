import 'package:flutter/material.dart';

class Constant {
  static String imagePath = "assets/images/";
  static String iconPath = "assets/icons/";
  static String imageDomain = "https://chatapi.mainulhasan05.xyz";
  static String domain = "https://chatapi.mainulhasan05.xyz";

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
