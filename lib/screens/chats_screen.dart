import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/chat_provider.dart';
import '../widgets/chat_item.dart';

class ChatsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = Provider.of<ChatProvider>(context);
    final chats = chatProvider.chats;

    return Scaffold(
      appBar: AppBar(
        title: Text('Чаты'),
      ),
      body: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (ctx, i) => ChatItem(chats[i]),
      ),
    );
  }
}
