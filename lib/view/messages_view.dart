import 'package:ascendant/models/messaging_model.dart';
import 'package:flutter/material.dart';

class MessagesView extends StatelessWidget {
  static Route route(MessageModel data) => MaterialPageRoute(
        builder: (context) => MessagesView(
          messageModel: data,
        ),
      );

  const MessagesView({Key? key, required this.messageModel}) : super(key: key);

  final MessageModel messageModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
