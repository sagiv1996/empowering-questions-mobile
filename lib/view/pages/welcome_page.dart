import 'package:empowering_questions_mobile/heberw_string.dart';
import 'package:empowering_questions_mobile/view/pages/register_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WelcomePage extends StatelessWidget {
  static const String routeName = "/welcome";
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
                HebrewString.welcomePageTitle,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              const Text(
                HebrewString.welcomePageBody,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              TextButton(
                  onPressed: () {
                    context.go(RegisterPage.routeName);
                  },
                  child: const Text(HebrewString.welcomePageLoginAnonymously))
            ],
          ),
        ),
      ),
    );
  }
}
