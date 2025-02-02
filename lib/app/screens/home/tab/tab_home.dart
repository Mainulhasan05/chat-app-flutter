import 'dart:ffi';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_app_flutter/app/service/socket_service.dart';
import 'package:chat_app_flutter/controllers/chat/chat_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../base/color_data.dart';
import '../../../../base/constant.dart';
import '../../../../base/resizer/fetch_pixels.dart';

import '../../../../controllers/auth/auth_controller.dart';
import '../../../../controllers/home/home_controller.dart';

import '../../../routes/app_routes.dart';

class TabHome extends StatefulWidget {
  @override
  State<TabHome> createState() => _TabHomeState();
}

class _TabHomeState extends State<TabHome> {
  HomeController homeController = Get.put(HomeController());
  ChatDetailsController chatDetailsController =
      Get.put(ChatDetailsController());
  final SocketService socketService = SocketService();

  @override
  void initState() {
    super.initState();
    if (homeController.privateChatList.isEmpty) {
      homeController.getHomepageData();
    }
  }

  final List<Chat> chats = [
    Chat('Jenny Wilson', 'Hope you are doing well...', '3m ago',
        'assets/jenny.png'),
    Chat('Esther Howard', 'Hello Abdullah! I am...', '8m ago',
        'assets/esther.png'),
    Chat(
        'Ralph Edwards', 'Do you have update...', '5d ago', 'assets/ralph.png'),
    Chat('Jacob Jones', 'You\'re welcome :)', '5d ago', 'assets/jacob.png'),
    Chat('Albert Flores', 'Thanks', '5d ago', 'assets/albert.png'),
    Chat('Jenny Wilson', 'Hope you are doing well...', '3m ago',
        'assets/jenny.png'),
    Chat('Esther Howard', 'Hello Abdullah! I am...', '8m ago',
        'assets/esther.png'),
    Chat(
        'Ralph Edwards', 'Do you have update...', '5d ago', 'assets/ralph.png'),
    Chat('Jacob Jones', 'You\'re welcome :)', '5d ago', 'assets/jacob.png'),
    Chat('Albert Flores', 'Thanks', '5d ago', 'assets/albert.png'),
  ];

  @override
  Widget build(BuildContext context) {
    FetchPixels(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment
              .spaceBetween, // Space between the menu and other icons
          children: [
            Text(
              'Chats',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
              ),
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
                ],
              ),
            ),

            Obx(
              () => homeController.isLoading.value
                  ? ListView.builder(
                      itemCount: 5,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 80,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        );
                      },
                    )
                  : ListView.builder(
                      itemCount: homeController.privateChatList.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        final chat = homeController.privateChatList[index];
                        return InkWell(
                          onTap: () {
                            chatDetailsController.recipientId.value =
                                chat['user']['id'];
                            chatDetailsController.loadMessages();
                            chatDetailsController.senderInfo.value =
                                chat['user'];

                            Constant.sendToNext(
                                context, Routes.chatDetailRoute);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 30.0,
                                  backgroundImage: CachedNetworkImageProvider(
                                    chat['user']['avatar'],
                                  ),
                                ),
                                const SizedBox(width: 12.0),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      chat['user']['full_name'],
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const SizedBox(height: 4.0),
                                    Text(
                                      chat['lastMessage']['content'],
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                                Spacer(),
                                Text(
                                  chat['lastMessage']['createdAt'],
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Handle add chat action
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class Chat {
  final String name;
  final String message;
  final String time;
  final String avatar;

  Chat(this.name, this.message, this.time, this.avatar);
}
