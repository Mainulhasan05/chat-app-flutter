import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:skeletonizer/skeletonizer.dart';

import '../../../../base/color_data.dart';
import '../../../../base/resizer/fetch_pixels.dart';

class TabCart extends StatefulWidget {
  @override
  State<TabCart> createState() => _TabCartState();
}

class _TabCartState extends State<TabCart> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    FetchPixels(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'My Cart',
          style: TextStyle(
              color: Colors.black, fontSize: 16.0, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [],
        ),
      ),
    );
  }
}
