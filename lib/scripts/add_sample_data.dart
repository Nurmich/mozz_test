import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> addSampleData() async {
  try {
    // Initialize Firebase
    await Firebase.initializeApp();

    // Get reference to Firestore
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    // Define chat participants
    String user1 = 'test@gmail.com';
    String user2 = 'test2@gmail.com';

    // Create a chat document with participants
    DocumentReference chatDoc = await firestore.collection('chats').add({
      'participants': [user1, user2],
    });

    print('Chat document created with ID: ${chatDoc.id}');

    // Add sample messages to the chat with specific timestamps
    await chatDoc.collection('messages').add({
      'sender': user1,
      'text': 'Hello, how are you?',
      'timestamp': Timestamp.fromDate(DateTime(2023, 6, 21, 14, 0)),
    });

    await chatDoc.collection('messages').add({
      'sender': user2,
      'text': 'I am good, thank you! How about you?',
      'timestamp': Timestamp.fromDate(DateTime(2023, 6, 21, 14, 5)),
    });

    await chatDoc.collection('messages').add({
      'sender': user1,
      'text': 'I am doing well too.',
      'timestamp': Timestamp.fromDate(DateTime(2023, 6, 21, 14, 10)),
    });

    print('Sample messages added to chat document.');
  } catch (e) {
    print('Error adding sample data: $e');
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp();
    await addSampleData();
    print("Sample data added successfully.");
  } catch (e) {
    print("Error initializing Firebase: $e");
  }
  runApp(Container()); // Temporary app to avoid errors
}
