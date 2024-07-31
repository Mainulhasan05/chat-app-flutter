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
import '../../../../controllers/product_details/product_controller.dart';
import '../../../routes/app_routes.dart';

class TabHome extends StatelessWidget {
  final HomeController homeController = Get.put(HomeController());
  final ProductController productController = Get.put(ProductController());

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
            Container(
              color: flashSaleBackgroundColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 4.0, horizontal: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Flash Sales',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                        TextButton(
                          onPressed: () {
                            // Handle view all categories button press
                          },
                          child: Text(
                            'SEE ALL',
                            style: TextStyle(
                              color: primaryColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Obx(
                    () => GridView.builder(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.all(8.0),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 8.0,
                        mainAxisSpacing: 0,
                        childAspectRatio: FetchPixels.calculateAspectRatio(465),
                      ),
                      itemCount: homeController.flashSaleProducts.length,
                      itemBuilder: (context, index) {
                        final product = homeController.flashSaleProducts[index];
                        return ProductCard(
                          productName: product['name'],
                          newPrice: "\$${product['price'].toString()}",
                          oldPrice: "\$${product['old_price'].toString()}",
                          rating: 4.5.toString(),
                          isFavourite: false,
                          imageUrl: Constant.imageDomain + product['image'],
                          onTap: () {
                            productController.getProductDetails(
                              product['slug'],
                              product['name'],
                              product['price'].toString(),
                              Constant.imageDomain + product['image'],
                            );
                            Constant.sendToNext(
                              context,
                              Routes.productDetailsRoute,
                            );
                          },
                        );
                      },
                    ),
                  )
                ],
              ),
            ),

            // Padding(
            //   padding:
            //       const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Text(
            //         'Exclusive Sales',
            //         style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            //       ),
            //       TextButton(
            //         onPressed: () {
            //           // Handle view all categories button press
            //         },
            //         child: Text(
            //           'SEE ALL',
            //           style: TextStyle(
            //               color: primaryColor,
            //               fontWeight: FontWeight.w500,
            //               fontSize: 12),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            // SizedBox(
            //   height: 400, // Adjust the height to fit 2 rows
            //   child: ListView.builder(
            //     shrinkWrap: true,
            //     physics: BouncingScrollPhysics(),
            //     scrollDirection: Axis.horizontal,
            //     itemCount: 1, // Only one item to wrap the grid inside ListView
            //     itemBuilder: (context, index) {
            //       return Padding(
            //         padding: const EdgeInsets.symmetric(horizontal: 8.0),
            //         child: Container(
            //           width: 400, // Adjust the width to fit 2 columns
            //           child: Wrap(
            //             spacing: 8.0, // Horizontal spacing between items
            //             runSpacing: 8.0, // Vertical spacing between items
            //             children: List.generate(4, (index) {
            //               // Generate 4 items for 2x2 grid
            //               return Container(
            //                 width: FetchPixels.getPixelWidth(200),
            //                 child: ProductCard(
            //                   productName: 'Product Name $index',
            //                   newPrice: "99.99",
            //                   oldPrice: "129.99",
            //                   rating: 4.5,
            //                   isFavourite: false,
            //                   imageUrl: photosUrl[index % photosUrl.length],
            //                   onTap: () {
            //                     print(index);
            //                     Constant.sendToNext(
            //                         context, Routes.productDetailsRoute);
            //                   },
            //                 ),
            //               );
            //             }),
            //           ),
            //         ),
            //       );
            //     },
            //   ),
            // ),
            const SizedBox(height: 8),
            Container(
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 455,
                    child: Obx(() {
                      return SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(
                            (homeController.bestSellingProducts.length / 8)
                                .ceil(),
                            (pageIndex) {
                              int startIndex = pageIndex * 8;
                              int endIndex = (pageIndex + 1) * 8;
                              var products =
                                  homeController.bestSellingProducts.sublist(
                                startIndex,
                                endIndex >
                                        homeController
                                            .bestSellingProducts.length
                                    ? homeController.bestSellingProducts.length
                                    : endIndex,
                              );

                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Container(
                                  width:
                                      400, // Adjust the width to fit 2 columns * 4 products
                                  child: Wrap(
                                    spacing:
                                        8.0, // Horizontal spacing between items
                                    runSpacing:
                                        8.0, // Vertical spacing between items
                                    children:
                                        List.generate(products.length, (index) {
                                      var product = products[index];

                                      return Container(
                                        width:
                                            180, // Adjusted to fit within the grid
                                        child: ProductCard(
                                          productName: product['name'],
                                          newPrice: product['price'].toString(),
                                          oldPrice:
                                              product['old_price'].toString(),
                                          rating: "5.0".toString(),
                                          isFavourite: false,
                                          imageUrl: Constant.imageDomain +
                                              product['image'],
                                          onTap: () {
                                            productController.getProductDetails(
                                              product['slug'],
                                              product['name'],
                                              product['price'],
                                              Constant.imageDomain +
                                                  product['image'],
                                            );
                                            Constant.sendToNext(
                                              context,
                                              Routes.productDetailsRoute,
                                            );
                                          },
                                        ),
                                      );
                                    }),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),
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


