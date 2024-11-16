import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ascendant/models/messaging_model.dart';

class ChatViewModel extends ChangeNotifier {
  final List<MessageModel> _messages = [];
  final UserModel _user = UserModel(id: '82091008-a484-4a89-ae75-a22bf8d6f3ac');

  List<MessageModel> get messages => List.unmodifiable(_messages);

  UserModel get user => _user;

  void addMessage(String text) {
    final newMessage = MessageModel(
      id: _randomString(),
      text: text,
      author: _user,
      createdAt: DateTime.now().millisecondsSinceEpoch,
    );

    _messages.insert(0, newMessage);
    notifyListeners();
  }

  String _randomString() {
    final random = Random.secure();
    final values = List<int>.generate(16, (i) => random.nextInt(255));
    return base64UrlEncode(values);
  }
}
