import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../models/chat.dart';
import '../models/chat_message.dart';

class ChatProvider with ChangeNotifier {
  final List<Chat> _chats = [];
  final List<ChatMessage> _messages = [];

  List<Chat> get chats {
    return [..._chats];
  }

  List<ChatMessage> get messages {
    return [..._messages];
  }

  Future<void> fetchChats() async {
    // Fetch chats from Firestore
  }

  Future<void> fetchMessages(String chatId) async {
    final snapshot = await FirebaseFirestore.instance
        .collection('chats/$chatId/messages')
        .orderBy('timestamp', descending: true)
        .get();
    _messages.clear();
    snapshot.docs.forEach((doc) {
      _messages.add(ChatMessage.fromMap(doc.data()));
    });
    notifyListeners();
  }

  Future<void> sendMessage(String chatId, ChatMessage message) async {
    final newDoc =
        FirebaseFirestore.instance.collection('chats/$chatId/messages').doc();
    await newDoc.set(message.toMap());
    _messages.insert(0, message); // Add message to the top of the list
    notifyListeners();
  }
}
