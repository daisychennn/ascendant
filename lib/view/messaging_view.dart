import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:provider/provider.dart';
import 'package:ascendant/view_model/messaging_view_model.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
    create: (_) => ChatViewModel(),
    child: const MaterialApp(
      home: MyHomePage(),
    ),
  );
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<ChatViewModel>(context);

    return Scaffold(
      body: Chat(
        messages: viewModel.messages
            .map((msg) => types.TextMessage(
          id: msg.id,
          author: types.User(id: msg.author.id),
          createdAt: msg.createdAt,
          text: msg.text,
        ))
            .toList(),
        onSendPressed: (partialMessage) =>
            viewModel.addMessage(partialMessage.text),
        user: types.User(id: viewModel.user.id),
      ),
    );
  }
}

