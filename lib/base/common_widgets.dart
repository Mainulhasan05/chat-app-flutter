import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'color_data.dart';
import 'constant.dart';

class ProductCard extends StatelessWidget {
  final String imageUrl;
  final String? productName;
  final String? rating;
  final String? oldPrice;
  final String? newPrice;
  final bool? isFavourite;
  final VoidCallback onTap;

  ProductCard({
    required this.imageUrl,
    this.productName,
    this.rating,
    this.oldPrice,
    this.newPrice,
    this.isFavourite,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          // color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: CachedNetworkImage(
                      imageUrl: imageUrl,
                      fit: BoxFit.cover,
                      height: 150,
                      width: double.infinity,
                      placeholder: (context, url) => Skeletonizer(
                        enabled: true,
                        child: Container(
                          height: 150,
                          width: double.infinity,
                          color: Colors.grey[300],
                        ),
                      ),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    )
                    // Image.network(
                    //   imageUrl,
                    //   fit: BoxFit.cover,
                    //   height: 150,
                    //   width: double.infinity,
                    //   loadingBuilder: (BuildContext context, Widget child,
                    //       ImageChunkEvent? loadingProgress) {
                    //     if (loadingProgress == null) {
                    //       return child;
                    //     } else {
                    //       return Skeletonizer(
                    //         enabled: true,
                    //         child: Container(
                    //           height: 150,
                    //           width: double.infinity,
                    //           color: Colors.grey[300],
                    //         ),
                    //       );
                    //     }
                    //   },
                    // ),
                    ),
                if (isFavourite == true)
                  Positioned(
                    top: 8.0,
                    left: 8.0,
                    child: CircleAvatar(
                      backgroundColor: Colors.black,
                      child:
                          SvgPicture.asset('${Constant.iconPath}favourite.svg'),
                    ),
                  ),
                if (rating != null)
                  Positioned(
                    bottom: 8.0,
                    left: 8.0,
                    child: Container(
                      padding: EdgeInsets.all(4.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      child: Row(
                        children: [
                          Text(
                            rating.toString(),
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(width: 4.0),
                          Icon(Icons.star, color: Colors.orange, size: 12),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (productName != null)
                    Text(
                      productName!,
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                      maxLines: 1,
                    ),
                  SizedBox(height: 4.0),
                  Row(
                    children: [
                      if (oldPrice != null)
                        Text(
                          '\$${oldPrice.toString()}',
                          style: TextStyle(
                            fontSize: 12,
                            color: oldPriceColor,
                            fontWeight: FontWeight.w400,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      const SizedBox(width: 8.0),
                      if (newPrice != null)
                        Text(
                          '\$${newPrice.toString()}',
                          style: TextStyle(
                            fontSize: 14,
                            color: newPriceColor,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
