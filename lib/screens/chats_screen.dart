import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../widgets/chat_item.dart';

class ChatsScreen extends StatelessWidget {
  static const routeName = '/chats';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Чаты'),
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.of(context).pushReplacementNamed('/login');
            },
          ),
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('chats').snapshots(),
        builder: (ctx, chatSnapshot) {
          if (chatSnapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          final chatDocs = chatSnapshot.data?.docs;
          return ListView.builder(
            itemCount: chatDocs?.length ?? 0,
            itemBuilder: (ctx, index) {
              var chat = chatDocs?[index];
              var participants = List<String>.from(chat?['participants'] ?? []);
              var chatTitle = participants.firstWhere(
                  (email) => email != FirebaseAuth.instance.currentUser?.email,
                  orElse: () => 'Unknown');
              return ListTile(
                title: Text(chatTitle),
                onTap: () {
                  // Navigate to chat screen
                },
              );
            },
          );
        },
      ),
    );
  }
}
