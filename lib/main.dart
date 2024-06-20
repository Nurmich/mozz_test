import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import './screens/chats_screen.dart';
import './providers/chat_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ChatProvider()),
      ],
      child: MaterialApp(
        title: 'Messenger App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ChatsScreen(),
      ),
    );
  }
}
