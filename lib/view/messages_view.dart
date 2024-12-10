import 'dart:convert';
import 'dart:math';

import 'package:ascendant/models/messaging_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';

// For the testing purposes, you should probably use https://pub.dev/packages/uuid.
String randomString() {
  final random = Random.secure();
  final values = List<int>.generate(16, (i) => random.nextInt(255));
  return base64UrlEncode(values);
}

class MessagesView extends StatefulWidget {
  const MessagesView({super.key});

  @override
  State<MessagesView> createState() => _MessagesViewState();
}

class _MessagesViewState extends State<MessagesView> {
  final List<types.Message> _messages = [];
  final _user = const types.User(id: '82091008-a484-4a89-ae75-a22bf8d6f3ac');
  final _bot = const types.User(id: '82091008-a484-4a89-ae75-a22bf8d6f3ad');

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 5,
        ),
        body: Chat(
          messages: _messages,
          onSendPressed: _handleSendPressed,
          user: _user,
        ),
      );

  void _addMessage(types.Message message) {
    setState(() {
      _messages.insert(0, message);
    });
  }

  void _handleSendPressed(types.PartialText message) {
    final textMessage = types.TextMessage(
      author: _user,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: randomString(),
      text: message.text,
    );

    _addMessage(textMessage);

    _simulateBotResponse(message.text);
  }

  void _simulateBotResponse(String userMessage) {
    Future.delayed(const Duration(seconds: 1), () {
      final botReply = _generateBotResponse(userMessage);

      final botMessage = types.TextMessage(
        author: _bot,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        id: randomString(),
        text: botReply,
      );

      _addMessage(botMessage);
    });

  }

  String _generateBotResponse(String userMessage) {
    // Example logic for bot responses
    if (userMessage.toLowerCase().contains('hey')) {
      return 'Hi there! How are you?';
    } else if (userMessage.toLowerCase().contains('how are you')) {
      return 'I’m just a bot, but I’m functioning as expected! 😊';
    } else if (userMessage.toLowerCase().contains('hi')) {
      return 'Are you a Libra? Because youd balance out my life perfectly';
    } else {
      return 'So nice to meet you!';
    }
  }
}
