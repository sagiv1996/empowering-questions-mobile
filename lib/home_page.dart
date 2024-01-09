import 'package:empowering_questions_mobile/controller/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              foregroundImage:
                  NetworkImage(UserController.user?.photoURL ?? ''),
            ),
            Text(UserController.user?.displayName ?? ''),
            ElevatedButton(
                onPressed: () async {
                  await UserController.signOut();
                  context.go('/');
                },
                child: Text('Logout')),
            ElevatedButton(
                onPressed: () async {
                  context.go('/login-page');
                },
                child: Text('login page'))
          ],
        ),
      ),
    );
  }
}
