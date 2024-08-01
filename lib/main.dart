import 'dart:async';

import 'package:chat_app_flutter/base/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart';
import 'app/service/notification_service.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:socket_io_client/socket_io_client.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await initializeService();
  NotificationService.init();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(const MyApp());
}

Future<void> initializeService() async {
  final service = FlutterBackgroundService();
  await service.configure(
      iosConfiguration: IosConfiguration(),
      androidConfiguration: AndroidConfiguration(
          onStart: onStart,
          isForegroundMode: true,
          autoStartOnBoot: true,
          autoStart: true));
}

@pragma('vm:entry-point')
void onStart(ServiceInstance service) async {
  final socket = io(Constant.domain, <String, dynamic>{
    'transports': ['websocket'],
    'autoConnect': true,
  });
  socket.onConnect((_) {
    print('Connected. Socket ID: ${socket.id}');
    // Implement your socket logic here
    // For example, you can listen for events or send data
  });

  socket.onDisconnect((_) {
    print('Disconnected');
  });
  socket.on("event-name1", (data) {
    //do something here like pushing a notification
  });
  service.on("stop").listen((event) {
    service.stopSelf();
    print("background process is now stopped");
  });

  service.on("start").listen((event) {});

  Timer.periodic(const Duration(seconds: 10), (timer) {
    socket.emit("event-name",
        "service is successfully running ${DateTime.now().second}");
    print("service is successfully running ${DateTime.now().second}");
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      title: 'ChatApp',
      routes: AppPages.routes,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        fontFamily: 'Poppins',
      ),
    );
  }
}
