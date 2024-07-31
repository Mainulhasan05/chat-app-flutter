import 'dart:ffi';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../base/color_data.dart';
import '../../../../base/common_widgets.dart';
import '../../../../base/constant.dart';
import '../../../../base/resizer/fetch_pixels.dart';

import '../../../../controllers/auth/auth_controller.dart';
import '../../../../controllers/home/home_controller.dart';

import '../../../routes/app_routes.dart';

class TabHome extends StatelessWidget {
  final HomeController homeController = Get.put(HomeController());

  final AuthController authController = Get.put(AuthController());
  List<String> photosUrl = [
    "https://images.pexels.com/photos/90946/pexels-photo-90946.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    "https://images.pexels.com/photos/1667088/pexels-photo-1667088.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
        "https://images.pexels.com/photos/2928381/pexels-photo-2928381.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    "https://images.pexels.com/photos/4033324/pexels-photo-4033324.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    "https://images.pexels.com/photos/4033324/pexels-photo-4033324.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
  ];
  @override
  Widget build(BuildContext context) {
    FetchPixels(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false, // Remove the default back button
        title: Row(
          mainAxisAlignment: MainAxisAlignment
              .spaceBetween, // Space between the menu and other icons
          children: [
            IconButton(
              icon: SvgPicture.asset(
                Constant.iconPath + 'menu.svg',
                color: Colors.black,
                width: 24,
                height: 24,
              ),
              onPressed: () {
                // Handle menu button press
              },
            ),
            Row(
              children: [
                IconButton(
                  icon: SvgPicture.asset(
                    Constant.iconPath + 'notification.svg',
                    color: Colors.black,
                    width: 24,
                    height: 24,
                  ),
                  onPressed: () {
                    // Handle notification button press
                  },
                ),
                IconButton(
                  icon: SvgPicture.asset(
                    Constant.iconPath + 'scan.svg',
                    color: Colors.black,
                    width: 24,
                    height: 24,
                  ),
                  onPressed: () {
                    // Handle QR code scanner button press
                  },
                ),
              ],
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      onTap: () {
                        Constant.sendToNext(context, Routes.searchRoute);
                      },
                      decoration: InputDecoration(
                        hintText: 'Search',
                        hintStyle: const TextStyle(
                            color: Color(0xFF7B7B7B),
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            fontFamily: 'Poppins'),
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey[200]!,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey[200]!,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey[200]!,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        filled: true,
                        fillColor: Colors.grey[200]!,
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 12.0),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  Container(
                    height: 48.0,
                    width: 48.0,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: IconButton(
                      icon: Icon(Icons.tune, color: Colors.white),
                      onPressed: () {
                        // Handle filter button press
                      },
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Exclusive Sales',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  TextButton(
                    onPressed: () {
                      authController.onTabTapped(1);
                    },
                    child: Text(
                      'SEE ALL',
                      style: TextStyle(
                          color: primaryColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String title;
  final String imagePath; // Add imagePath parameter

  const CategoryCard({Key? key, required this.title, required this.imagePath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 100,
        height: 79, // Adjusted to fit image and text
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(color: borderColor, width: 2),
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Display image or placeholder
            Container(
              width: 50, // Adjust the width and height as needed
              height: 40,
              child: imagePath.isNotEmpty
                  ? CachedNetworkImage(
                      imageUrl: imagePath,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Skeletonizer(
                        enabled: true,
                        child: Container(
                          color: Colors.grey[300],
                        ),
                      ),
                    )
                  : Image.network(
                      'https://api.mainulhasan05.xyz/uploads/categories/1711695697006-Designer%20(10).jpeg'),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(
                color: categoryTextColor,
                fontWeight: FontWeight.w400,
                fontSize: 12,
              ),
              maxLines: 1,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

// class ProductCard extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 2,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Expanded(
//             child: Container(
//               decoration: BoxDecoration(
//                 image: DecorationImage(
//                   image: AssetImage(
//                       'assets/product_placeholder.png'), // Replace with your product image
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text(
//               'Product Name',
//               style: TextStyle(fontWeight: FontWeight.bold),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 8.0),
//             child: Text('\$99.99'), // Replace with your product price
//           ),
//         ],
//       ),
//     );
//   }
// }


