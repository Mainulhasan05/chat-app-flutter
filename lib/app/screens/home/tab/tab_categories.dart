import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../../base/color_data.dart';
import '../../../../base/constant.dart';

import '../../../../controllers/home/home_controller.dart';
import '../../../routes/app_routes.dart';

class TabCategories extends StatelessWidget {
  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Categories',
          style: TextStyle(
              color: Colors.black, fontSize: 16.0, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Padding(padding: const EdgeInsets.all(8.0), child: Container()),
    );
  }
}
