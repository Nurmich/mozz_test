import 'package:flutter/material.dart';
import '../models/chat.dart';

class ChatProvider with ChangeNotifier {
  List<Chat> _chats = [
    // Sample data
    Chat(
        id: '1',
        name: 'Виктор Власов',
        message: 'Уже сделал?',
        timestamp: DateTime.now().subtract(Duration(days: 1))),
    Chat(
        id: '2',
        name: 'Саша Алексеев',
        message: 'Я готов',
        timestamp: DateTime(2022, 1, 12)),
    Chat(
        id: '3',
        name: 'Пётр Жаринов',
        message: 'Я вышел',
        timestamp: DateTime.now().subtract(Duration(minutes: 2))),
    Chat(
        id: '4',
        name: 'Алина Жукова',
        message: 'Я вышел',
        timestamp: DateTime.now().subtract(Duration(hours: 2))),
  ];

  List<Chat> get chats {
    return [..._chats];
  }
}
