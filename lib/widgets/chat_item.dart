import 'package:flutter/material.dart';
import '../models/chat.dart';

class ChatItem extends StatelessWidget {
  final Chat chat;

  ChatItem(this.chat);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Text(chat.name.substring(0, 2)),
      ),
      title: Text(chat.name),
      subtitle: Text(chat.message),
      trailing: Text(
        chat.timestamp.difference(DateTime.now()).inMinutes < 1
            ? 'сейчас'
            : chat.timestamp.difference(DateTime.now()).inMinutes < 60
                ? '${chat.timestamp.difference(DateTime.now()).inMinutes} минут назад'
                : '${chat.timestamp.hour}:${chat.timestamp.minute}',
      ),
    );
  }
}
