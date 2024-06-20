import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  final String chatId;

  ChatScreen(this.chatId);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat'),
      ),
      body: Center(
        child: Text('Chat Screen for $chatId'),
      ),
    );
  }
}
