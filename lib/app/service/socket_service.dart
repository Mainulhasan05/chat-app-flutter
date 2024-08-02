import 'package:chat_app_flutter/base/constant.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketService {
  static final SocketService _instance = SocketService._internal();
  late IO.Socket _socket;

  factory SocketService() {
    return _instance;
  }

  SocketService._internal();

  void initializeSocket() {
    _socket = IO.io(Constant.domain, <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
    });

    _socket.on('connect', (_) {
      print('Connected to socket server');
    });

    _socket.on('disconnect', (_) {
      print('Disconnected from socket server');
    });

    _socket.connect();
  }

  IO.Socket get socket => _socket;
}
