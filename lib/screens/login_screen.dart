import 'package:flutter/material.dart';
import '../widgets/auth_form.dart';
import 'register_screen.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = '/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.message,
                size: 100,
                color: Colors.blue,
              ),
              SizedBox(height: 20),
              AuthForm(isLogin: true),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context)
                .pushReplacementNamed(RegisterScreen.routeName);
          },
          child: const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Don't have an account?",
                style: TextStyle(),
              ),
              Text(' Register'),
            ],
          ),
        ),
      ),
    );
  }
}
