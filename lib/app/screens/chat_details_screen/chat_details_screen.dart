import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_app_flutter/controllers/auth/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/chat/chat_details_controller.dart';

class ChatDetailsScreen extends StatefulWidget {
  @override
  State<ChatDetailsScreen> createState() => _ChatDetailsScreenState();
}

class _ChatDetailsScreenState extends State<ChatDetailsScreen> {
  ChatDetailsController chatDetailsController =
      Get.put(ChatDetailsController());
  AuthController authController = Get.put(AuthController());
  @override
  void initState() {
    print(authController.userInformation.value['id']);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
        title: Row(
          children: [
            Obx(() => CircleAvatar(
                  radius: 20.0,
                  backgroundImage: CachedNetworkImageProvider(
                    chatDetailsController.senderInfo.value['avatar'],
                  ),
                  onBackgroundImageError: (error, stackTrace) {
                    // Handle the error here
                  },
                  child: CachedNetworkImage(
                    imageUrl: chatDetailsController.senderInfo.value['avatar'],
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) =>
                        Image.asset('assets/images/sample_image.png'),
                    imageBuilder: (context, imageProvider) => CircleAvatar(
                      radius: 20.0,
                      backgroundImage: imageProvider,
                    ),
                  ),
                )),
            const SizedBox(width: 4.0),
            Obx(
              () => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    chatDetailsController.senderInfo.value['full_name'],
                    style:
                        TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    chatDetailsController.senderInfo.value['last_seen'] == null
                        ? 'Active 30m ago'
                        : 'Last seen ${chatDetailsController.senderInfo.value['last_seen']}',
                    style: TextStyle(fontSize: 12.0, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.call),
            onPressed: () {
              // Handle call button press
            },
          ),
          IconButton(
            icon: Icon(Icons.video_call),
            onPressed: () {
              // Handle video call button press
            },
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {
              // Handle more options button press
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: Obx(
            () => ListView(
              children: [
                ...chatDetailsController.messageList.map(
                  (message) {
                    if (message['recipient_id'] ==
                        authController.userInformation.value['id']) {
                      return _buildReceivedMessage(context, message['content']);
                    } else if (message['sender_id'] ==
                        authController.userInformation.value['id']) {
                      return _buildSentMessage(
                          context, message['content'], true);
                    }
                    // else if (message['type'] == 'audio') {
                    //   return _buildAudioMessage(context);
                    // } else if (message['type'] == 'image') {
                    //   return _buildImageMessage(context);
                    // }
                    return Container();
                  },
                ),
                // _buildReceivedMessage(context, 'Hi Sajol,'),
                // _buildSentMessage(context, 'Hello, How are you?', true),
                // _buildAudioMessage(context),
                // _buildImageMessage(context),
                // _buildSentMessage(context, 'Error happened', false),
                // _buildReceivedMessage(context, 'This looks great man!!'),
              ],
            ),
          )),
          _buildMessageInputField(context),
        ],
      ),
    );
  }

  Widget _buildReceivedMessage(BuildContext context, String message) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 20.0,
            backgroundImage: CachedNetworkImageProvider(
              chatDetailsController.senderInfo.value['avatar'],
            ),
            onBackgroundImageError: (error, stackTrace) {
              // Handle the error here
            },
            child: CachedNetworkImage(
              imageUrl: chatDetailsController.senderInfo.value['avatar'],
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) =>
                  Image.asset('assets/images/sample_image.png'),
              imageBuilder: (context, imageProvider) => CircleAvatar(
                radius: 20.0,
                backgroundImage: imageProvider,
              ),
            ),
          ),
          const SizedBox(width: 8.0),
          Container(
            padding: const EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Text(message),
          ),
        ],
      ),
    );
  }

  Widget _buildSentMessage(
      BuildContext context, String message, bool isSuccess) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              color: Colors.green[200],
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Text(message),
          ),
          const SizedBox(width: 8.0),
          Icon(
            isSuccess ? Icons.check_circle : Icons.error,
            color: isSuccess ? Colors.green : Colors.red,
          ),
        ],
      ),
    );
  }

  Widget _buildAudioMessage(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 15.0,
            backgroundImage: AssetImage(
                'assets/kristin.png'), // Replace with actual image asset
          ),
          const SizedBox(width: 8.0),
          Container(
            padding: const EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.play_arrow, color: Colors.black),
                const SizedBox(width: 8.0),
                Text('0:37'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImageMessage(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              image: DecorationImage(
                image: AssetImage(
                    'assets/sample_image.png'), // Replace with actual image asset
                fit: BoxFit.cover,
              ),
            ),
            child: Icon(Icons.play_circle_outline,
                size: 50.0, color: Colors.white),
          ),
          const SizedBox(width: 8.0),
          Icon(Icons.check_circle, color: Colors.green),
        ],
      ),
    );
  }

  Widget _buildMessageInputField(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.camera_alt),
            onPressed: () {
              // Handle camera button press
            },
          ),
          IconButton(
            icon: Icon(Icons.photo),
            onPressed: () {
              // Handle gallery button press
            },
          ),
          Expanded(
            child: TextField(
              controller: chatDetailsController.messageController,
              decoration: InputDecoration(
                hintText: 'Type message',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 10.0),
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () async {
              await chatDetailsController.sendMessage();
            },
          ),
        ],
      ),
    );
  }
}
