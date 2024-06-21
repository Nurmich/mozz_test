import 'package:flutter/material.dart';
import 'screens/chats_screen.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';

class AppRoutes {
  static const String login = LoginScreen.routeName;
  static const String register = RegisterScreen.routeName;
  static const String chats = ChatsScreen.routeName;

  static Map<String, WidgetBuilder> getRoutes(BuildContext context) {
    return {
      login: (ctx) => LoginScreen(),
      register: (ctx) => RegisterScreen(),
      chats: (ctx) => ChatsScreen(),
    };
  }
}
