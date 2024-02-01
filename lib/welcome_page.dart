import 'package:empowering_questions_mobile/controller/user_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:go_router/go_router.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(3),
      child: Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Welcome",
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              const Text(
                "Bla bla bla bla ",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              SignInButton(
                Buttons.Google,
                onPressed: () async {
                  try {
                    final user = await UserController.loginWithGoogle();
                    if (user != null) {
                      if (context.mounted) context.go('/register');
                    }
                  } on FirebaseAuthException catch (error) {
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content:
                              Text(error.message ?? "Somethink went wrong")));
                    }
                  } catch (error) {
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(error.toString())));
                    }
                  }
                },
              ),
              TextButton(
                  onPressed: () async {
                    final user = await UserController.loginByAnonymously();
                    if (user != null) {
                      if (context.mounted) context.go('/register');
                    }
                  },
                  child: const Text("Login Anonymously"))
            ],
          ),
        ),
      ),
    );
  }
}
