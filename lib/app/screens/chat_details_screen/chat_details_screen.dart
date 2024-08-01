import 'package:flutter/material.dart';

class ChatDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Handle back button press
          },
        ),
        title: Row(
          children: [
            CircleAvatar(
              radius: 20.0,
              backgroundImage: AssetImage(
                  'assets/kristin.png'), // Replace with actual image asset
            ),
            const SizedBox(width: 8.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Kristin Watson',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Active 3m ago',
                  style: TextStyle(fontSize: 12.0, color: Colors.grey),
                ),
              ],
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
            child: ListView(
              children: [
                _buildReceivedMessage(context, 'Hi Sajol,'),
                _buildSentMessage(context, 'Hello, How are you?', true),
                _buildAudioMessage(context),
                _buildImageMessage(context),
                _buildSentMessage(context, 'Error happened', false),
                _buildReceivedMessage(context, 'This looks great man!!'),
              ],
            ),
          ),
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
            onPressed: () {
              // Handle send button press
            },
          ),
        ],
      ),
    );
  }
}
