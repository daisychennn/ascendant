import 'package:flutter/material.dart';

class RecentsModel {
  final String name;
  final String url;

  RecentsModel({
    required this.name,
    required this.url,
  });
}

class MessageModel {
  const MessageModel({
    required this.senderName,
    required this.message,
    required this.messageDate,
    required this.dateMessage,
    required this.profilePicture,
  });
  final String senderName;
  final String message;
  final DateTime messageDate;
  final String dateMessage;
  final String profilePicture;
}
