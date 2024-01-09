import 'package:empowering_questions_mobile/controller/user_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return SignInButton(
      Buttons.Google,
      onPressed: () async {
        try {
          final user = await UserController.loginWithGoogle();
          if (user != null) {
            print("You are inside!!");
            context.go('/');
          }
        } on FirebaseAuthException catch (error) {
          print(error.message);
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(error.message ?? "Somethink went wrong")));
        } catch (error) {
          print(error);
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(error.toString())));
        }
      },
    );
  }
}
