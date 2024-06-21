import 'package:flutter/material.dart';
import '../models/chat_message.dart';

class MessageItem extends StatelessWidget {
  final ChatMessage message;
  final bool isMe;

  MessageItem(this.message, this.isMe);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            decoration: BoxDecoration(
              color: isMe ? Colors.grey[300] : Colors.blue[100],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              message.text,
              style: TextStyle(
                color: isMe ? Colors.black : Colors.white,
              ),
            ),
          ),
          SizedBox(height: 5),
          Text(
            message.timestamp.toIso8601String(),
            style: TextStyle(fontSize: 10, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
